//
//  BM_NetAPIClicnet.m
//  LPBM
//
//  Created by 赵文龙 on 15/3/3.
//  Copyright (c) 2015年 BM. All rights reserved.
//

#import "BM_NetAPIClicnet.h"
#import "NSObject+Common.h"
#import <CommonCrypto/CommonDigest.h>
#import "AppConfigure.h"

@implementation BM_NetAPIClicnet

+ (BM_NetAPIClicnet *)sharedJsonClient {
    static BM_NetAPIClicnet *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedClient = [[BM_NetAPIClicnet alloc] initWithBaseURL:[NSURL URLWithString:kSERVER]];
        
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/html", @"text/javascript", @"text/json", nil];
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    self.securityPolicy.allowInvalidCertificates = YES;
    
    return self;
}

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(int)NetworkMethod
                       andBlock:(void (^)(id data, NSError *error))block{
    //log请求数据
//    DebugLog(@"\n===========request===========\n%@    \n%@", aPath, params);
    NSLog(@"\n===========request===========\n%@    \n%@", aPath, params);
    
    aPath = [aPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self showHudTipStr:@"加载中"];

    //发起请求
    switch (NetworkMethod) {
        case Get:{
            [self GET:aPath parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"\n===========response===========\n%@ \n%@ repMsg = %@", aPath, responseObject,[responseObject objectForKey:@"repMsg"]);
                id error = [self handleResponse:responseObject];
                if (error) {
                    block(nil, error);
                }else{
                    block(responseObject, nil);
                }
                
                [MBProgressHUD hideHUD];
            
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"\n===========response===========\n%@ \n%@", aPath, error);
                [self showError:error];
                block(nil, error);
                
               [MBProgressHUD hideHUD];
            
            }];
            //[self removeProgressHUD];

            break;
        }
        case Post:{
            [self POST:aPath parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
                id error = [self handleResponse:responseObject];
                if (error) {
                    block(nil, error);
                }else{
                  

                    block(responseObject, nil);
                }
                
                [MBProgressHUD hideHUD];

            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                 
                [self showError:error];
                block(nil, error);
                
                [MBProgressHUD hideHUD];
            
            }];
            break;}
        case Put:{
            [self PUT:aPath parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
                id error = [self handleResponse:responseObject];
                if (error) {
                    block(nil, error);
                }else{
                    block(responseObject, nil);
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                [self showError:error];
                block(nil, error);
            }];
            break;}
        case Delete:{
            [self DELETE:aPath parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
                id error = [self handleResponse:responseObject];
                if (error) {
                    block(nil, error);
                }else{
                    block(responseObject, nil);
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                [self showError:error];
                block(nil, error);
            }];}
        default:
            break;
    }
}

@end
