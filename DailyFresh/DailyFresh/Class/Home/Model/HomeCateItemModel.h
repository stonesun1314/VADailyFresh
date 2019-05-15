//
//  HomeCateItemModel.h
//  DailyFresh
//
//  Created by Mac on 2019/5/10.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeCateItemModel : BaseModel

@property (nonatomic, strong) NSString *cateId;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *name;

@end

NS_ASSUME_NONNULL_END
