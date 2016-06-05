//
//  GHIssue.h
//  MantleExample
//
//  Created by Kenta Kudo on 2016/06/05.
//  Copyright © 2016年 KentaKudo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

#import "GHUser.h"
#import "GHLabel.h"
#import "GHClosedBy.h"

typedef NS_ENUM(NSUInteger, GHIssueState) {
    GHIssueStateOpen = 0,
    GHIssueStateClosed
};

@interface GHIssue : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly) NSURL *url;
@property (nonatomic, readonly) NSInteger number;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) GHUser *user;
@property (nonatomic, readonly) NSArray<GHLabel *> *labels;
@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) GHIssueState state;
@property (nonatomic, readonly) GHClosedBy *closedBy;

@end
