//
//  MineHeaderView.h
//  DailyFresh
//
//  Created by Mac on 2019/5/24.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^VALoginBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface MineHeaderView : UIView

@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *messageBtn;

@property (nonatomic, strong) VALoginBlock loginBlock;

@end

NS_ASSUME_NONNULL_END
