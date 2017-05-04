//
//  LEDModelView.m
//  LEDCalculator
//
//  Created by 王智明 on 2017/5/4.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import "LEDModelView.h"
#import "LEDSizeView.h"
@interface LEDModelView ()

/** 标题 */
@property(nonatomic , weak) UILabel  *titleLabel;
/** 子标题 */
@property(nonatomic , weak) UILabel  *subtitleLabe;

/** 按钮 */
@property(nonatomic , weak) LEDSizeView  *sizeView;


@end
static CGFloat const margin = 5;

@implementation LEDModelView

//MARK:懒加载
- (UILabel *)titleLabel {
  
    if (!_titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"外框型号:";
        titleLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (UILabel *)subtitleLabe {
  
    if (!_subtitleLabe) {
        UILabel *subtileLabel = [[UILabel alloc] init];
        subtileLabel.text = @"(所标尺寸为单边的长度，请点选)";
        subtileLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:subtileLabel];
        _subtitleLabe = subtileLabel;
    }
 
    return _subtitleLabe;
}

- (LEDSizeView *)sizeView {
  
    if (!_sizeView) {
        LEDSizeView *sizeView = [[LEDSizeView alloc] init];
        NSArray *items = @[@"35mm",@"45mm",@"50mm",@"60mm",@"80mm",@"100mm"];
        sizeView.items = items;
        [self addSubview:sizeView];
        _sizeView = sizeView;
    }
    return _sizeView;
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
        make.top.mas_equalTo(weakSelf.mas_top).mas_offset(fit5H(margin));
        make.right.mas_equalTo(weakSelf.mas_right).mas_offset(fit5W(-2*margin));
    }];
    
    [self.subtitleLabe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.titleLabel.mas_left).mas_offset(0);
        make.top.mas_equalTo(weakSelf.titleLabel.mas_bottom).mas_offset(fit5H(2));
    }];
    
    CGFloat textH = fit5H(margin)+[self.titleLabel.text wy_getHeightInOneLineWithFont:self.titleLabel.font]+fit5H(2)+[self.subtitleLabe.text wy_getHeightInOneLineWithFont:self.subtitleLabe.font];
    
    [self.sizeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.mas_left).mas_offset(margin);
//        make.top.mas_equalTo(weakSelf.subtitleLabe.mas_bottom).mas_offset(fit5H(margin));
        make.right.mas_equalTo(weakSelf.mas_right).mas_offset(-margin);
        make.height.mas_equalTo(fit5H(30));
        make.centerY.equalTo(weakSelf.mas_centerY).mas_offset(textH*0.5); // 居中
    }];
    
}

@end
