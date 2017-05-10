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
@property (nonatomic, weak) LEDMianView *measuerView;

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
    _measuerView = measuerView;
   
    
    __weak typeof(self)weakSelf = self;
    [self wy_observeNotificationName:@"calculatorBtnClick" fromSender:nil handle:^(NSNotification *noti) {
        [weakSelf.view endEditing:YES];
        LEDResultViewController *reVc = [LEDResultViewController new];
        
//        NSURL *url = [[NSBundle mainBundle] URLForResource:@"result" withExtension:@"plist"];
//        NSArray *arr = [NSArray arrayWithContentsOfURL:url];
        
        NSArray *arr = [weakSelf caculate];
        if (!arr.count)return ;
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
                                             },
                                         @{
                                             @"des" : @"",
                                             @"unit" : @"MM^2",
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
                                             },
                                         @{
                                             @"des" : @"",
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
                                             },
                                         @{
                                             @"des" : @"",
                                             @"unit" : @"MM^2",
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
                                 @"resultFieldArr" : @[
                                         @{
                                             @"des" : @"",
                                             @"unit" : @"mm",
                                             @"count" : @"1000"
                                             }
                                         ]
                                 }
                             ];
    [jsonDictArr writeToFile:@"/Users/wyman/Desktop/secureCommunication/result.plist" atomically:YES];
    

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (NSArray *)caculate {
    
    if (!self.measuerView.measuerView.ledinputView.textFiled.text.length) {
        [UIView ys_showAlterInCenter:[UIApplication sharedApplication].keyWindow withText:@"请输入尺寸"];
        return nil;
    }
    if (!self.measuerView.measuerView.ledinputViewH.textFiled.text.length) {
        [UIView ys_showAlterInCenter:[UIApplication sharedApplication].keyWindow withText:@"请输入尺寸"];
        return nil;
    }
    
    // 计算 -入参
    // 尺寸
    int L = self.measuerView.measuerView.ledinputView.textFiled.text.intValue;
    int H = self.measuerView.measuerView.ledinputViewH.textFiled.text.intValue;
    // 型号
    NSRange strRange = NSMakeRange(0, self.measuerView.modelView.sizeView.selectedBtn.titleLabel.text.length-2);
    int border = [[self.measuerView.modelView.sizeView.selectedBtn.titleLabel.text substringWithRange:strRange] intValue];
    // 单元板
    int A = self.measuerView.unitView.selectedSubUnit.A;
    int B = self.measuerView.unitView.selectedSubUnit.B;
    int width = self.measuerView.unitView.selectedSubUnit.width;
    int height = self.measuerView.unitView.selectedSubUnit.height;
    int power_dissipation = self.measuerView.unitView.selectedSubUnit.power_dissipation;
    int voltage = self.measuerView.unitView.selectedSubUnit.voltage;
    
    
    // 计算 -出参
    //实际尺寸宽
    int C = (floor(L / A)) * A;
    //实际尺寸高
    int D = (floor(H / B)) * B;
    
    //单元板数宽
    int E_width = (floor(L / A));
    //单元板数高
    int E_height = (floor(H / B));
    //单元板数
    int E = (floor(L / A)) * (floor(H / B));
    
    //像素宽
    int pixel_width = (floor(L / A)) * width;
    //像素高
    int pixel_height = (floor(H / B)) * height;
    
    //含边框宽
    int border_C = (floor(L / A)) * A + border * 2;
    //含边框高
    int border_D = (floor(H / B)) * B + border * 2;


    //整频功率
    int capacity = E * power_dissipation;
    //电源数量
    int supply_num = ceil(E / voltage);
    //背条尺寸
    int bei_tiao = (floor(H / B)) * B + 36;
    
    return          @[
                             @{
                                 @"title" : @"实际尺寸",
                                 @"resultFieldArr" : @[
                                         @{
                                             @"des" : @"",
                                             @"unit" : @"MM",
                                             @"count" : @(C)
                                             },
                                         @{
                                             @"des" : @"",
                                             @"unit" : @"MM",
                                             @"count" : @(D)
                                             },
                                         @{
                                             @"des" : @"",
                                             @"unit" : @"MM^2",
                                             @"count" : @(C*D)
                                             }
                                         ]
                                 },
                             @{
                                 @"title" : @"单元板数",
                                 @"resultFieldArr" : @[
                                         @{
                                             @"des" : @"长",
                                             @"unit" : @"张",
                                             @"count" : @(E_width)
                                             },
                                         @{
                                             @"des" : @"高",
                                             @"unit" : @"张",
                                             @"count" : @(E_height)
                                             },
                                         @{
                                             @"des" : @"",
                                             @"unit" : @"张",
                                             @"count" : @(E)
                                             }
                                         ]
                                 },
                             @{
                                 @"title" : @"分辨率",
                                 @"resultFieldArr" : @[
                                         @{
                                             @"des" : @"",
                                             @"unit" : @"PX",
                                             @"count" : @(pixel_width)
                                             },
                                         @{
                                             @"des" : @"",
                                             @"unit" : @"PX",
                                             @"count" : @(pixel_height)
                                             },
                                         @{
                                             @"des" : @"",
                                             @"unit" : @"MM^2",
                                             @"count" : @(pixel_width*pixel_height)
                                             }
                                         ]
                                 },
                             @{
                                 @"title" : @"含边框尺寸",
                                 @"resultFieldArr" : @[
                                         @{
                                             @"des" : @"",
                                             @"unit" : @"MM",
                                             @"count" : @(border_C)
                                             },
                                         @{
                                             @"des" : @"",
                                             @"unit" : @"MM",
                                             @"count" : @(border_D)
                                             },
                                         @{
                                             @"des" : @"",
                                             @"unit" : @"MM^2",
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
                                             @"count" : @(capacity)
                                             }
                                         ]
                                 },
                             @{
                                 @"title" : @"电源数量",
                                 @"resultFieldArr" : @[
                                         @{
                                             @"des" : @"",
                                             @"unit" : @"台",
                                             @"count" : @(supply_num)
                                             }
                                         ]
                                 },

                             @{
                                 @"title" : @"背条尺寸",
                                 @"resultFieldArr" : @[
                                         @{
                                             @"des" : @"",
                                             @"unit" : @"MM",
                                             @"count" : @(bei_tiao)
                                             }
                                         ]
                                 }
//                            @{
//                                 @"title" : @"推荐用卡",
//                                 @"resultFieldArr" : @[
//                                         @{
//                                             @"des" : @"",
//                                             @"unit" : @"mm",
//                                             @"count" : @"1000"
//                                             }
//                                         ]
//                                 }
                             ];

    
    
    
    
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
