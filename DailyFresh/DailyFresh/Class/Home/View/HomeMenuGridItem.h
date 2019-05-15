//
//  HomeMenuGridItem.h
//  DailyFresh
//
//  Created by Mac on 2019/5/10.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCateItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeMenuGridItem : UIView

@property (nonatomic, strong) UIButton *gridItemBtn;

@property (nonatomic, strong) HomeCateItemModel *model;

@end

NS_ASSUME_NONNULL_END
