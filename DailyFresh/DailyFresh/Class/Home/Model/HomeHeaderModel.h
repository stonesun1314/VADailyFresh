//
//  HomeHeaderModel.h
//  DailyFresh
//
//  Created by Mac on 2019/5/20.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "BaseModel.h"
#import "HomeTopAdModel.h"
#import "HomeBannerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeHeaderModel : BaseModel

@property (nonatomic, strong) HomeTopAdModel *top;
@property (nonatomic, strong) NSArray <HomeBannerModel *>* banner;

@end

NS_ASSUME_NONNULL_END
