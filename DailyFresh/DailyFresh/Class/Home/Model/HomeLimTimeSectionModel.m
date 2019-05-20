//
//  HomeLimTimeSectionModel.m
//  DailyFresh
//
//  Created by Mac on 2019/5/20.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "HomeLimTimeSectionModel.h"

@implementation HomeLimTimeSectionModel

+(NSDictionary *)modelContainerPropertyGenericClass
{
    return @{@"subItem" : [GoodsItemModel class]};
}

@end
