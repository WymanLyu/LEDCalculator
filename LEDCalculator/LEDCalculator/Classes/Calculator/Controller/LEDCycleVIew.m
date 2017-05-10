//
//  LEDCycleVIew.m
//  LEDCalculator
//
//  Created by 王智明 on 2017/5/4.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import "LEDCycleVIew.h"
#import <SDCycleScrollView.h>
#import "UIColor+WY.h"

@interface LEDCycleVIew  ()<SDCycleScrollViewDelegate>

/** 滚动  */
@property(nonatomic , strong) SDCycleScrollView * scycleView;

@end

@implementation LEDCycleVIew

- (instancetype)initWithFrame:(CGRect)frame {
  
    if (self = [super initWithFrame:frame]) {
       
        _scycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:@"banner"]];
        _scycleView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
//        _scycleView.backgroundColor = [UIColor wy_randomColor];
        [self addSubview:self.scycleView];
        
    }

    return self;
}

- (void)layoutSubviews {
  
    [super layoutSubviews];
    
    self.scycleView.frame = self.bounds;
    
}

@end
