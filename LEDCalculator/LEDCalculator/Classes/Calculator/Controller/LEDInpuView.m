//
//  LEDInpuView.m
//  LEDCalculator
//
//  Created by 王智明 on 2017/5/4.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import "LEDInpuView.h"

@interface LEDInpuView ()

@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;

@property (weak, nonatomic) IBOutlet UILabel *mmLabel;


@end

@implementation LEDInpuView


- (void)awakeFromNib {
  
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
    self.textFiled.layer.cornerRadius = 4;
    self.textFiled.clipsToBounds = YES;
}

+ (instancetype)inptuView {
  
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}
- (void)setTitle:(NSString *)title {
  
    _title = title;
    self.sizeLabel.text = title;

}

@end
