//
//  ClassifyNavView.h
//  DailyFresh
//
//  Created by Mac on 2019/5/16.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^VAHandleLocationBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface ClassifyNavView : UIView

@property (nonatomic, strong) VAHandleLocationBlock handleLocationBlock;

@end

NS_ASSUME_NONNULL_END
