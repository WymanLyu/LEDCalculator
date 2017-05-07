//
//  LEDResultViewController.m
//  LEDCalculator
//
//  Created by wyman on 2017/5/7.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import "LEDResultViewController.h"
#import "SDCycleScrollView.h"

@interface LEDResultViewController ()<SDCycleScrollViewDelegate>



/** 滚动  */
@property(nonatomic , strong) SDCycleScrollView *scycleView;

@end

@implementation LEDResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"结果页";
    
    CGFloat h = kScreenHeight - fit5H(340)-64;// 控制器往下移了64
    [self.scycleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.height.mas_equalTo(h);
        
    }];
}

- (void)setReArr:(NSArray *)reArr {
    _reArr = reArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 懒加载

- (SDCycleScrollView *)scycleView {
    if (!_scycleView) {
        _scycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:nil];
        _scycleView.backgroundColor = [UIColor wy_randomColor];
        [self.view addSubview:self.scycleView];
    }
    return _scycleView;
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
