//
//  LEDTextField.m
//  LEDCalculator
//
//  Created by wyman on 2017/5/10.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import "LEDTextField.h"

@implementation LEDTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    self.borderStyle =UITextBorderStyleNone;
}


- (CGRect)textRectForBounds:(CGRect)bounds {
    
    return CGRectInset(bounds, 2, 1);
    
}


- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 2, 1);
    
}


@end
