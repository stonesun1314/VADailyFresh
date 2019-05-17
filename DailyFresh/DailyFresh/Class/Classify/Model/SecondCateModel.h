//
//  SecondCateModel.h
//  DailyFresh
//
//  Created by Mac on 2019/5/17.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "BaseModel.h"
#import "GoodsItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondCateModel : BaseModel

@property (nonatomic, strong) NSString *cateId;
@property (nonatomic, strong) NSString *cateName;
@property (nonatomic, strong) NSString *cateSubName;
@property (nonatomic, strong) NSMutableArray <GoodsItemModel *>*goods;

@end

NS_ASSUME_NONNULL_END
