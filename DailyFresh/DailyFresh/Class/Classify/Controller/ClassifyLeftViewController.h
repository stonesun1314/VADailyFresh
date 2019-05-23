//
//  ClassifyLeftViewController.h
//  DailyFresh
//
//  Created by Mac on 2019/5/16.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^VASelectedCateBlock)(NSInteger index);

@interface ClassifyLeftViewController : BaseViewController

@property (nonatomic, strong) UITableView *aTableView;
@property (nonatomic, strong) NSArray *dataList;

@property (nonatomic, strong) VASelectedCateBlock selectedCateBlock;

@end

NS_ASSUME_NONNULL_END
