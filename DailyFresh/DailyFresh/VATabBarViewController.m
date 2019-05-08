//
//  VATabBarViewController.m
//  DailyFresh
//
//  Created by Mac on 2019/5/8.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "VATabBarViewController.h"

#import "HomeViewController.h"
#import "ClassifyViewController.h"
#import "DiscoveryViewController.h"
#import "ShoppingCartViewController.h"
#import "MineViewController.h"

@interface VATabBarViewController ()

@end

@implementation VATabBarViewController

+ (UIColor *)tabBarNormalColor{
    
    UIColor *color = [UIColor grayColor];
    //[UIColor kMainColor];
    return color;
}

+(UIColor *)tabBarSelectedColor{
    
    UIColor *color = kMainColor;//[UIColor blackColor];
    return color;
}

+(void)initialize{
    
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    normalAttrs[NSForegroundColorAttributeName] = [VATabBarViewController tabBarNormalColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = normalAttrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [VATabBarViewController tabBarSelectedColor];
    
    UITabBarItem *appearance = [UITabBarItem appearance];
    [appearance setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [appearance setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initViewControllers];
}

- (void)initViewControllers{
    // 创建子控制器
    HomeViewController *vc1 = [[HomeViewController alloc] init];
    //    vc1.view.backgroundColor = [UIColor redColor];
    
    BaseNavigationController *homeNav = [[BaseNavigationController alloc] initWithRootViewController:vc1];
    // 设置标题
    homeNav.tabBarItem.title = @"首页";
    // 设置选中状态的图片
    homeNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"df_tab_home_red"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置未选中状态的图片
    homeNav.tabBarItem.image = [[UIImage imageNamed:@"df_tab_home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
    // 设置右上角显示数字(例如: 未读消息数目)
    //vc1.tabBarItem.badgeValue = @"100";
    // 右上角数字背景色
    //vc1.tabBarItem.badgeColor = [UIColor greenColor];

    
    ClassifyViewController *vc2 = [[ClassifyViewController alloc] init];
    BaseNavigationController *classifyNav = [[BaseNavigationController alloc] initWithRootViewController:vc2];
    classifyNav.tabBarItem.title = @"分类";
    classifyNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"df_tab_categoty_red"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    classifyNav.tabBarItem.image = [[UIImage imageNamed:@"df_tab_categoty"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    DiscoveryViewController *vc3 = [[DiscoveryViewController alloc] init];
    BaseNavigationController *discoveryNav = [[BaseNavigationController alloc] initWithRootViewController:vc3];
    discoveryNav.tabBarItem.title = @"发现";
    discoveryNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"df_tab_discover_red"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    discoveryNav.tabBarItem.image = [[UIImage imageNamed:@"df_tab_discover"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ShoppingCartViewController *vc4 = [[ShoppingCartViewController alloc] init];
    BaseNavigationController *shoppingCartNav = [[BaseNavigationController alloc] initWithRootViewController:vc4];
    shoppingCartNav.tabBarItem.title = @"购物车";
    shoppingCartNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"df_tab_shopcar_red"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    shoppingCartNav.tabBarItem.image = [[UIImage imageNamed:@"df_tab_shopcar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    MineViewController *vc5 = [[MineViewController alloc] init];
    BaseNavigationController *meNav = [[BaseNavigationController alloc] initWithRootViewController:vc5];
    meNav.tabBarItem.title = @"我的";
    meNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"df_tab_mine_red"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    meNav.tabBarItem.image = [[UIImage imageNamed:@"df_tab_mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 添加子视图到tabbar
    self.viewControllers = @[homeNav, classifyNav, discoveryNav, shoppingCartNav,meNav];
    
    //    self.tabBar.tintColor = [UIColor blackColor];
    
    [UITabBar appearance].backgroundColor = [UIColor whiteColor];
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
