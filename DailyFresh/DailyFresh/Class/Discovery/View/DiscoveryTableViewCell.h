//
//  DiscoveryTableViewCell.h
//  DailyFresh
//
//  Created by Mac on 2019/5/20.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DisArticalModel.h"

typedef NS_ENUM(NSInteger,ArticalType) {
    ArcitalTypeNormal = 1,
    ArcitalTypeTop  ,
    
};

NS_ASSUME_NONNULL_BEGIN

@interface DiscoveryTableViewCell : UITableViewCell

@property (nonatomic, assign) ArticalType type;

@property (nonatomic, strong) DisArticalModel *model;

@end

NS_ASSUME_NONNULL_END
