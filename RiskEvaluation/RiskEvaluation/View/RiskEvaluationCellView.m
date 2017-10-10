//
//  RiskEvaluationCellView.m
//  RiskEvaluation
//
//  Created by gjfax on 2017/3/22.
//  Copyright © 2017年 macheng. All rights reserved.
//

#import "RiskEvaluationCellView.h"
@interface RiskEvaluationCellView()

@property (nonatomic, strong) UIImage           *imageNormall;
@property (nonatomic, strong) UIImage           *imageSelected;
@end
@implementation RiskEvaluationCellView

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self commonView];
    }
    return self;
}


#pragma mark - UI正常，显示无数据页面
- (void)commonView
{
// 答案label
    self.answerLabel.frame = CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, 20);
    self.answerLabel.font = [UIFont systemFontOfSize:12.f];
    self.answerLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.answerLabel];
// 勾选imageView
    self.markImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 25, 10, 20, 20);
    self.markImageView.image = self.imageNormall;
    [self.contentView addSubview:self.markImageView];

}

#pragma mark - 构建、更新 有数据页面
- (void)updateDataSoure:(RiskEvaluationCellModel *)cellModel
{
    // 防止返回的数据为空或者异常
    if (!cellModel || ![cellModel isKindOfClass:[RiskEvaluationCellModel class]]) {
        return;
    }
    // 模型数据给view元素赋值
    self.answerLabel.text = cellModel.answerStr;
    
    if (cellModel.selectedState) {
        self.markImageView.image = self.imageSelected;
        
    } else {
        self.markImageView.image = self.imageNormall;
    }
}
#pragma mark - 懒加载
- (UILabel *)answerLabel
{
    if (!_answerLabel) {
        _answerLabel = [[UILabel alloc] init];
    }
    
    return _answerLabel;
}

- (UIImageView *)markImageView
{
    if (!_markImageView) {
        _markImageView = [[UIImageView alloc] init];
    }
    
    return _markImageView;
}

- (UIImage *)imageNormall
{
    if (!_imageNormall) {
        _imageNormall = [[UIImage alloc] init];
        _imageNormall = [UIImage imageNamed:@"common_checkBox"];
    }
    
    return _imageNormall;
}

- (UIImage *)imageSelected
{
    if (!_imageSelected) {
        _imageSelected = [[UIImage alloc] init];
        _imageSelected = [UIImage imageNamed:@"common_checkBox_selected"];
    }
    return _imageSelected;
}

@end
