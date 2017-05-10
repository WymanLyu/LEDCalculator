//
//  LEDMianView.h
//  LEDCalculator
//
//  Created by 王智明 on 2017/5/4.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LEDMeasureView.h"
#import "LEDModelView.h"
#import "LEDUnitView.h"
#import "LEDCycleVIew.h"

@interface LEDMianView : UIView

/** 目标  */
@property(nonatomic , strong) LEDMeasureView * measuerView;

/** 外框  */
@property(nonatomic , strong) LEDModelView * modelView;

/** 单元板  */
@property(nonatomic , strong) LEDUnitView * unitView;
/** 广告  */
@property(nonatomic , strong) LEDCycleVIew * scycleView;

@end
