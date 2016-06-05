//
//  GHUser.m
//  MantleExample
//
//  Created by Kenta Kudo on 2016/06/05.
//  Copyright © 2016年 KentaKudo. All rights reserved.
//

#import "GHUser.h"

@implementation GHUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"siteAdmin": @"site_admin"
             };
}

@end
