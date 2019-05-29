//
//  VASearchOptionsView.h
//  DailyFresh
//
//  Created by Mac on 2019/5/29.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^VASelectOptionItemBlock)(NSString *text);

NS_ASSUME_NONNULL_BEGIN

@interface VASearchOptionsView : UIView

@property (nonatomic, strong) VASelectOptionItemBlock selectItemBlock;

- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
