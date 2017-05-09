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
{
    __weak UIButton *_selectedBtn;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        
        
    }
    
    return self;
}

- (void)setItems:(NSArray *)items {
  
    _items = items;
    
    for (NSInteger i = 0; i < items.count; i ++) {
        
        UIButton *itemBtn = [[UIButton alloc] init];
        itemBtn.tag = i;
        [itemBtn addTarget:self action:@selector(itemBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        itemBtn.backgroundColor = [UIColor lightGrayColor];
        [itemBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [itemBtn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        [itemBtn setTitle:items[i] forState:UIControlStateNormal];
        itemBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        itemBtn.layer.cornerRadius = 3;
        itemBtn.clipsToBounds = YES;
        [self addSubview:itemBtn];
    }
    if (self.subviews.count > 0) {
        UIButton *firstBtn = [self.subviews firstObject];
        [self itemBtnClick:firstBtn];
    }
}

- (void)layoutSubviews {
   
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    
    CGFloat itemW = (self.frame.size.width - (count - 1) * fit5W(margin)) / count;
    CGFloat itehH = fit5H(itemH);
    CGFloat itemY = 0;
    
    for (NSInteger i = 0; i < count; i++) {
        
        UIButton *itemBtn = self.subviews[i];
        
        CGFloat itemX = i * (itemW + fit5W(margin));
        
        itemBtn.frame = CGRectMake(itemX, itemY, itemW, itehH);
        
    }
  
}

- (void)itemBtnClick:(UIButton *)btn {
    
    _selectedBtn.selected = NO;
    btn.selected = YES;
    _selectedBtn = btn;
    
    
}

@end
