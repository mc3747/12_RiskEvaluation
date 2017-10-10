//
//  ScoresSintleton.h
//  RiskEvaluation
//
//  Created by gjfax on 2017/3/23.
//  Copyright © 2017年 macheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScoresSintleton : NSObject
 /*勾选项数组 */
@property (nonatomic, strong) NSMutableArray *scoresArray;
 /*得分单例 */
+ (ScoresSintleton *)sharedScores;
@end
