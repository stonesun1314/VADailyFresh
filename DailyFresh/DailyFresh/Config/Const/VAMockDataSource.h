//
//  VAMockDataSource.h
//  DailyFresh
//
//  Created by Mac on 2019/5/14.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartGoodsItemModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface VAMockDataSource : NSObject

+(instancetype)shareInstance;

@property (nonatomic, strong) NSMutableArray <CartGoodsItemModel*>*cartList;

- (NSDictionary *)readJsonFromFileName:(NSString *)fileName;

- (NSArray *)homeCateList;

- (NSArray *)homeHorGoodsItemList;

- (NSArray *)homeVerGoodsItemList;

- (NSArray *)classifyFirstCateList;

- (NSArray *)classifySecondCateList;

- (void)addShoppingCart:(GoodsItemModel *)model;

@end

NS_ASSUME_NONNULL_END
