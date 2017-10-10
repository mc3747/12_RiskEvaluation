//
//  RiskEvaluationViewController.m
//  RiskEvaluation
//
//  Created by gjfax on 2017/3/22.
//  Copyright © 2017年 macheng. All rights reserved.
//

#import "RiskEvaluationViewController.h"
#import "RiskEvaluationCellView.h"
#import "RiskEvaluationViewModel.h"
#import "RiskEvaluationResultViewController.h"
#import "ScoresSintleton.h"

@interface RiskEvaluationViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong ,nullable) UITableView *tableView;
@property (nonatomic, weak)             UILabel     *pageNumLabel;
@property (nonatomic, weak)             UIButton    *lastQuestionBtn;
@property (nonatomic, weak)             UIButton    *nextQuestionBtn;
@property (nonatomic, weak)             UIButton    *confirmBtn;

@end

@implementation RiskEvaluationViewController
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
    }
    
    return _tableView;
}

- (NSMutableArray <RiskEvaluationPageModel *>*)modelArray
{
    if (!_modelArray) {
        _modelArray = [[NSMutableArray <RiskEvaluationPageModel *>alloc] init];
       for (int i = 0; i < _totalPage; i++) {
            _modelArray[i] = [[RiskEvaluationPageModel alloc] initWithDic:nil];
            _modelArray[i].selectedNum = -1;
        }
    }
    
    return _modelArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    _scores = 0;

}

- (void)viewDidLoad {
    [super viewDidLoad];
/** 整体设置*/
    self.title = @"手机购买风险评测";
    self.view.backgroundColor = [UIColor colorWithRed:241.f green:241.f blue:241.f alpha:1.f];
    
//  返回按钮
     UIButton *barButtonItem = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [barButtonItem setImage:[UIImage imageNamed:@"btn_navi_back"] forState:UIControlStateNormal];
     [barButtonItem addTarget:self action:@selector(backToLastPage) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:barButtonItem];
    
//  tableView
    self.tableView.frame = CGRectMake(0, 5, self.view.bounds.size.width, self.view.bounds.size.height - 64 - 5 - 100);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
// tableViewCell 分隔线的设置
    [self.tableView setSeparatorColor:[UIColor lightGrayColor]];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 10, 0, 0)];
    self.tableView.backgroundColor = [UIColor colorWithRed:241.f green:241.f blue:241.f alpha:1.f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
// 底部元素
    [self initBottomParts];
    
}

#pragma mark - 返回方法
- (void)backToLastPage {
    if (_pageNum > 1) {
        _pageNum --;
        [self reloadCurrentData:_pageNum];
        [self updateBottomPageNum];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }

}
#pragma mark - 更新页面数据
- (void)reloadCurrentData:(NSInteger )currentPageNum {
    _pageNum = currentPageNum;
    [self.tableView reloadData];
}

