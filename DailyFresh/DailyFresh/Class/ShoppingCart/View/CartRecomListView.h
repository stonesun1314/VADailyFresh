//
//  CartRecomListView.h
//  DailyFresh
//
//  Created by Mac on 2019/5/22.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CartRecomListView : UIView

@property (nonatomic, strong) NSArray <GoodsItemModel *>*goodsItemList;

@end

NS_ASSUME_NONNULL_END
