//
//  LEDMianView.m
//  LEDCalculator
//
//  Created by 王智明 on 2017/5/4.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import "LEDMianView.h"
#import "LEDMeasureView.h"
#import "LEDModelView.h"
#import "LEDUnitView.h"
#import "LEDCycleVIew.h"
@interface LEDMianView ()

/** 目标  */
@property(nonatomic , strong) LEDMeasureView * measuerView;

/** 外框  */
@property(nonatomic , strong) LEDModelView * modelView;

/** 单元板  */
@property(nonatomic , strong) LEDUnitView * unitView;
/** 广告  */
@property(nonatomic , strong) LEDCycleVIew * scycleView;


@end



@implementation LEDMianView
//MARK:懒加载
- (LEDMeasureView *)measuerView {
    
    if (!_measuerView) {
        _measuerView = [[LEDMeasureView alloc] init];
    }
    return _measuerView;
    
}

- (LEDModelView *)modelView {
    
    if (!_modelView) {
        _modelView = [[LEDModelView alloc] init];
    }
    
    return _modelView;
}

- (LEDUnitView *)unitView {
   
    if (!_unitView) {
        _unitView = [[LEDUnitView alloc] init];
    }
    return _unitView;

}

- (LEDCycleVIew *)scycleView {
  
    if (!_scycleView) {
        _scycleView = [[LEDCycleVIew alloc] init];

    }

    return _scycleView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithRed:234/255.0f green:234/255.0f blue:234/255.0f alpha:1];
        [self setupUI];
        [self addContrasint];
    }
    return self;
    

}

- (void)setupUI {
   
    [self addSubview:self.measuerView];
    [self addSubview:self.modelView];
    [self addSubview:self.unitView];
    [self addSubview:self.scycleView];
    
    
}

- (void)addContrasint {
    
    __weak typeof(self) weakSelf = self;
    [self.measuerView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(weakSelf.mas_left);
        make.top.mas_equalTo(weakSelf.mas_top);
        make.right.mas_equalTo(weakSelf.mas_right);
        make.height.mas_equalTo(fit5H(100));
        
    }];
    
    [self.modelView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(weakSelf.mas_left);
        make.right.mas_equalTo(weakSelf.mas_right);
        make.top.mas_equalTo(weakSelf.measuerView.mas_bottom).mas_offset(1);
        make.height.mas_equalTo(fit5H(100));
        
    }];
    
    [self.unitView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(weakSelf.mas_left);
        make.right.mas_equalTo(weakSelf.mas_right);
        make.top.mas_equalTo(weakSelf.modelView.mas_bottom).mas_offset(1);
        make.height.mas_equalTo(fit5H(140));

    }];
    
    CGFloat h = kScreenHeight - fit5H(340);
    
    [self.scycleView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(weakSelf.mas_left);
        make.right.mas_equalTo(weakSelf.mas_right);
        make.top.mas_equalTo(weakSelf.unitView.mas_bottom).mas_offset(1);
        make.height.mas_equalTo(h);
        
    }];
    
}

@end
