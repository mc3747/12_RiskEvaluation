//
//  RiskEvaluationResultViewController.m
//  RiskEvaluation
//
//  Created by gjfax on 2017/3/23.
//  Copyright © 2017年 macheng. All rights reserved.
//

#import "RiskEvaluationResultViewController.h"

@interface RiskEvaluationResultViewController ()

@end

@implementation RiskEvaluationResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"风险测评结果";
    
    //  返回按钮
    UIButton *barButtonItem = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [barButtonItem setImage:[UIImage imageNamed:@"btn_navi_back"] forState:UIControlStateNormal];
    [barButtonItem addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:barButtonItem];
    //  测评结果
    UILabel *resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, 30)];
    resultLabel.text = [NSString stringWithFormat:@"您的风险测评结果：%@",_riskDesc];
    resultLabel.textAlignment = NSTextAlignmentCenter;
    resultLabel.font = [UIFont systemFontOfSize:14.f];
    [self.view addSubview:resultLabel];
}

#pragma mark - 返回方法
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}



@end
