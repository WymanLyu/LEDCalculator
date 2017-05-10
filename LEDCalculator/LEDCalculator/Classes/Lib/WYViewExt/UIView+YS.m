//
//  UIView+YS.m
//  HeiPa
//
//  Created by wyman on 2016/12/16.
//  Copyright © 2016年 tykj. All rights reserved.
//

#import "UIView+YS.h"
#import <objc/runtime.h>

@implementation UIView (YS)

#pragma mark - 提示HUD
- (void)ys_showAlterInCenterWithText:(NSString *)text {
    [UIView ys_showAlterInCenter:[UIApplication sharedApplication].keyWindow withText:text];
}

+ (void)ys_showAlterInCenter:(UIView *)view withText:(NSString *)text {
    if(view == nil){
        return;
    }
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.mode = MBProgressHUDModeText;
    HUD.detailsLabel.text = text;
    HUD.margin = 10.f;
    HUD.center = view.center;
    HUD.removeFromSuperViewOnHide = YES;
    [HUD hideAnimated:YES afterDelay:1.5];
}

+ (void)ys_showAlter:(UIView *)view withText:(NSString *)text withOffset:(float)offset {
    if(view == nil){
        return;
    }
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.mode = MBProgressHUDModeText;
    HUD.detailsLabel.text = text;
    HUD.margin = 10.f;
    HUD.offset = CGPointMake(HUD.offset.x, offset);
    HUD.removeFromSuperViewOnHide = YES;
    [HUD hideAnimated:YES afterDelay:1.5];
}

- (void)ys_setBorder {
//    self.layer.borderColor = [UIColor ys_colorWithHexInt:0xececec].CGColor;
    self.layer.cornerRadius = 2;
    self.layer.borderWidth = 1;
    self.clipsToBounds = YES;
}

#pragma mark - 静默视图
static const void *ys_nullViewValueKey = &ys_nullViewValueKey;
static const void *ys_loadingViewValueKey = &ys_loadingViewValueKey;
static const void *ys_loadingMaskViewValueKey = &ys_loadingMaskViewValueKey;

