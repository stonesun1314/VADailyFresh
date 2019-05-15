//
//  HomeHeaderView.h
//  DailyFresh
//
//  Created by Mac on 2019/5/9.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeHeaderView : UIView

@property (nonatomic, strong) UIImageView *topBannerImageView;

@property (nonatomic, strong) SDCycleScrollView *bannerCycleScrollView;

@property (nonatomic, strong) UIView *cateMenuView;

@end

NS_ASSUME_NONNULL_END
