//
//  CartTableViewCell.h
//  DailyFresh
//
//  Created by Mac on 2019/5/21.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartGoodsItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CartTableViewCell : UITableViewCell

@property (nonatomic, strong) CartGoodsItemModel *model;

@end

NS_ASSUME_NONNULL_END
