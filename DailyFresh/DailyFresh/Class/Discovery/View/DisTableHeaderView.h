//
//  DisTableHeaderView.h
//  DailyFresh
//
//  Created by Mac on 2019/5/21.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DisTableHeaderView : UIView

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *verSeparatorLine;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UIView *horSeparatorLine;

@end

NS_ASSUME_NONNULL_END
