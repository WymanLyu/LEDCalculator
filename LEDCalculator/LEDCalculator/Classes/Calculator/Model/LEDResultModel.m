//
//  LEDResultModel.m
//  LEDCalculator
//
//  Created by wyman on 2017/5/8.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import "LEDResultModel.h"

@implementation LEDResultModel


+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{@"resultFieldArr" : [LEDResultFieldModel class]};
}


+ (NSArray <LEDResultModel *>*)resultModelArrayWithResultCountArray:(NSArray *)arr {
    
    NSArray *jsonDictArr = @[
                               @{
                                   @"title" : @"实际尺寸",
                                   @"resultFieldArr" : @[
                                           @{
                                               @"des" : @"",
                                               @"unit" : @"MM",
                                               @"count" : @"1000"
                                               },
                                           @{
                                               @"des" : @"",
                                               @"unit" : @"MM",
                                               @"count" : @"1000"
                                               }
                                           ]
                                   },
                               @{
                                   @"title" : @"单元板数",
                                   @"resultFieldArr" : @[
                                           @{
                                               @"des" : @"长",
                                               @"unit" : @"张",
                                               @"count" : @"1000"
                                               },
                                           @{
                                               @"des" : @"高",
                                               @"unit" : @"张",
                                               @"count" : @"1000"
                                               }
                                           ]
                                   },
                               @{
                                   @"title" : @"背条尺寸",
                                   @"resultFieldArr" : @[
                                           @{
                                               @"des" : @"",
                                               @"unit" : @"MM",
                                               @"count" : @"1000"
                                               }
                                           ]
                                   },
                               @{
                                   @"title" : @"含边框尺寸",
                                   @"resultFieldArr" : @[
                                           @{
                                               @"des" : @"",
                                               @"unit" : @"MM",
                                               @"count" : @"1000"
                                               },
                                           @{
                                               @"des" : @"",
                                               @"unit" : @"MM",
                                               @"count" : @"1000"
                                               }
                                           ]
                                   },
                               @{
                                   @"title" : @"电源数量",
                                   @"resultFieldArr" : @[
                                           @{
                                               @"des" : @"",
                                               @"unit" : @"台",
                                               @"count" : @"1000"
                                               }
                                           ]
                                   },
                               @{
                                   @"title" : @"整屏功率",
                                   @"resultFieldArr" : @[
                                           @{
                                               @"des" : @"",
                                               @"unit" : @"W",
                                               @"count" : @"1000"
                                               }
                                           ]
                                   },
                               @{
                                   @"title" : @"推荐用卡",
                                   @"resultFieldArr" : @[]
                                   }
                               ];
    return [NSArray yy_modelArrayWithClass:[LEDResultModel class] json:jsonDictArr];    
}

@end

@implementation LEDResultFieldModel

@end

