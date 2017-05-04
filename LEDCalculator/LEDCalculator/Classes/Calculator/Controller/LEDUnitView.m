//
//  LEDUnitView.m
//  LEDCalculator
//
//  Created by 王智明 on 2017/5/4.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import "LEDUnitView.h"
#import "LEDUnitSizeView.h"

@interface LEDUnitView ()

/** 标题 */
@property(nonatomic , weak) UILabel  *titleLabel;

/** 按钮 */
@property(nonatomic , weak) LEDUnitSizeView  *unitSizeView;

/** 分割线 */
@property(nonatomic , weak) UIView  *separLineView;

/** 计算按钮 */
@property(nonatomic , weak) UIButton  *calculatorBtn;

@end

static CGFloat const margin = 5;

@implementation LEDUnitView
//MARK:懒加载
- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"单元板型号:";
        titleLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (LEDUnitSizeView *)unitSizeView {
  
    if (!_unitSizeView) {
        LEDUnitSizeView *sizeView = [[LEDUnitSizeView alloc] init];
        NSArray *items =  @[@"单双色",@"室内全彩", @"户外全彩"];
        sizeView.items = items;
        [self addSubview:sizeView];
        _unitSizeView = sizeView;
    }
    return _unitSizeView;

}



- (UIView *)separLineView {
   
    if (!_separLineView) {
        UIView *separLineView = [[UIView alloc] init];
        separLineView.backgroundColor = [UIColor colorWithRed:234/255.0f green:234/255.0f blue:234/255.0f alpha:1];
        [self addSubview:separLineView];
        _separLineView = separLineView;
    }

    return _separLineView;
}

- (UIButton *)calculatorBtn {
    
    if (!_calculatorBtn) {
        UIButton *calculatorBtn = [[UIButton alloc] init];
        [calculatorBtn setTitle:@"计算" forState:UIControlStateNormal];
        [calculatorBtn setBackgroundColor:[UIColor lightGrayColor]];
        [self addSubview:calculatorBtn];
        _calculatorBtn = calculatorBtn;
    }
    return _calculatorBtn;
    
    
}
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self addConstranint];
    }
    
    return self;
}

- (void)addConstranint {
    
      __weak typeof(self) weakSelf = self;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.mas_left).mas_offset(fit5W(3 *margin));
        make.top.mas_equalTo(weakSelf.mas_top).mas_offset(margin);
        make.right.mas_equalTo(weakSelf.mas_right).mas_offset(fit5W(-2*margin));
    }];
    
    [self.unitSizeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.mas_left).mas_offset(fit5W(3*margin));
        make.top.mas_equalTo(weakSelf.titleLabel.mas_bottom).mas_offset(fit5H(2*margin));
        make.right.mas_equalTo(weakSelf.mas_right).mas_offset(fit5W(-3*margin));
        make.height.mas_equalTo(fit5H(30));
        
    }];
    
    [self.separLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.mas_left);
        make.top.mas_equalTo(weakSelf.unitSizeView.mas_bottom).mas_offset(margin);
        make.right.mas_equalTo(weakSelf.mas_right);
        make.height.mas_equalTo(1);
    }];
    
    [self.calculatorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(weakSelf.mas_centerX);
        make.top.mas_equalTo(weakSelf.separLineView.mas_bottom).mas_offset(fit5H(2*margin));
        make.height.mas_equalTo(fit5H(35));
        make.width.mas_equalTo(fit5W(100));
        
    }];
    

}


@end
