//
//  LEDResultViewController.m
//  LEDCalculator
//
//  Created by wyman on 2017/5/7.
//  Copyright © 2017年 wyman. All rights reserved.
//

#import "LEDResultViewController.h"
#import "SDCycleScrollView.h"
#import "LEDResultModel.h"

@interface LEDResultViewController ()<SDCycleScrollViewDelegate>



/** 滚动  */
@property(nonatomic , strong) SDCycleScrollView *scycleView;

@end

@implementation LEDResultViewController
{
    CGFloat scycleH;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"结果页";
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    CGFloat h = kScreenHeight - fit5H(340)-64;// 控制器往下移了64
    scycleH = fit5H(340)+64;
    [self.scycleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.height.mas_equalTo(h);
        
    }];
}

- (void)setReArr:(NSArray *)reArr {
    _reArr = reArr;
    
    CGFloat cellH = (fit5H(340)) / _reArr.count;
    LEDResultModel *resultCellModel = nil;
    for (int i = 0; i < _reArr.count; i++) {
        resultCellModel = [_reArr objectAtIndex:i];
    
        UIView *cell = [[UIView alloc] initWithFrame:CGRectMake(0, cellH*i, kScreenWidth, cellH)];

        [self.view addSubview:cell];
        // title
        UILabel *titleLbl = [UILabel new];
        titleLbl.font = [UIFont systemFontOfSize:18.f];
        titleLbl.textColor = [UIColor whiteColor];
        [cell addSubview:titleLbl];
        titleLbl.text = [NSString stringWithFormat:@"%@:", resultCellModel.title];
        CGFloat titlew = [titleLbl.text wy_getWidthInOneLineWithFont:titleLbl.font];
        titleLbl.frame =CGRectMake(10, 0, titlew, cellH);
        // 结果框
        CGFloat margin = fitW(8);
        CGFloat reX = CGRectGetMaxX(titleLbl.frame)+margin;
        for (int index = 0; index < resultCellModel.resultFieldArr.count; index++) {
            LEDResultFieldModel *fieldModel = resultCellModel.resultFieldArr[index];
            // 描述
            if (fieldModel.des.length) {
                UILabel *desLbl = [UILabel new];
                desLbl.font = [UIFont systemFontOfSize:16.0f];
                desLbl.textColor = [UIColor whiteColor];
                desLbl.text = fieldModel.des;
                CGFloat desW = [desLbl.text wy_getWidthInOneLineWithFont:desLbl.font];
                desLbl.frame = CGRectMake(reX, 0, desW, cellH);
                [cell addSubview:desLbl];
                reX += desW+margin;
            }
            // 结果框
            UILabel *reCountLbl = [UILabel new];
            reCountLbl.backgroundColor = [UIColor whiteColor];
            reCountLbl.layer.cornerRadius = 3;
            reCountLbl.layer.masksToBounds = YES;
            reCountLbl.textColor = [UIColor blackColor];
            reCountLbl.font = [UIFont systemFontOfSize:16.0f];
            reCountLbl.text = fieldModel.count;
            reCountLbl.textAlignment = NSTextAlignmentCenter;
            CGFloat reCountW = [reCountLbl.text wy_getWidthInOneLineWithFont:reCountLbl.font]+20;
            reCountLbl.frame = CGRectMake(reX, 20, reCountW, cellH - 40);
            reX += reCountW+margin;
            [cell addSubview:reCountLbl];
            // 单位
            if (fieldModel.unit.length) {
                UILabel *unitLbl = [UILabel new];
                unitLbl.font = [UIFont systemFontOfSize:16.0f];
                unitLbl.textColor = [UIColor whiteColor];
                NSString *fuhao = @"";
                if (index == 0 && resultCellModel.resultFieldArr.count > 1) {
                    fuhao = @"×";
                } else if (index == 1 && resultCellModel.resultFieldArr.count > 2) {
                    fuhao = @"=";
                }
                unitLbl.text = [NSString stringWithFormat:@"%@ %@", fieldModel.unit, fuhao] ;
                CGFloat desW = [unitLbl.text wy_getWidthInOneLineWithFont:unitLbl.font];
                unitLbl.frame = CGRectMake(reX, 0, desW, cellH);
                [cell addSubview:unitLbl];
                reX += desW+margin;
            }
            
        }
        // 分割线
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor whiteColor];
        lineView.frame = CGRectMake(0, cellH-1, kScreenWidth, 1);
        [cell addSubview:lineView];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 懒加载

- (SDCycleScrollView *)scycleView {
    if (!_scycleView) {
        _scycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:@"banner"]];
//        _scycleView.backgroundColor = [UIColor wy_randomColor];
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
