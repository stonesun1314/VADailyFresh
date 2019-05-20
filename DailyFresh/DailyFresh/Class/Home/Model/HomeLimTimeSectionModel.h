//
//  HomeLimTimeSectionModel.h
//  DailyFresh
//
//  Created by Mac on 2019/5/20.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "BaseModel.h"

#import "GoodsItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeLimTimeSectionModel : BaseModel

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSArray <GoodsItemModel *>*subItem;

@end

NS_ASSUME_NONNULL_END
