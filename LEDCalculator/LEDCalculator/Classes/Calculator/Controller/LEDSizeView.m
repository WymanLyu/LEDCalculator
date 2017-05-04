//
//  LEDSizeView.m
//  LEDCalculator
//
//  Created by 王智明 on 2017/5/4.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import "LEDSizeView.h"

static CGFloat const margin =  5;
static CGFloat const itemH = 30;
@implementation LEDSizeView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        
        
    }
    
    return self;
}

- (void)setItems:(NSArray *)items {
  
    _items = items;
    
    for (NSInteger i = 0; i < items.count; i ++) {
        
        UIButton *itemBtn = [[UIButton alloc] init];
        itemBtn.backgroundColor = [UIColor lightGrayColor];
        [itemBtn setTitle:items[i] forState:UIControlStateNormal];
        itemBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:itemBtn];
    }

}

- (void)layoutSubviews {
   
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    
    CGFloat itemW = (self.frame.size.width - (count - 1) * margin) / count;
    CGFloat itehH = itemH;
    CGFloat itemY = 0;
    
    for (NSInteger i = 0; i < count; i++) {
        
        UIButton *itemBtn = self.subviews[i];
        
        CGFloat itemX = i * (itemW + margin);
        
        itemBtn.frame = CGRectMake(itemX, itemY, itemW, itehH);
        
    }
  
}

@end
