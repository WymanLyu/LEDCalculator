//
//  LEDResultModel.h
//  LEDCalculator
//
//  Created by wyman on 2017/5/8.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

@interface LEDResultFieldModel : NSObject

@property (nonatomic, copy) NSString *des;

@property (nonatomic, copy) NSString *unit;

@property (nonatomic, copy) NSString *count;

@end

@interface LEDResultModel : NSObject<YYModel>

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<LEDResultFieldModel *> *resultFieldArr;

+ (NSArray <LEDResultModel *>*)resultModelArrayWithResultCountArray:(NSArray *)arr;


@end


