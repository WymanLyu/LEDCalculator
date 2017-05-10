//
//  LEDUnitView.m
//  LEDCalculator
//
//  Created by 王智明 on 2017/5/4.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import "LEDUnitView.h"
#import "LEDUnitSizeView.h"
#import "LEDUnitModel.h"

@interface LEDUnitView ()<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

/** 标题 */
@property(nonatomic , weak) UILabel  *titleLabel;

/** 按钮 */
@property(nonatomic , weak) UITextField  *unitSizeView;
@property (nonatomic, weak) UIPickerView *pickView;

/** 分割线 */
@property(nonatomic , weak) UIView  *separLineView;

/** 计算按钮 */
@property(nonatomic , weak) UIButton  *calculatorBtn;

/** dataSource */
@property (nonatomic, weak) NSArray *dataArr;

@end

static CGFloat const margin = 5;

@implementation LEDUnitView


- (void)willMoveToSuperview:(UIView *)newSuperview {
    LEDUnitModel *unit = [self.dataArr firstObject];
    LEDUnitModel *subUnit = [unit.subDataArr firstObject];
    self.unitSizeView.text = subUnit.title;
}



//MARK:懒加载
- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"单元板型号:";
        titleLabel.font = [UIFont systemFontOfSize:20];
        titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (UITextField *)unitSizeView {
  
    if (!_unitSizeView) {

        UITextField *sizeView = [UITextField new];
        sizeView.backgroundColor = [UIColor lightGrayColor];
        sizeView.delegate = self;
        [self addSubview:sizeView];
        _unitSizeView = sizeView;
        
        UIPickerView *pickView = [UIPickerView new];
        pickView.dataSource = self;
        pickView.delegate = self;
        pickView.backgroundColor = [UIColor whiteColor];
        _pickView = pickView;
        _unitSizeView.inputView = pickView;
    
    }
    return _unitSizeView;

}



- (UIView *)separLineView {
   
    if (!_separLineView) {
        UIView *separLineView = [[UIView alloc] init];
//        separLineView.backgroundColor = [UIColor colorWithRed:234/255.0f green:234/255.0f blue:234/255.0f alpha:1];
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
        [calculatorBtn addTarget:self action:@selector(calculatorBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:calculatorBtn];
        calculatorBtn.layer.cornerRadius = 3;
        calculatorBtn.clipsToBounds = YES;
        _calculatorBtn = calculatorBtn;
    }
    return _calculatorBtn;
    
    
}

- (void)calculatorBtnClick:(UIButton *)btn {
    [self wy_postNotificationName:@"calculatorBtnClick" userInfo:nil finishHandle:nil];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
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

- (NSArray *)dataArr {
    if (!_dataArr) {
        
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"led" withExtension:@"plist"];
        NSArray *arr = [NSArray arrayWithContentsOfURL:url];
        _dataArr = [NSArray yy_modelArrayWithClass:[LEDUnitModel class] json:arr];
    }
    return _dataArr;
}


#pragma mark - delegate

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) { // 第一排
        return self.dataArr.count;
    } else {
        NSInteger index = [pickerView selectedRowInComponent:0];
        if (index == -1) {
            return 0;
        }
        LEDUnitModel *unit = [self.dataArr objectAtIndex:index];
        return unit.subDataArr.count;
    }
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (component == 0) { // 第一排
        LEDUnitModel *unit = [self.dataArr objectAtIndex:row];
        return unit.title;
    } else {
        NSInteger index = [pickerView selectedRowInComponent:0];
        if (index == -1) {
            return 0;
        }
        LEDUnitModel *unit = [self.dataArr objectAtIndex:index];
        LEDUnitModel *subUnit = [unit.subDataArr objectAtIndex:row];
        return subUnit.title;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (component == 0) {
        [pickerView selectRow:0 inComponent:1 animated:NO];
        [pickerView reloadComponent:1];
    }
    
    // 设置选中
    NSInteger index = [pickerView selectedRowInComponent:0];
    NSInteger row2 = [pickerView selectedRowInComponent:1];
    LEDUnitModel *unit = [self.dataArr objectAtIndex:index];
    LEDUnitModel *subUnit = [unit.subDataArr objectAtIndex:row2];
    self.unitSizeView.text = subUnit.title;
}



@end
