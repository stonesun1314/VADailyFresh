//
//  HomeHeaderModel.m
//  DailyFresh
//
//  Created by Mac on 2019/5/20.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "HomeHeaderModel.h"

@implementation HomeHeaderModel

+(NSDictionary *)modelContainerPropertyGenericClass
{
    return @{@"top" : [HomeTopAdModel class],
             @"banner" : [HomeBannerModel class],
             };
}

@end
