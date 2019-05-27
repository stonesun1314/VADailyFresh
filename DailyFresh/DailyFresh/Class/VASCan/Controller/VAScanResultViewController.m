//
//  VAScanResultViewController.m
//  DailyFresh
//
//  Created by Mac on 2019/5/27.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "VAScanResultViewController.h"

@interface VAScanResultViewController ()

@property (strong, nonatomic)  UIImageView *scanImg;
@property (strong, nonatomic)  UILabel *labelScanText;
@property (strong, nonatomic)  UILabel *labelScanCodeType;

@end

@implementation VAScanResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

//    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
//
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
    
    [self setNavigationBar];
    [self setupUI];
}

- (void)setNavigationBar {
    UINavigationBar * bar = self.navigationController.navigationBar;
    bar.translucent = NO;
    bar.barTintColor = [UIColor whiteColor];
    
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"df_leftBackSearchImage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick:)];
    self.navigationItem.leftBarButtonItem = backBarButtonItem;
}

- (void)setupUI{
    
    
    
    _scanImg = [[UIImageView alloc] init];
//    _scanImg.image = [UIImage imageNamed:@""];
    [self.view addSubview:_scanImg];
    
    _labelScanCodeType = [UILabel new];
    _labelScanCodeType.textColor = [UIColor blackColor];
    _labelScanCodeType.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_labelScanCodeType];
    
    _labelScanText = [UILabel new];
    _labelScanText.textColor = [UIColor blackColor];
    _labelScanText.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_labelScanText];
    
    _scanImg.sd_layout.centerXEqualToView(self.view).topSpaceToView(self.view, 30.f).widthIs(240).heightIs(240.f);
    [self.view addSubview:_scanImg];
    
    _labelScanCodeType.sd_layout.centerXEqualToView(self.view).topSpaceToView(_scanImg, 50.f).widthIs(300.f).heightIs(30.f);
    [_labelScanCodeType setSingleLineAutoResizeWithMaxWidth:300.f];
    [_labelScanCodeType setMaxNumberOfLinesToShow:1];
    
    _labelScanText.sd_layout.centerXEqualToView(self.view).topSpaceToView(_labelScanCodeType, 50.f).widthIs(300.f).heightIs(30.f);
    [_labelScanText setSingleLineAutoResizeWithMaxWidth:300.f];
    [_labelScanText setMaxNumberOfLinesToShow:3];
    
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    if (!_imgScan) {
        
        _scanImg.backgroundColor = [UIColor grayColor];
    }
    
    _scanImg.image = _imgScan;
    _labelScanText.text = _strScan;
    _labelScanCodeType.text = [NSString stringWithFormat:@"码的类型:%@",_strCodeType];
    

}

- (void)backClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
