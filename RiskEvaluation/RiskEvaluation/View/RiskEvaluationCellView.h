//
//  RiskEvaluationCellView.h
//  RiskEvaluation
//
//  Created by gjfax on 2017/3/22.
//  Copyright © 2017年 macheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RiskEvaluationModel.h"


@interface RiskEvaluationCellView : UITableViewCell
@property (nonatomic, strong) UILabel *answerLabel;
@property (nonatomic, strong) UIImageView *markImageView;

/*
 *  构建、更新 有数据页面
 */
- (void)updateDataSoure:(RiskEvaluationCellModel *)cellModel;


@end
