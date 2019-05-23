//
//  SecondCateView.h
//  DailyFresh
//
//  Created by Mac on 2019/5/17.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondCateModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondCateView : UIView

@property (nonatomic, strong) NSArray *dataList;

@property (nonatomic, strong) void(^selectedCateBlock)(NSInteger index,SecondCateModel *model);

- (void)selectIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
