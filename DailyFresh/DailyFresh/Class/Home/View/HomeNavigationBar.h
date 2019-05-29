//
//  HomeNavigationBar.h
//  DailyFresh
//
//  Created by Mac on 2019/5/15.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^VAHandleScanCodeBlock)(void);
typedef void(^VAHandleLocationBlock)(void);

NS_ASSUME_NONNULL_BEGIN



@interface HomeNavigationBar : UIView

@property (nonatomic, strong) SGPageTitleView *pageTitleView;

@property (nonatomic, strong) VAHandleScanCodeBlock handleScanBlock;
@property (nonatomic, strong) VAHandleLocationBlock handleLocationBlock;

@property (nonatomic, strong) NSString *locationStr;

@end

NS_ASSUME_NONNULL_END
