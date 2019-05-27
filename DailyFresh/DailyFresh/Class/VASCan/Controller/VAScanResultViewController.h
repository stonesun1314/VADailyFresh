//
//  VAScanResultViewController.h
//  DailyFresh
//
//  Created by Mac on 2019/5/27.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface VAScanResultViewController : BaseViewController

@property (nonatomic, strong) UIImage* imgScan;
@property (nonatomic, copy) NSString* strScan;

@property (nonatomic, copy)NSString *strCodeType;

@end

NS_ASSUME_NONNULL_END
