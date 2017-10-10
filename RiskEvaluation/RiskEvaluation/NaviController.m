//
//  NaviController.m
//  UINavigationController
//
//  Created by gjfax on 16/7/7.
//  Copyright © 2016年 macheng. All rights reserved.
//

#import "NaviController.h"

@interface NaviController ()

@end

@implementation NaviController

- (void)viewDidLoad {
    [super viewDidLoad];

    // UINavigationBar：整体的外观属性，如背景颜色，文字颜色、BarStyle、背景图片等等，所有子控制器都会使用的公共样式
        // 导航栏样式(控制最上边的状态栏和bar主题文字的颜色)
    self.navigationBar.barStyle = UIBarStyleDefault;
        // 导航栏背景颜色
    self.navigationBar.barTintColor = [UIColor colorWithRed:153.f/255 green:181.f/255 blue:121.f/255 alpha:1.f];
        // 导航栏默认返回文字颜色
//    self.navigationBar.tintColor = [UIColor whiteColor];
        // 导航栏背景图片
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"icon29x29"] forBarMetrics:UIBarMetricsDefault];

    
    // UINavigationItem: 主要为导航栏上显示的按钮以及标题，一般来说，每个子控制器需要显示的标题以及按钮都不同，因此，苹果官方建议对于每个子控制器需要显示的导航栏标题和按钮，都建议在各自的子控制器中定制
    
}



@end