#pragma mark - 底部元素
- (void)initBottomParts {
    // 上一题
    UIButton *lastQuestionBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, self.tableView.bounds.origin.y + self.tableView.bounds.size.height + 20, 50, 30)];
    [lastQuestionBtn setTitle:@"上一题" forState:UIControlStateNormal];
    [lastQuestionBtn setTitleColor: [UIColor colorWithRed:153.f/255 green:181.f/255 blue:121.f/255 alpha:1.f] forState:UIControlStateNormal];
    lastQuestionBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [lastQuestionBtn addTarget:self action:@selector(backToLastPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lastQuestionBtn];
    _lastQuestionBtn = lastQuestionBtn;
    _lastQuestionBtn.hidden = YES;
  
    // 下一题
    UIButton *nextQuestionBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.tableView.bounds.size.width - 10 - 50, self.tableView.bounds.origin.y + self.tableView.bounds.size.height + 20, 50, 30)];
    [nextQuestionBtn setTitle:@"下一题" forState:UIControlStateNormal];
    [nextQuestionBtn setTitleColor: [UIColor colorWithRed:153.f/255 green:181.f/255 blue:121.f/255 alpha:1.f] forState:UIControlStateNormal];
    nextQuestionBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [nextQuestionBtn addTarget:self action:@selector(confirmAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextQuestionBtn];
    _nextQuestionBtn = nextQuestionBtn;
    _nextQuestionBtn.hidden = YES;
    
    // 页面号
    UILabel *pageNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.tableView.bounds.size.width * 0.5f - 25, self.tableView.bounds.origin.y + self.tableView.bounds.size.height + 20, 50, 30)];
    [pageNumLabel setText:[NSString stringWithFormat:@"%ld / %ld",(long)_pageNum,(long)_totalPage]];
    [pageNumLabel setFont:[UIFont systemFontOfSize:14.f]];
    [pageNumLabel setTextColor:[UIColor lightGrayColor]];
    [self.view addSubview:pageNumLabel];
    _pageNumLabel = pageNumLabel;
    
    // 提交按钮
    UIButton *confirmBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, self.tableView.bounds.origin.y + self.tableView.bounds.size.height + 50, [UIScreen mainScreen].bounds.size.width - 20, 30)];
    [confirmBtn setTitle:@"提交" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [confirmBtn setBackgroundColor: [UIColor grayColor]];
    [confirmBtn.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
    [confirmBtn addTarget:self action:@selector(confirmAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
    _confirmBtn = confirmBtn;
    
}

#pragma mark - 提交方法
- (void)confirmAction {
    
    // 点击后判断本页是否测评：如果有进入下一页 & 没有呆在本页，并弹toast
       if (![self judgeSelectedState]) {
     
           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"本页还有题目未作答" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
           alertView.backgroundColor = [UIColor colorWithRed:153.f/255 green:181.f/255 blue:121.f/255 alpha:1.f];
           [alertView show];
           
         return;
     }
    [_confirmBtn setBackgroundColor:[UIColor grayColor]];
    // 测评页
    if (_pageNum > 0 && _totalPage > 0) {
        if (_pageNum < _totalPage) {
            _pageNum ++;
            [self updateBottomPageNum];
            [self.tableView reloadData];
    // 最后一页
        } else if (_pageNum == _totalPage) {
            for (int i = 0; i < _totalPage; i++) {
                _scores = (self.modelArray[i].selectedNum + 1) *2 + _scores;
              
            }
             NSLog(@"最后得分：%li",_scores);
            NSString *riskDesc = @"";
            if (_scores >= 0 && _scores <=40) {
                riskDesc = @"保守型";
            } else if (_scores > 40 && _scores <= 60) {
                riskDesc = @"稳健型";
            } else if (_scores > 60 && _scores <= 100) {
                riskDesc = @"积极型";
            } else {
                riskDesc = @"错误❌";
            }
            NSLog(@"风险评级：%@",riskDesc);
            
             RiskEvaluationResultViewController *vc = [[RiskEvaluationResultViewController alloc] init];
             vc.riskDesc = riskDesc;
             [self.navigationController pushViewController:vc animated:YES];
        };
    
    }else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"报错" message:@"序号不能为空" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
  
    
}
#pragma mark - 初始化section 0
- (void) initTopSection:(UITableViewCell *)cell {
    // 问题cell设置
    cell.backgroundColor = [UIColor whiteColor];
    // 问题文字
    UILabel *questionLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20, 60)];
    self.modelArray[_pageNum - 1].dataNum = _pageNum;
    questionLab.text = self.modelArray[_pageNum - 1].questionStr;
    [questionLab setNumberOfLines:0];
    [questionLab setLineBreakMode:NSLineBreakByCharWrapping];
    questionLab.textColor =  [UIColor colorWithRed:153.f/255 green:181.f/255 blue:121.f/255 alpha:1.f];
    questionLab.font = [UIFont systemFontOfSize:14.f];
    questionLab.adjustsFontSizeToFitWidth = YES;
    // 问题底部分隔线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(10, 59, [UIScreen mainScreen].bounds.size.width - 10, .5f)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    //  添加
    [cell.contentView addSubview:questionLab];
    [cell.contentView addSubview:lineView];
}

#pragma mark - tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 60;
    }
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _lastQuestionBtn.hidden = _pageNum > 1?NO:YES;
    _nextQuestionBtn.hidden = _pageNum == 10?YES:NO;
 
    
     NSString *identifier = NSStringFromClass([self class]);
     UITableViewCell *cell;
     cell = [tableView cellForRowAtIndexPath:indexPath];
// 问题
    if (indexPath.section == 0) {
        if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"%@section0",identifier]];
        [self initTopSection:cell];
        };
// 答案
    } else if (indexPath.section == 1) {
        if (!cell) {
         cell = [[RiskEvaluationCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"%@section1",identifier]];
        }
           RiskEvaluationCellView *cellView = (RiskEvaluationCellView *)cell;
           self.modelArray[_pageNum - 1].dataNum = _pageNum;
           [cellView updateDataSoure:self.modelArray[_pageNum - 1].cellModelRows[indexPath.row]];
        
    }


    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 点击的是未选中的，则将indexPath下标赋值给当前页的选中选项；已经选中的，则退回到默认未选中状态
    if (self.modelArray[_pageNum - 1].selectedNum == indexPath.row) {
        self.modelArray[_pageNum - 1].selectedNum = -1;
    } else {
        self.modelArray[_pageNum - 1].selectedNum = indexPath.row;
    };
    
    // 获取tableView的所有cell
    NSArray *arr = [self.tableView visibleCells];

    for (RiskEvaluationCellView *cellView in arr) {

        if ([cellView isKindOfClass:[RiskEvaluationCellView class]]) {
  
           // 点击的是已选中的cell,变更cell的状态
            self.modelArray[_pageNum - 1].cellModelRows[indexPath.row].selectedState =  !self.modelArray[_pageNum - 1].cellModelRows[indexPath.row].selectedState;
           
           // 点击的是未选中的cell,变更cell的状态
                for (int i = 0; i <  self.modelArray[_pageNum - 1].cellModelRows.count; i++) {
                    if (i != indexPath.row) {
                        self.modelArray[_pageNum - 1].cellModelRows[i].selectedState = NO;
                    }
                };
        }
    };

    // 刷新
    [tableView reloadData];
    

    
    if ([self judgeSelectedState]) {
        _nextQuestionBtn.hidden = _pageNum == 10?YES:NO;
        [_confirmBtn setBackgroundColor:[UIColor colorWithRed:153.f/255 green:181.f/255 blue:121.f/255 alpha:1.f]];
    } else {
        _nextQuestionBtn.hidden = YES;
        [_confirmBtn setBackgroundColor:[UIColor grayColor]];
    }
    
    
}

#pragma mark - 更新底部页码
- (void)updateBottomPageNum {
    [_pageNumLabel setText:[NSString stringWithFormat:@"%ld / %ld",(long)_pageNum,(long)_totalPage]];
}

#pragma mark - 判断每页是否有没选中的答案
- (BOOL)judgeSelectedState {
    
    if (_modelArray[_pageNum - 1].selectedNum == -1 ) {
        return NO;
    };
    return YES;
}

@end

