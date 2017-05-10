//
//  NullView.m
//  HeiPa
//
//  Created by wyman on 2017/3/14.
//  Copyright © 2017年 tykj. All rights reserved.
//

#import "NullView.h"
#import <objc/runtime.h>

@interface NullView ()

@property (nonatomic, weak) UIImageView *iconView;

@property (nonatomic, weak) UILabel *desLbl;

@end

@implementation NullView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        // 0.图标
        UIImageView *iconView = [[UIImageView alloc] init];
        iconView.image = [UIImage imageNamed:@"blanckpage_no music"];
        [self addSubview:iconView];
        _iconView = iconView;
        
        // 1.说明
        UILabel *desLbl = [UILabel new];
        desLbl.text = @"当前无内容";
        desLbl.font = [UIFont systemFontOfSize:12];
//        desLbl.textColor = [UIColor ys_colorWithHexInt:0x999999];
        desLbl.textAlignment = NSTextAlignmentCenter;
        [self addSubview:desLbl];
        _desLbl = desLbl;
       
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    CGRect tempRect = frame;
    tempRect.size.width = NULL_WIDTH;
    tempRect.size.height = NULL_HEIGHT;
    [super setFrame:tempRect];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect superRect = self.bounds;
    // 图标居中往上
    CGFloat iconW = 90;
    CGFloat iconH = 128;
    CGFloat iconX = superRect.size.width*0.5 - iconW*0.5;
    CGFloat iconY = 0;
    self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 说明
    CGFloat desW = [self.desLbl.text wy_getWidthInOneLineWithFont:[UIFont systemFontOfSize:12]];// iconW;
//    desW = (desW > (0.8*self.bounds.size.width)) ? (0.8*self.bounds.size.width) : desW;// 防止过长
    CGFloat desH = 22;
    CGFloat desX = superRect.size.width*0.5 - desW*0.5;
    CGFloat desY = CGRectGetMaxY( self.iconView.frame) + 15;
    self.desLbl.frame = CGRectMake(desX, desY, desW, desH);
}

- (void)setNullIconImageName:(NSString *)nullIconImageName {
    _nullIconImageName = nullIconImageName;
    self.iconView.image = [UIImage imageNamed:_nullIconImageName];
}

- (void)setDesText:(NSString *)desText {
    _desText = desText;
    self.desLbl.text = _desText;
}

@end
