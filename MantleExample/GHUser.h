//
//  GHUser.h
//  MantleExample
//
//  Created by Kenta Kudo on 2016/06/05.
//  Copyright © 2016年 KentaKudo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface GHUser : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly) BOOL siteAdmin;

@end
