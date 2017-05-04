//
//  LEDMeasureView.m
//  LEDCalculator
//
//  Created by 王智明 on 2017/5/4.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import "LEDMeasureView.h"
#import "LEDInpuView.h"
@interface LEDMeasureView ()
/** 目标  */
@property(nonatomic , weak) UILabel * measureLabel;
/** detail */
@property(nonatomic , weak) UILabel  *detailLabel;
/** inputView */
@property(nonatomic , weak) LEDInpuView  *ledinputView;

/** inputView */
@property(nonatomic , weak) LEDInpuView  *ledinputViewH;

@end

@implementation LEDMeasureView
{
    CGFloat  margin;

}

//MARK:懒加载


- (UILabel *)measureLabel {
   
    if (!_measureLabel) {
        UILabel *measuerLabel = [[UILabel alloc] init];
        measuerLabel.text = @"目标尺寸:";
        measuerLabel.font = [UIFont systemFontOfSize:18];
        [self addSubview:measuerLabel];
        _measureLabel = measuerLabel;
    }
   
    return _measureLabel;
}

- (UILabel *)detailLabel {
   
    if (!_detailLabel) {
        UILabel *detailLabel = [[UILabel alloc] init];
        detailLabel.text = @"(请在下面空格处手动输入目标LED屏的尺寸)";
        detailLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:detailLabel];
        _detailLabel = detailLabel;
    }
    
    return _detailLabel;

}

-(LEDInpuView *)ledinputView {
  
    if (!_ledinputView) {
        
        LEDInpuView *inputView = [LEDInpuView inptuView];
        inputView.title = @"长:";
        [self addSubview:inputView];
        _ledinputView = inputView;
    }
    return _ledinputView;
}

- (LEDInpuView *)ledinputViewH {
  
    if (!_ledinputViewH) {
        LEDInpuView *inpuView = [LEDInpuView inptuView];
        inpuView.title = @"高:";
        [self addSubview:inpuView];
        _ledinputViewH = inpuView;
    }
    
    return _ledinputViewH;

}

- (instancetype)initWithFrame:(CGRect)frame {
   
    if (self = [super initWithFrame:frame]) {
        
        margin = fit5W(5);
        [self setupUI];
        [self addconstraint];
        
    }
    
    return self;
}

//MARK:UI
- (void)setupUI {
    
//    [self addSubview:self.titleLabel];
    self.backgroundColor = [UIColor whiteColor];

}

//MARK:约束
- (void)addconstraint {
    
    __weak typeof(self) weakSelf = self;
    [self.measureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.mas_left).mas_offset(3 *margin);
        make.top.mas_equalTo(weakSelf.mas_top).mas_offset(2*margin);
        make.right.mas_equalTo(weakSelf.mas_right).mas_offset(-2*margin);
        
    }];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.measureLabel.mas_left).mas_offset(0);
        make.top.mas_equalTo(weakSelf.measureLabel.mas_bottom).mas_offset(2);
    }];
    
    [self.ledinputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.measureLabel.mas_left).mas_offset(-2*margin);
        make.top.mas_equalTo(weakSelf.detailLabel.mas_bottom).mas_offset(margin);
        make.width.mas_equalTo(fit5W(150));
        make.height.mas_equalTo(fit5H(45));
    }];
    
    [self.ledinputViewH mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.ledinputView.mas_right).mas_offset(3*margin);
        make.top.mas_equalTo(weakSelf.detailLabel.mas_bottom).mas_offset(margin);
        make.width.mas_equalTo(fit5W(150));
        make.height.mas_equalTo(fit5H(45));
    }];
    
    
  
}


@end
