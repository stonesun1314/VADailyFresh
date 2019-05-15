//
//  VAMockDataSource.h
//  DailyFresh
//
//  Created by Mac on 2019/5/14.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VAMockDataSource : NSObject

+(instancetype)shareInstance;

- (NSArray *)homeCateList;

- (NSArray *)homeHorGoodsItemList;

- (NSArray *)homeVerGoodsItemList;

@end

NS_ASSUME_NONNULL_END