- (void)setYs_nullView:(UIView *)ys_nullView {
    objc_setAssociatedObject(self, ys_nullViewValueKey, ys_nullView, OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)ys_nullView {
    return objc_getAssociatedObject(self,ys_nullViewValueKey);
}

- (void)setYs_loadingView:(UIView *)ys_loadingView {
    objc_setAssociatedObject(self, ys_loadingViewValueKey, ys_loadingView, OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)ys_loadingView {
    return objc_getAssociatedObject(self,ys_loadingViewValueKey);
}

- (void)setYs_loadingMaskView:(UIView *)ys_loadingMaskView {
    objc_setAssociatedObject(self, ys_loadingMaskViewValueKey, ys_loadingMaskView, OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)ys_loadingMaskView {
    return objc_getAssociatedObject(self,ys_loadingMaskViewValueKey);
}

- (void)ys_hideOtherViewAndShowView:(UIView *)view {
    for (UIView *subView in self.subviews) {
//        if ([subView isKindOfClass:[MJRefreshHeader class]]) { // 屏蔽下拉刷新
//            continue;
//        }
        [subView setHidden:YES];
    }
    view.hidden = NO;
}

- (void)ys_showOtherViewAndHideView:(UIView *)view {
    for (UIView *subView in self.subviews) {
//        if ([subView isKindOfClass:[MJRefreshHeader class]]) { // 屏蔽下拉刷新
//            continue;
//        }
        [subView setHidden:NO];
    }
    view.hidden = YES;
}

/// > 空视图
- (void)ys_showNullView:(UIView *(^)(NullView *defaultNullView))nullViewHandle heightOffset:(CGFloat)offset {
    // 0.懒加载空视图
    if (!self.ys_nullView) {
        self.ys_nullView = [NullView new];
    }
    // 1.更新自定义的空视图
    if (nullViewHandle) {
        UIView *customNullView = nullViewHandle((NullView *)self.ys_nullView);
        if (customNullView != self.ys_nullView) {
            [self.ys_nullView removeFromSuperview];
            self.ys_nullView = customNullView;
        }
    }
    // 2.调整位置
    self.ys_nullView.frame = CGRectMake(self.frame.size.width*0.5-NULL_WIDTH*0.5, fitH(234), NULL_WIDTH, NULL_HEIGHT);
    self.ys_nullView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    if (offset) {
        CGRect newframe = self.ys_nullView.frame;
        newframe.origin.y += offset;
        self.ys_nullView.frame = newframe;
    }
    // 3.添加到视图渲染层级
    if (![self.subviews containsObject:self.ys_nullView]) {
        [self addSubview:self.ys_nullView];
    }
    // 4.显示到最前面
    if (self.subviews.lastObject != self.ys_nullView) {
        [self bringSubviewToFront:self.ys_nullView];
    }
    // 5.隐藏其他视图后显示
    [self ys_hideOtherViewAndShowView:self.ys_nullView];
}

- (void)ys_configNullView:(UIView *(^)(NullView *defaultNullView))nullViewConfig {
    // 0.懒加载空视图
    if (!self.ys_nullView) {
        self.ys_nullView = [NullView new];
    }
    // 配置空视图
    if (nullViewConfig) {
        UIView *customNullView = nullViewConfig((NullView *)self.ys_nullView);
        if (customNullView != self.ys_nullView) {
            [self.ys_nullView removeFromSuperview];
            self.ys_nullView = customNullView;
        }
    }
}

- (void)ys_hideNullView {
    // 0.显示其他视图并隐藏空视图
    [self ys_showOtherViewAndHideView:self.ys_nullView];
}

- (void)ys_nullViewAddTarget:(id)target action:(SEL)sel {
    // 0.懒加载空视图
    if (!self.ys_nullView) {
        self.ys_nullView = [NullView new];
    }
    [self.ys_nullView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:sel]];
}

/// > 加载视图

- (void)ys_startLodingHideOtherView {
    // 1.懒加载加载视图
    if (!self.ys_loadingView) {
        self.ys_loadingView = [LoadingView new];
        self.ys_loadingView.frame = CGRectMake(self.frame.size.width*0.5-LOADING_WIDTH*0.5, self.frame.size.height*0.5-LOADING_HEIGHT*0.5, LOADING_WIDTH, LOADING_HEIGHT);
    }
    // 2.添加到视图渲染层级
    if (![self.subviews containsObject:self.ys_loadingView]) {
        [self addSubview:self.ys_loadingView];
    }
    // 3.显示到最前面
    if (self.subviews.lastObject != self.ys_loadingView) {
        [self bringSubviewToFront:self.ys_loadingView];
    }
    // 4.隐藏其他视图并显示
    [self ys_hideOtherViewAndShowView:self.ys_loadingView];
    // 5.加载动画
    [(LoadingView *)self.ys_loadingView startLoading];
}

- (void)ys_startLoding {
    // 1.懒加载加载视图
    if (!self.ys_loadingView) {
        self.ys_loadingView = [LoadingView new];
        self.ys_loadingView.frame = CGRectMake(self.frame.size.width*0.5-LOADING_WIDTH*0.5, self.frame.size.height*0.5-LOADING_HEIGHT*0.5, LOADING_WIDTH, LOADING_HEIGHT);
    }
    // 2.添加到视图渲染层级
    if (![self.subviews containsObject:self.ys_loadingView]) {
        [self addSubview:self.ys_loadingView];
    }
    // 3.显示到最前面
    if (self.subviews.lastObject != self.ys_loadingView) {
        [self bringSubviewToFront:self.ys_loadingView];
    }
    // 4.添加mask阻止其他操作
    if (!self.ys_loadingMaskView) {
        UIView *maskView = [UIView new];
        maskView.frame = self.bounds;
        self.ys_loadingMaskView = maskView;
    }
    if (![self.subviews containsObject:self.ys_loadingMaskView]) {
        [self addSubview:self.ys_loadingMaskView];
        [self insertSubview:self.ys_loadingMaskView belowSubview:self.ys_loadingView];
    }
    self.ys_loadingView.hidden = NO;

    // 5.加载动画
    [(LoadingView *)self.ys_loadingView startLoading];
}

- (void)ys_stopLoding {
     [self ys_showOtherViewAndHideView:self.ys_loadingView];
    if (self.ys_loadingMaskView) {
        [self.ys_loadingMaskView removeFromSuperview];
    }
    [(LoadingView *)self.ys_loadingView stopLoading];
}


@end
