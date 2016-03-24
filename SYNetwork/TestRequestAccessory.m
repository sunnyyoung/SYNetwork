//
//  TestRequestAccessory.m
//  SYNetwork
//
//  Created by Sunnyyoung on 16/3/31.
//  Copyright © 2016年 Sunnyyoung. All rights reserved.
//

#import "TestRequestAccessory.h"

@implementation TestRequestAccessory

- (void)requestStart:(id)request {
    [SVProgressHUD showWithStatus:@"Loading"];
}

- (void)requestStop:(id)request {
    [SVProgressHUD showSuccessWithStatus:@"Finish"];
}

@end
