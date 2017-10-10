//
//  RiskEvaluationModel.h
//  RiskEvaluation
//
//  Created by gjfax on 2017/3/22.
//  Copyright © 2017年 macheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RiskEvaluationCellModel : NSObject
@property (nonatomic, copy)     NSString    *answerStr;
@property (nonatomic, assign)   BOOL        selectedState;

+ (instancetype)modelWithDic:(NSDictionary *)dataDic;
+ (NSArray *)modelArrayWithArray:(NSArray *)dataArray;
- (instancetype)initWithDic:(NSDictionary *)dataDic;

@end


@interface RiskEvaluationPageModel : NSObject
@property (nonatomic, assign)   NSInteger   dataNum;
@property (nonatomic, assign)   NSInteger   selectedNum;
@property (nonatomic, copy)     NSString    *questionStr;
@property (nonatomic, strong)   NSMutableArray<RiskEvaluationCellModel *> *cellModelRows;

+ (instancetype)modelWithDic:(NSDictionary *)dataDic;
+ (NSArray *)modelArrayWithArray:(NSArray *)dataArray;
- (instancetype)initWithDic:(NSDictionary *)dataDic;
- (void) loadTestData ;


@end
