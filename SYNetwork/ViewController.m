//
//  ViewController.m
//  SYNetwork
//
//  Created by Sunnyyoung on 16/3/21.
//  Copyright © 2016年 Sunnyyoung. All rights reserved.
//

#import "ViewController.h"
#import "SYNetwork.h"
#import "TestRequest.h"
#import "TestRequestAccessory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setMinimumDismissTimeInterval:1.0];
    [SYNetworkConfig sharedInstance].baseURL = @"http://gank.io";
}

#pragma mark - Event Response

- (IBAction)singleRequestAction:(id)sender {
    TestRequest *test = [[TestRequest alloc] init];
    [test.accessoryArray addObject:[[TestRequestAccessory alloc] init]];
    [test startWithBlockSuccess:^(__kindof SYBaseRequest *request) {
        
    } failure:^(__kindof SYBaseRequest *request, NSError *error) {
        
    }];
}

- (IBAction)batchRequestAction:(id)sender {
    NSArray *requestArray = @[[[TestRequest alloc] init],
                              [[TestRequest alloc] init],
                              [[TestRequest alloc] init],
                              [[TestRequest alloc] init]];
    SYBatchRequest *batchRequest = [[SYBatchRequest alloc] initWithRequestArray:requestArray enableAccessory:YES];
    [batchRequest.accessoryArray addObject:[[TestRequestAccessory alloc] init]];
    [batchRequest startWithBlockSuccess:^(SYBatchRequest *batchRequest) {
        
    } failure:^(SYBatchRequest *request) {
        
    }];
}

- (IBAction)chainRequestAction:(id)sender {
    SYChainRequest *chainRequest = [[SYChainRequest alloc] initWithEnableAccessory:YES];
    [chainRequest.accessoryArray addObject:[[TestRequestAccessory alloc] init]];
    [chainRequest addRequest:[[TestRequest alloc] init] callback:^(SYChainRequest *chainRequest, __kindof SYBaseRequest *request) {
        [chainRequest addRequest:[[TestRequest alloc] init] callback:^(SYChainRequest *chainRequest, __kindof SYBaseRequest *request) {
            [chainRequest addRequest:[[TestRequest alloc] init] callback:^(SYChainRequest *chainRequest, __kindof SYBaseRequest *request) {
                [chainRequest addRequest:[[TestRequest alloc] init] callback:^(SYChainRequest *chainRequest, __kindof SYBaseRequest *request) {
                    
                }];
            }];
        }];
    }];
    [chainRequest start];
}

@end
