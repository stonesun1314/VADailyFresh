//
//  MineServiceSectionView.h
//  DailyFresh
//
//  Created by Mac on 2019/5/24.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^VAServiceItemBlock)(NSInteger index);

NS_ASSUME_NONNULL_BEGIN

@interface MineServiceSectionView : UIView

@property (nonatomic, strong) VAServiceItemBlock serviceItemBlock;

@end

NS_ASSUME_NONNULL_END
