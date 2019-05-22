//
//  HomeHorCollectionViewCell.h
//  DailyFresh
//
//  Created by Mac on 2019/5/13.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeHorCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) GoodsItemModel *model;

@property (nonatomic, strong) VAAddShoppingCartBlock addCartBlock;


@end

NS_ASSUME_NONNULL_END
