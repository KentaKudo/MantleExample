//
//  GHIssue.m
//  MantleExample
//
//  Created by Kenta Kudo on 2016/06/05.
//  Copyright © 2016年 KentaKudo. All rights reserved.
//

#import "GHIssue.h"

@implementation GHIssue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"url"      : @"url",
             @"number"   : @"number",
             @"title"    : @"title",
             @"user"     : @"user",
             @"labels"   : @"labels",
             @"createdAt": @"created_at",
             @"state"    : @"state",
             @"closedBy" : @"closed_by"
             };
}

+ (NSValueTransformer *)urlJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:@{
                                                                           @"open"  : @(GHIssueStateOpen),
                                                                           @"closed": @(GHIssueStateClosed)
                                                                           }];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter dateFromString:dateString];
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

+ (NSValueTransformer *)labelsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:GHLabel.class];
}

+ (NSValueTransformer *)closedByJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSDictionary *value, BOOL *success, NSError *__autoreleasing *error) {
        GHClosedBy *closedBy = [GHClosedBy new];
        closedBy.login = value[@"login"];
        return closedBy;
    }];
}



//-----------------------------------------------------------------------
// Helper Method

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    return dateFormatter;
}

@end
