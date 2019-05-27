//
//  BaseViewController.m
//  VankePay
//
//  Created by Mac on 2018/12/13.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = kUIContentBackgroundColor;//[UIColor whiteColor];
    
    [self setNavigationBar];
    
//    self.hidesBottomBarWhenPushed = YES;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //点击背景收回键盘
//    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
}


- (void)setNavigationBar {
    
    //df_leftBackSearchImage@2x.png
    UINavigationBar * bar = self.navigationController.navigationBar;
    bar.translucent = NO;
    bar.barTintColor = [UIColor whiteColor];
    
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"df_leftBackSearchImage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick:)];
    self.navigationItem.leftBarButtonItem = backBarButtonItem;
    
    //arrow_navbar
}

- (void)backClick:(UIBarButtonItem *)item {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
