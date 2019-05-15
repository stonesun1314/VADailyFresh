//
//  HomeViewController.m
//  DailyFresh
//
//  Created by Mac on 2019/5/8.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeSubViewController.h"
#import "DLSlideView.h"
#import "HomeNavigationBar.h"


@interface HomeViewController ()

@property (nonatomic, strong) HomeNavigationBar *navigationBar;
@property (nonatomic, strong) HomeSubViewController *viewController;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    [self.navigationController setNavigationBarHidden:YES];
    VIEWSAFEAREAINSETS(self.view);
//    self.view.safeAreaInsets = UIEdgeInsetsMake(0, 0, 0, 0);
//    self.additionalSafeAreaInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [self setupUI];
    
    
}


- (void)setupUI{
    
    _navigationBar = [[HomeNavigationBar alloc] init];
    _navigationBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_navigationBar];
    
    _navigationBar.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).topSpaceToView(self.view, Height_StatusBar).heightIs(100.f);
    
    _viewController = [[HomeSubViewController alloc] init];
    [self addChildViewController:_viewController];
    
    [self.view addSubview:_viewController.view];
    
    _viewController.view.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).bottomSpaceToView(self.view, -30.f).topSpaceToView(_navigationBar, 0.f);
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewSafeAreaInsetsDidChange{
    [super viewSafeAreaInsetsDidChange];
}


@end
