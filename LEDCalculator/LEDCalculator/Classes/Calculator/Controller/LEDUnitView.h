//
//  LEDUnitView.h
//  LEDCalculator
//
//  Created by 王智明 on 2017/5/4.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LEDUnitModel.h"

@interface LEDUnitView : UIView

@property(nonatomic , weak) UITextField  *unitSizeView;

@property (nonatomic, strong) LEDUnitModel *selectedSubUnit;

@end
