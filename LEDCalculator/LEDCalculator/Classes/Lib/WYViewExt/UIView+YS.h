//
//  UIView+YS.h
//  HeiPa
//
//  Created by wyman on 2016/12/16.
//  Copyright © 2016年 tykj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NullView.h"
#import "LoadingView.h"

@interface UIView (YS)

#pragma mark - 提示

/** 加载提示文案到对应视图 */
+ (void)ys_showAlter:(UIView *)view withText:(NSString *)text withOffset:(float)offset;

/** 加载到视图中心 */
+ (void)ys_showAlterInCenter:(UIView *)view withText:(NSString *)text;

/** 加载到自己中心 */
- (void)ys_showAlterInCenterWithText:(NSString *)text;

/** 设置边框 */
- (void)ys_setBorder;

#pragma mark - 静默视图
///> 空视图
@property (nonatomic, strong) UIView *ys_nullView;
/** 配置空视图样式 */
- (void)ys_configNullView:(UIView *(^)(NullView *defaultNullView))nullViewConfig;
/** 配置空视图点击操作 */
- (void)ys_nullViewAddTarget:(id)target action:(SEL)sel;
/** 显示空视图
 * nullViewHandle : 修改空视图样式，如果为空则会按照ys_configNullView的样式, 如果没有配置ys_configNullView则是默认样式
 * offset         : 调整垂直方向的间距
 */
- (void)ys_showNullView:(UIView *(^)(NullView *defaultNullView))nullViewHandle heightOffset:(CGFloat)offset;
/** 隐藏空视图 */
- (void)ys_hideNullView;

///> 加载视图
@property (nonatomic, strong) UIView *ys_loadingView;
@property (nonatomic, strong) UIView *ys_loadingMaskView;
/** 开始加载【默认是隐藏其他视图】 */
- (void)ys_startLodingHideOtherView;
/** 开始加载【默认是不隐藏其他视图】 */
- (void)ys_startLoding;
/** 停止加载 */
- (void)ys_stopLoding;


@end
