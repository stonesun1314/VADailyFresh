//
//  VALocationViewController.m
//  DailyFresh
//
//  Created by Mac on 2019/5/27.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "VALocationViewController.h"

@interface VALocationViewController ()<CLLocationManagerDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *atableView;

@property (nonatomic, strong) NSArray *dataList;

@property (nonatomic, strong) NSString *currentLocation;

@property (nonatomic, strong) CLLocationManager* locationManager;

@end

@implementation VALocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title = @"选择收货地址";
    
    [self initDataSource];
    
    [self setupUI];
    
    [self initLocationManager];
}


- (void)initDataSource{
    _dataList = @[@"万科大厦",@"海康大厦",@"天虹商场(梅林店)",@"BBLLUUEE Color(天虹商场)",@"中国银行(天虹商场)",@"betu(天虹商场)",@"dotacoko(天虹商场)",@"艾诺诗雅诗（天虹商场）",@"ONLY(天虹商场)",@"迪仕尼奴(天虹商场)",@"捷米梵（天虹商场）",@"皇家宝贝（天虹商场）",@"joie(天虹商场)",@"富贵鸟&吉世宝(天虹商场)"];
}


- (void)initLocationManager{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    self.locationManager.distanceFilter=10;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=8) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];//开启定位
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    WeakSelf
    CLLocation *currLocation=[locations lastObject];
    NSLog(@"latitude---%f, longitude---%f",currLocation.coordinate.latitude,currLocation.coordinate.longitude);
    
    CLGeocoder *clGeoCoder = [[CLGeocoder alloc] init];
    [clGeoCoder reverseGeocodeLocation:currLocation completionHandler: ^(NSArray *placemarks,NSError *error) {
        
        NSLog(@"--array--%d---error--%@",(int)placemarks.count,error);
        
        if (placemarks.count > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            NSString *city = placemark.administrativeArea;
            NSLog(@"位于:%@",city);
            NSLog(@"%@",placemark.addressDictionary[@"Name"]);
            _currentLocation = placemark.addressDictionary[@"Name"];
            [weakSelf.atableView reloadData];
            
            
        }
    }];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
    if ([error code]==kCLErrorDenied) {
        NSLog(@"访问被拒绝");
    }
    if ([error code]==kCLErrorLocationUnknown) {
        NSLog(@"无法获取位置信息");
    }
}

- (void)setupUI{
    _atableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _atableView.delegate = self;
    _atableView.dataSource = self;
    _atableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    [self.view addSubview:_atableView];
    _atableView.tableFooterView = [UIView new];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 44;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return @"附近地址";
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return _dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"identify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"df_locationIcon"];
        cell.textLabel.text = _currentLocation;
    }else if (indexPath.section == 1){
        cell.imageView.image = nil;//[UIImage imageNamed:@""];
       cell.textLabel.text = [_dataList objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (self.selectLocationBlock) {
            self.selectLocationBlock(_currentLocation);
        }
    }else if (indexPath.section == 1){
        if (self.selectLocationBlock) {
            NSString *str = [_dataList objectAtIndex:indexPath.row];
            self.selectLocationBlock(str);
        }
    }

    
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
