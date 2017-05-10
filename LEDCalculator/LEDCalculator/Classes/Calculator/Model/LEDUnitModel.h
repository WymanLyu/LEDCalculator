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


@end
