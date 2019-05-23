//
//  VAMockDataSource.m
//  DailyFresh
//
//  Created by Mac on 2019/5/14.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "VAMockDataSource.h"

#import "GoodsItemModel.h"
#import "CartGoodsItemModel.h"

@interface VAMockDataSource ()


@end

@implementation VAMockDataSource

// 创建静态对象 防止外部访问
static VAMockDataSource *_instance;

// 为了使实例易于外界访问 我们一般提供一个类方法
// 类方法命名规范 share类名|default类名|类名
+(instancetype)shareInstance
{
    //return _instance;
    // 最好用self 用Tools他的子类调用时会出现错误
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [[super alloc] init];
        }
    });
    return _instance;
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

- (instancetype)init{
    self = [super init];
    if (self) {
        _cartList = [NSMutableArray new];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self readCartListFromFile];
        });
        
    }
    return self;
}

- (NSDictionary *)readJsonFromFileName:(NSString *)fileName{
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@""];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error = nil;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"\n%@", [error localizedDescription]);
    
    return result;
}

- (void)readCartListFromFile {
    //读取Json//==Json文件路径
    NSString *path = [[NSFileManager defaultManager] applicationLibraryDirectory];
    
    NSString *Json_path=[path stringByAppendingPathComponent:@"cart_list.plist"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        
        NSArray *JsonObject = [[NSArray alloc] initWithContentsOfFile:Json_path];
        NSLog(@"---plist一开始保存时候的内容---%@",JsonObject);
//        //==Json数据
//        NSData *data=[NSData dataWithContentsOfFile:Json_path];
//        NSError *error;
//        //==JsonObject
//        NSArray *JsonObject=[NSJSONSerialization JSONObjectWithData:data
//                                                      options:NSJSONReadingAllowFragments
//                                                        error:&error];
        for (NSDictionary *dict in JsonObject) {
            
            CartGoodsItemModel *model = [CartGoodsItemModel yy_modelWithJSON:dict];
            [_cartList addObject:model];
        }
//        VALog(@"%@",JsonObject);
    }

}

- (void)writeCartItemsToFile{
    
    id jsonData = [self.cartList yy_modelToJSONObject];
    
    VALog(@"%@",jsonData);
    
    NSString *path = [[NSFileManager defaultManager] applicationLibraryDirectory];
    
    NSString *Json_path=[path stringByAppendingPathComponent:@"cart_list.plist"];
    //==写入文件
    NSLog(@"%@",[jsonData writeToFile:Json_path atomically:YES] ? @"Succeed":@"Failed");

}

- (BOOL)writeToFileName:(NSString *)fileName{
 
    return YES;
}

- (NSArray *)homeCateList{
    NSArray *cateNameList = @[@"时令水果",@"新鲜蔬菜",@"肉禽蛋类",@"海鲜水产",@"乳品雪糕",@"粮油调味",@"烘焙糕点",@"酒水饮料",@"休闲零食",@"粽子速食",@"美妆百货",@"调味粮油",@"卤味熟食",@"邀请有礼"];
    return cateNameList;
}

- (NSArray *)homeHorGoodsItemList{
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

- (void)addShoppingCart:(GoodsItemModel *)model{
    VALog(@"id:%@,name:%@",model.goodsId,model.name);
    
    BOOL isAdd = NO;
    for (CartGoodsItemModel *cartModel in _cartList) {
        if ([cartModel.goodsId isEqualToString:model.goodsId]) {
            cartModel.goodsNum = [self add:cartModel.goodsNum and:[NSNumber numberWithInteger:1]];
            isAdd = YES;
            
            //通知购物车刷新
            [[NSNotificationCenter defaultCenter] postNotificationName:VAShoppingCardChangeNotification object:nil];
            return;
        }
    }
    
    CartGoodsItemModel *cartModel = [[CartGoodsItemModel alloc] init];
    cartModel.name = model.name;
    cartModel.goodsId = model.goodsId;
    cartModel.category = model.category;
    cartModel.price = model.originalPrice;
    cartModel.originalPrice = model.originalPrice;
    cartModel.img = model.img;
    cartModel.link = model.link;
    cartModel.goodsNum = [NSNumber numberWithInteger:1];
    
    [self.cartList addObject:cartModel];
    

    //通知购物车刷新
    [[NSNotificationCenter defaultCenter] postNotificationName:VAShoppingCardChangeNotification object:nil];
    
    [self writeCartItemsToFile];
}

- (NSNumber*)add:(NSNumber *)one and:(NSNumber *)anotherNumber
{
    return [NSNumber numberWithFloat:[one integerValue] + [anotherNumber integerValue]];
}

- (void)saveCartData{
    
}

@end
