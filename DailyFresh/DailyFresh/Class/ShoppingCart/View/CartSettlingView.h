//
//  CartSettlingView.h
//  DailyFresh
//
//  Created by Mac on 2019/5/23.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^VASelectAllBlock)(BOOL select);

@interface CartSettlingView : UIView


@property (nonatomic , strong) NSString *totalPrice;

@property (nonatomic, strong) VASelectAllBlock selectAllBlock;


@end

NS_ASSUME_NONNULL_END
