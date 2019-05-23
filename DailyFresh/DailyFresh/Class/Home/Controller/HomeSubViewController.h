//
//  HomeSubViewController.h
//  DailyFresh
//
//  Created by Mac on 2019/5/10.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "BaseViewController.h"
#import "HomeTopAdSectionModel.h"
#import "HomeCateSectionModel.h"
#import "HomeLimTimeSectionModel.h"
#import "HomeHeaderModel.h"

NS_ASSUME_NONNULL_BEGIN



@interface HomeSubViewController : BaseViewController

@property (nonatomic, strong) NSArray *verGoodsItemList;
@property (nonatomic, strong) HomeHeaderModel *headerBannerModel;
@property (nonatomic, strong) HomeCateSectionModel *cateSectionModel;
@property (nonatomic, strong) HomeLimTimeSectionModel *limTimeModel;
@property (nonatomic, strong) NSMutableArray *topAdModelArr;

@end

NS_ASSUME_NONNULL_END
