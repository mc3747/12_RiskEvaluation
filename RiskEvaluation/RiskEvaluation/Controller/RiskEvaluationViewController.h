//
//  RiskEvaluationViewController.h
//  RiskEvaluation
//
//  Created by gjfax on 2017/3/22.
//  Copyright © 2017年 macheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RiskEvaluationModel.h"
@interface RiskEvaluationViewController : UIViewController

@property (nonatomic, assign) NSInteger totalPage;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, assign) NSInteger scores;
@property (nonatomic, strong) NSMutableArray<RiskEvaluationPageModel *>*modelArray;


@end
