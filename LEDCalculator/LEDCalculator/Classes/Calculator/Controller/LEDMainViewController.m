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
       
        LEDResultViewController *reVc = [LEDResultViewController new];
        reVc.reArr = [LEDResultModel resultModelArrayWithResultCountArray:nil];
        [weakSelf.navigationController pushViewController:reVc animated:YES];
        
    }];
    

    
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
