//
//  HomeFeatureSectionModel.h
//  DailyFresh
//
//  Created by Mac on 2019/5/23.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "BaseModel.h"
#import "GoodsItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeFeatureSectionModel : BaseModel

@property (nonatomic, strong) NSString *itemType;
@property (nonatomic, strong) NSArray <GoodsItemModel *>* subItem;

@end

NS_ASSUME_NONNULL_END
