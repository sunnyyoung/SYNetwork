//
//  TestRequest.m
//  SYNetwork
//
//  Created by Sunnyyoung on 16/3/23.
//  Copyright © 2016年 Sunnyyoung. All rights reserved.
//

#import "TestRequest.h"

@implementation TestRequest

- (BOOL)enableCache {
    return YES;
}

- (BOOL)enableAccessory {
    return YES;
}

- (NSURLRequestCachePolicy)requestCachePolicy {
    return NSURLRequestReloadIgnoringCacheData;
}

- (NSString *)requestPath {
    return @"/api/random/data/Android/20";
}

- (SYRequestMethod)requestMethod {
    return SYRequestMethodGET;
}

@end
