//
//  LEDMainViewController.m
//  LEDCalculator
//
//  Created by wyman on 2017/5/3.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import "LEDMainViewController.h"
#import "LEDMianView.h"
#import "LEDResultViewController.h"
#import "LEDResultModel.h"

@interface LEDMainViewController ()


@end

@implementation LEDMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    LEDMianView *measuerView = [[LEDMianView alloc] init];
//    measuerView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view addSubview:measuerView];
    [measuerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
   
    
    __weak typeof(self)weakSelf = self;
    [self wy_observeNotificationName:@"calculatorBtnClick" fromSender:nil handle:^(NSNotification *noti) {
        [weakSelf.view endEditing:YES];
        LEDResultViewController *reVc = [LEDResultViewController new];
        
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"result" withExtension:@"plist"];
        NSArray *arr = [NSArray arrayWithContentsOfURL:url];
        reVc.reArr = [NSArray yy_modelArrayWithClass:[LEDResultModel class] json:arr];
        [weakSelf.navigationController pushViewController:reVc animated:YES];
        
    }];
    
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
    [jsonDictArr writeToFile:@"/Users/wyman/Desktop/secureCommunication/result.plist" atomically:YES];
    

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
