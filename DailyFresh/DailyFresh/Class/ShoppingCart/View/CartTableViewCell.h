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

typedef void(^VACellSelectedBlock)(BOOL select);

@interface CartTableViewCell : UITableViewCell

@property (nonatomic, strong) CartGoodsItemModel *model;
@property (nonatomic, strong) VAAddShoppingCartBlock addCartBlock;
@property (nonatomic, strong) VASubShoppingCartBlock subCartBlock;
@property (nonatomic, strong) VACellSelectedBlock cellSelectedBlock;


@end

NS_ASSUME_NONNULL_END
