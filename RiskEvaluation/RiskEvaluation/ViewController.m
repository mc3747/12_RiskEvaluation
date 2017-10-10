//
//  ViewController.m
//  RiskEvaluation
//
//  Created by gjfax on 2017/3/22.
//  Copyright © 2017年 macheng. All rights reserved.
//

#import "ViewController.h"
#import "RiskEvaluationViewController.h"
#import "RiskEvaluationModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"题目主页";
    
    
    [self.view addSubview:
     (
      {UIButton *testBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 150, [UIScreen mainScreen].bounds.size.width - 40, 30)];
      [testBtn setTitle:@"开始做题" forState:UIControlStateNormal];
      [testBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
      [testBtn setBackgroundColor:[UIColor colorWithRed:153.f/255 green:181.f/255 blue:121.f/255 alpha:1.f]];
      [testBtn addTarget:self action:@selector(testMethod:) forControlEvents:UIControlEventTouchUpInside];
      testBtn;
      })
     ];
}

- (void)testMethod:(UIButton *)sender {
    RiskEvaluationViewController *vc = [[RiskEvaluationViewController alloc] init];
    vc.totalPage = 10;
    vc.pageNum = 1;
    vc.scores = 0;
    vc.modelArray = (NSMutableArray *)[RiskEvaluationPageModel modelArrayWithArray:[self modelData]];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSArray *)modelData {

     NSArray *arr = @[@{       @"dataNum":@1,
                               @"question":@"1 您认为手机在您生活中的重要性：",
                               @"selectNum":@(-1),
                               @"answers": @[
                                       @{@"answer":@"1	非常不重要",@"isSelected":@(NO)},
                                       @{@"answer":@"2	不重要 ",@"isSelected":@(NO)},
                                       @{@"answer":@"3	一般重要",@"isSelected":@(NO)},
                                       @{@"answer":@"4	重要",@"isSelected":@(NO)},
                                       @{@"answer":@"5	非常重要",@"isSelected":@(NO)}
                                       ]},
                             @{@"dataNum":@2,
                               @"question":@"2 您能接受的手机价位是",
                               @"selectNum":@(-1),
                               @"answers": @[
                                       @{@"answer":@"1	1000 元以下",@"isSelected":@(NO)},
                                       @{@"answer":@"2	1000-2000 元",@"isSelected":@(NO)},
                                       @{@"answer":@"3	2000-3000 元",@"isSelected":@(NO)},
                                       @{@"answer":@"4	3000-4000 元",@"isSelected":@(NO)},
                                       @{@"answer":@"5	4000 元以下",@"isSelected":@(NO)}
                                       ]},
                             @{@"dataNum":@3,
                               @"question":@"3 您的年收入是多少：",
                               @"selectNum":@(-1),
                               @"answers": @[
                                       @{@"answer":@"1	2万元以下",@"isSelected":@(NO)},
                                       @{@"answer":@"2	2万元至5万元",@"isSelected":@(NO)},
                                       @{@"answer":@"3	5万元至15万元",@"isSelected":@(NO)},
                                       @{@"answer":@"4	15万元至50万元",@"isSelected":@(NO)},
                                       @{@"answer":@"5	50万元以上",@"isSelected":@(NO)}
                                       ]},
                             @{@"dataNum":@4,
                               @"question":@"4 你更换手机的频率是：",
                               @"selectNum":@(-1),
                               @"answers": @[
                                       @{@"answer":@"1	用坏才换",@"isSelected":@(NO)},
                                       @{@"answer":@"2	3年以上",@"isSelected":@(NO)},
                                       @{@"answer":@"3	3年以内",@"isSelected":@(NO)},
                                       @{@"answer":@"4	2年以内",@"isSelected":@(NO)},
                                       @{@"answer":@"5	1年以内",@"isSelected":@(NO)}
                                       ]},
                             @{@"dataNum":@5,
                               @"question":@"5 您最愿意选择手机类型：",
                               @"selectNum":@(-1),
                               @"answers": @[
                                       @{@"answer":@"1	普通手机",@"isSelected":@(NO)},
                                       @{@"answer":@"2	拍照手机",@"isSelected":@(NO)},
                                       @{@"answer":@"3	音乐手机",@"isSelected":@(NO)},
                                       @{@"answer":@"4	游戏手机",@"isSelected":@(NO)},
                                       @{@"answer":@"5	智能手机",@"isSelected":@(NO)}
                                       ]},
                              @{@"dataNum":@6,
                                @"question":@"6 您购买手机时选择的场所是：",
                                @"selectNum":@(-1),
                                @"answers": @[
                                        @{@"answer":@"1	大卖场",@"isSelected":@(NO)},
                                        @{@"answer":@"2	商场",@"isSelected":@(NO)},
                                        @{@"answer":@"3	专卖店",@"isSelected":@(NO)},
                                        @{@"answer":@"4	移动／联通／电信公司",@"isSelected":@(NO)},
                                        @{@"answer":@"5	网上购买",@"isSelected":@(NO)}
                                        ]},
                              @{@"dataNum":@7,
                                @"question":@"7 您的话费主要用于：",
                                @"selectNum":@(-1),
                                @"answers": @[
                                        @{@"answer":@"1	通话",@"isSelected":@(NO)},
                                        @{@"answer":@"2	收发信息",@"isSelected":@(NO)},
                                        @{@"answer":@"3	手机游戏",@"isSelected":@(NO)},
                                        @{@"answer":@"4	上网流量",@"isSelected":@(NO)},
                                        @{@"answer":@"5	手机套餐定制",@"isSelected":@(NO)}
                                        ]},
                              @{@"dataNum":@8,
                                @"question":@"8 您更换手机的原因是：",
                                @"selectNum":@(-1),
                                @"answers": @[
                                        @{@"answer":@"1	质量等出现问题",@"isSelected":@(NO)},
                                        @{@"answer":@"2	外观出现磨损、掉色",@"isSelected":@(NO)},
                                        @{@"answer":@"3	样式陈旧",@"isSelected":@(NO)},
                                        @{@"answer":@"4	功能太少",@"isSelected":@(NO)},
                                        @{@"answer":@"5	追求时尚",@"isSelected":@(NO)}
                                        ]},
                              @{@"dataNum":@9,
                                @"question":@"9 你了解手机信息的渠道:：",
                                @"selectNum":@(-1),
                                @"answers": @[
                                        @{@"answer":@"1	海报宣传单",@"isSelected":@(NO)},
                                        @{@"answer":@"2	报纸电视",@"isSelected":@(NO)},
                                        @{@"answer":@"3	朋友",@"isSelected":@(NO)},
                                        @{@"answer":@"4	宣传活动",@"isSelected":@(NO)},
                                        @{@"answer":@"5	网络",@"isSelected":@(NO)}
                                        ]},
                              @{@"dataNum":@10,
                                @"question":@"10 您对于多功能于一身的手机的看法是：",
                                @"selectNum":@(-1),
                                @"answers": @[
                                        @{@"answer":@"1	没用",@"isSelected":@(NO)},
                                        @{@"answer":@"2	无所谓",@"isSelected":@(NO)},
                                        @{@"answer":@"3	价格便宜",@"isSelected":@(NO)},
                                        @{@"answer":@"4	售后服务好",@"isSelected":@(NO)},
                                        @{@"answer":@"5	功能越多越好",@"isSelected":@(NO)}
                                        ]}
                             ];

    return arr;
}

@end
