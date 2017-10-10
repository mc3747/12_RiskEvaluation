//
//  ScoresSintleton.m
//  RiskEvaluation
//
//  Created by gjfax on 2017/3/23.
//  Copyright © 2017年 macheng. All rights reserved.
//

#import "ScoresSintleton.h"

@implementation ScoresSintleton

- (void)setScoresArray:(NSMutableArray *)scoresArray {
    if (!_scoresArray) {
        _scoresArray = [[NSMutableArray alloc] initWithCapacity:10];
        for (int i = 0; i < 10; i++) {
            [_scoresArray addObject:@0];
        }
    }
}
+ (ScoresSintleton *)sharedScores
{
    static ScoresSintleton *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ScoresSintleton alloc] init];
    });
    return instance;
}
@end
