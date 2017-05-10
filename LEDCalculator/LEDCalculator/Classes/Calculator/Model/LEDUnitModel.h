//
//  LEDUnitModel.h
//  LEDCalculator
//
//  Created by wyman on 2017/5/10.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

@interface LEDUnitModel : NSObject <YYModel>

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray *subDataArr;

// 子单元板属性
@property (nonatomic, assign) int A; // 宽
@property (nonatomic, assign) int B; // 高
@property (nonatomic, assign) int width; // 像素宽
@property (nonatomic, assign) int height;// 像素高
@property (nonatomic, assign) int power_dissipation; // 工耗
@property (nonatomic, assign) int voltage; // 电源带载



@end
