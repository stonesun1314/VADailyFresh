//
//  VALocationViewController.h
//  DailyFresh
//
//  Created by Mac on 2019/5/27.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^VASelectedLocationBlock)(NSString *text);


NS_ASSUME_NONNULL_BEGIN

@interface VALocationViewController : BaseViewController

@property (nonatomic, strong) VASelectedLocationBlock selectLocationBlock;

@end

NS_ASSUME_NONNULL_END
