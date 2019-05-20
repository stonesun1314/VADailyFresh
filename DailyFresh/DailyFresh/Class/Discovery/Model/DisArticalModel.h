//
//  DisArticalModel.h
//  DailyFresh
//
//  Created by Mac on 2019/5/20.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DisArticalModel : BaseModel

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userHead;
@property (nonatomic, strong) NSString *articleName;
@property (nonatomic, strong) NSString *articleId;
@property (nonatomic, strong) NSString *articleImg;
@property (nonatomic, strong) NSString *browseNum;
@property (nonatomic, strong) NSNumber *isTopType;

@end

NS_ASSUME_NONNULL_END
