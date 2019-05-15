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
    
    self.edgesForExtendedLayout = UIRectEdgeTop;
//    if (@available(iOS 11.0, *)) {
//        [NSLayoutConstraint constraintWithItem:someView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
//    } else {
//        [NSLayoutConstraint constraintWithItem:someView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
//    }
    
    
    [self.navigationController setNavigationBarHidden:YES];
    VIEWSAFEAREAINSETS(self.view);
//    self.view.safeAreaInsets = UIEdgeInsetsMake(0, 0, 0, 0);
//    self.additionalSafeAreaInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [self setupUI];
    self.view.backgroundColor = [UIColor redColor];
    
    
    VALog(@"%@",self.view);
    VALog(@"%@",NSStringFromUIEdgeInsets(self.view.safeAreaInsets));
    
}

//+ (UIEdgeInsets)safeAreaInset:(UIView *)view {
//    if (@available(iOS 11.0, *)) {
//        return view.safeAreaInsets;
//    }
//    return UIEdgeInsetsZero;
//}


- (void)setupUI{
    
    _navigationBar = [[HomeNavigationBar alloc] init];
    [self.view addSubview:_navigationBar];
    
    _navigationBar.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).topEqualToView(self.view).heightIs(120.f);
    
    _viewController = [[HomeSubViewController alloc] init];
    [self addChildViewController:_viewController];
    

    [self.view addSubview:_viewController.view];
    
    _viewController.view.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).bottomSpaceToView(self.view, -30.f).topSpaceToView(_navigationBar, 10.f);
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewSafeAreaInsetsDidChange{
    [super viewSafeAreaInsetsDidChange];
    VALog(@"%@",self.view);
//    VALog(@"%@",self.view.safe)
    VALog(@"%@",NSStringFromUIEdgeInsets(self.view.safeAreaInsets));
}


@end
