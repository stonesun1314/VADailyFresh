//
//  VAMockDataSource.m
//  DailyFresh
//
//  Created by Mac on 2019/5/14.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "VAMockDataSource.h"

#import "GoodsItemModel.h"

@implementation VAMockDataSource

// 创建静态对象 防止外部访问
static VAMockDataSource *_instance;
+(instancetype)allocWithZone:(struct _NSZone *)zone
{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}
// 为了使实例易于外界访问 我们一般提供一个类方法
// 类方法命名规范 share类名|default类名|类名
+(instancetype)shareInstance
{
    //return _instance;
    // 最好用self 用Tools他的子类调用时会出现错误
    return [[self alloc]init];
}
// 为了严谨，也要重写copyWithZone 和 mutableCopyWithZone
-(id)copyWithZone:(NSZone *)zone
{
    return _instance;
}
-(id)mutableCopyWithZone:(NSZone *)zone
{
    return _instance;
}

- (NSDictionary *)readJsonFromFileName:(NSString *)fileName{
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@""];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error = nil;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"\n%@", [error localizedDescription]);
    
    return result;
}

- (NSArray *)homeCateList{
    NSArray *cateNameList = @[@"时令水果",@"新鲜蔬菜",@"肉禽蛋类",@"海鲜水产",@"乳品雪糕",@"粮油调味",@"烘焙糕点",@"酒水饮料",@"休闲零食",@"粽子速食",@"美妆百货",@"调味粮油",@"卤味熟食",@"邀请有礼"];
    return cateNameList;
}

- (NSArray *)homeHorGoodsItemList{
    
//    @property (nonatomic, strong) NSString *img;
//    @property (nonatomic, strong) NSString *name;
//    @property (nonatomic, strong) NSString *price;
//    @property (nonatomic, strong) NSString *link;
//    @property (nonatomic, strong) NSString *goodsId;
//    @property (nonatomic, strong) NSString *originalPrice;
//    @property (nonatomic, strong) NSString *category;
    NSMutableArray *temp = [NSMutableArray new];
    for (int i = 0; i < 7; i++) {
        GoodsItemModel *model = [[GoodsItemModel alloc] init];
        model.img = @"img";
        model.name = @"爆料麻辣小龙虾";
        model.price = @"19.9";
        model.originalPrice = @"29.9";
        model.goodsId = @"821";
        model.category = @"35";
        [temp addObject:model];
    }
    
    return temp;
}


- (NSArray *)homeVerGoodsItemList{
    //    @property (nonatomic, strong) NSString *img;
    //    @property (nonatomic, strong) NSString *name;
    //    @property (nonatomic, strong) NSString *price;
    //    @property (nonatomic, strong) NSString *link;
    //    @property (nonatomic, strong) NSString *goodsId;
    //    @property (nonatomic, strong) NSString *originalPrice;
    //    @property (nonatomic, strong) NSString *category;
    NSMutableArray *temp = [NSMutableArray new];
    for (int i = 0; i < 21; i++) {
        GoodsItemModel *model = [[GoodsItemModel alloc] init];
        model.img = @"img";
        model.name = @"爆料麻辣小龙虾";
        model.price = @"19.9";
        model.originalPrice = @"29.9";
        model.goodsId = @"821";
        model.category = @"35";
        [temp addObject:model];
    }
    
    return temp;
}


- (NSArray *)classifyFirstCateList{
    return @[@"热卖",@"会员特价",@"水果",@"蔬菜",@"肉蛋",@"水产",@"乳品",@"零食",@"酒饮",@"糕点",@"速食",@"熟食",@"粮油",@"日百",@"0元菜场",@"冰凉小卖铺",@"小龙虾",@"水果销售榜",@"粽子食街",@"石头食铺",];
}

- (NSArray *)classifySecondCateList{
    return @[@"新人大礼包",@"今日限时秒杀",@"时令水果",@"新鲜蔬菜",@"肉禽蛋类",@"乳品雪糕",@"水产熟食",@"休闲零食",@"饮料酒水",@"粮油速食",@"美妆百货"];
}

@end
