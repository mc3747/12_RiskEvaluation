//
//  RiskEvaluationModel.m
//  RiskEvaluation
//
//  Created by gjfax on 2017/3/22.
//  Copyright © 2017年 macheng. All rights reserved.
//

#import "RiskEvaluationModel.h"

@implementation RiskEvaluationPageModel

+ (instancetype)modelWithDic:(NSDictionary *)dataDic {
    return [[self alloc] initWithDic:dataDic];
}


+ (NSArray *)modelArrayWithArray:(NSArray *)dataArray
{
    NSMutableArray *modelArray = [NSMutableArray array];
    
    for (NSDictionary *dataDic in dataArray) {
        [modelArray addObject:[RiskEvaluationPageModel modelWithDic:dataDic]];
    }
    
    return modelArray;
}

- (instancetype)initWithDic:(NSDictionary *)dataDic {

    if (self = [super init]) {
        self.cellModelRows = [[NSMutableArray alloc] init];
        self.dataNum =  [[dataDic objectForKey:@"dataNum"] integerValue];
        self.questionStr = [dataDic objectForKey:@"question"];
        self.selectedNum =  [[dataDic objectForKey:@"selectNum"] integerValue];
        NSMutableArray *cellArray = [dataDic objectForKey:@"answers"];
        for (NSDictionary *dic in cellArray) {
            RiskEvaluationCellModel *cellModel =  [[RiskEvaluationCellModel alloc] initWithDic:dic];
            [self.cellModelRows addObject:cellModel];
        }
    }

   
   // [self loadTestData];
    return self;
}

- (void) loadTestData {
    
    self.questionStr = [NSString stringWithFormat:@"页面%ld的问题",(long)_dataNum];
    for (int i = 1; i < 6; i++) {
        RiskEvaluationCellModel *cellModel = [[RiskEvaluationCellModel alloc] initWithDic:nil];
        cellModel.answerStr = [NSString stringWithFormat:@"页面%ld的答案",(long)_dataNum];
        [self.cellModelRows addObject:cellModel];
    }
  
}
@end

@implementation RiskEvaluationCellModel

+ (instancetype)modelWithDic:(NSDictionary *)dataDic {
    return [[self alloc] initWithDic:dataDic];
}

+ (NSArray *)modelArrayWithArray:(NSArray *)dataArray
{
    NSMutableArray *modelArray = [NSMutableArray array];
    
    for (NSDictionary *dataDic in dataArray) {
        [modelArray addObject:[RiskEvaluationCellModel modelWithDic:dataDic]];
    }
    
    return modelArray;
}

- (instancetype)initWithDic:(NSDictionary *)dataDic {
    
     if (self = [super init]) {
        self.answerStr = [dataDic objectForKey:@"answer"];
        self.selectedState = [[dataDic objectForKey:@"isSelected"] boolValue];
    }
    return self;
}
@end
