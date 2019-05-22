//
//  CartGoodsItemModel.h
//  DailyFresh
//
//  Created by Mac on 2019/5/22.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "GoodsItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CartGoodsItemModel : GoodsItemModel

@property (nonatomic, strong) NSNumber *goodsNum;
@property (nonatomic, assign) BOOL selected;

@end

NS_ASSUME_NONNULL_END
