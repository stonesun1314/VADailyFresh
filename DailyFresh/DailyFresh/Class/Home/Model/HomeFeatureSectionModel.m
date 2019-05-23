//
//  HomeFeatureSectionModel.m
//  DailyFresh
//
//  Created by Mac on 2019/5/23.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "HomeFeatureSectionModel.h"

@implementation HomeFeatureSectionModel

+(NSDictionary *)modelContainerPropertyGenericClass
{
    return @{@"subItem" : [GoodsItemModel class]};
}

@end
