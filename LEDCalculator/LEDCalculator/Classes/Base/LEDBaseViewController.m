//
//  LEDBaseViewController.m
//  LEDCalculator
//
//  Created by wyman on 2017/5/3.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import "LEDBaseViewController.h"

@interface LEDBaseViewController ()
@property (nonatomic, strong) CATextLayer *textLayer;

@end

@implementation LEDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *titleView = [UILabel new];
    titleView.frame = CGRectMake(0, 0, kScreenWidth*3, 44);
//    titleView.text = @"欢迎使用LED屏工程计算器，该软件由云南尚色科技有限公司提供，本公司承接各地LED显示屏工程，欢迎咨询：40008-39178";
    titleView.textColor = [UIColor whiteColor];
    [self.navigationItem setTitleView:titleView];
    
//    titleView.layer
    CGFloat h = [@"one" wy_getHeightInOneLineWithFont:[UIFont systemFontOfSize:18.0f]];
    CGFloat w = [@"欢迎使用LED屏工程计算器，该软件由云南尚色科技有限公司提供，本公司承接各地LED显示屏工程，欢迎咨询：40008-39178" wy_getWidthInOneLineWithFont:[UIFont systemFontOfSize:18.0f]];
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    textLayer.frame =  CGRectMake(0, (44-h) *0.5, w, h);
    textLayer.string = @"欢迎使用LED屏工程计算器，该软件由云南尚色科技有限公司提供，本公司承接各地LED显示屏工程，欢迎咨询：40008-39178";
    textLayer.fontSize = 18.0f;
    textLayer.alignmentMode = @"center";
    [titleView.layer addSublayer:textLayer];
    _textLayer = textLayer;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"position.x"];
    ani.fromValue = @(kScreenWidth*2);
    ani.toValue= @(-self.textLayer.position.x);
    ani.duration = 15;
    ani.repeatCount = MAXFLOAT;
    [self.textLayer addAnimation:ani forKey:@"ani"];

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
