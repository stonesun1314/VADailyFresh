//
//  HomeHorListSection.h
//  DailyFresh
//
//  Created by Mac on 2019/5/13.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsItemModel.h"

typedef  NS_ENUM(NSInteger, HomeHorListType){
    HomeHorListTypeTitle    = 1,
    HomeHorListTypeTopAd,
};

NS_ASSUME_NONNULL_BEGIN

@interface HomeHorListSection : UIView


@property (nonatomic, assign) HomeHorListType type;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSString *topAdImg;
@property (nonatomic, strong) NSArray <GoodsItemModel *>*goodsItemList;

- (instancetype)initWithType:(HomeHorListType)type;

@end

NS_ASSUME_NONNULL_END
