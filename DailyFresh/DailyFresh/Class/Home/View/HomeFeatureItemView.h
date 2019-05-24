//
//  HomeFeatureItemView.h
//  DailyFresh
//
//  Created by Mac on 2019/5/23.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeFeatureItemView : UIView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;

@property (nonatomic, strong) UIImageView *imageView1;

@property (nonatomic, strong) UIImageView *imageView2;

@property (nonatomic, strong) GoodsItemModel *model;

@end

NS_ASSUME_NONNULL_END
