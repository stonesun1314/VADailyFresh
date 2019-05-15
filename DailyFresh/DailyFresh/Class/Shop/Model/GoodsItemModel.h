//
//  GoodsItemModel.h
//  DailyFresh
//
//  Created by Mac on 2019/5/13.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GoodsItemModel : BaseModel

@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *goodsId;
@property (nonatomic, strong) NSString *originalPrice;
@property (nonatomic, strong) NSString *category;

@end

NS_ASSUME_NONNULL_END
