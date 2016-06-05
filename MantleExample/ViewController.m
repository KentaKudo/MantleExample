//
//  ViewController.m
//  MantleExample
//
//  Created by Kenta Kudo on 2016/06/05.
//  Copyright © 2016年 KentaKudo. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "ViewController.h"
#import "GHIssue.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *requestURL = [NSURL URLWithString:@"https://api.github.com/repos/Mantle/Mantle/issues/1"];
    [[[NSURLSession sharedSession] dataTaskWithURL:requestURL
                                completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                    
                                    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                    GHIssue *issue = [MTLJSONAdapter modelOfClass:GHIssue.class
                                                               fromJSONDictionary:jsonDic
                                                                            error:nil];
                                    
                                    NSLog(@"issue.url             = %@",  issue.url);
                                    NSLog(@"issue.number          = %ld", issue.number);
                                    NSLog(@"issue.title           = %@",  issue.title);
                                    NSLog(@"issue.user.siteAdimin = %d",  issue.user.siteAdmin);
                                    NSLog(@"issue.labels[0].name  = %@",  issue.labels[0].name);
                                    NSLog(@"issue.createdAt       = %@",  issue.createdAt);
                                    NSLog(@"issue.state           = %ld", issue.state);
                                    NSLog(@"issue.closedBy.login  = %@",  issue.closedBy.login);
                                    
                                }] resume];
}
@end
