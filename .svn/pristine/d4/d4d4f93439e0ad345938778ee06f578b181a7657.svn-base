//
//  UserServices.m
//  Les
//
//  Created by 朱亮亮 on 14-11-4.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "UserServices.h"
#import "BMNetworkHandler.h"
#import "SVProgressHUD.h"


@implementation UserServices

#pragma mark - 登录
+ (void)loginByLogin:(NSString *)login
            password:(NSString *)password
     completionBlock:(void(^)(int result, id responseObject))completionBlock
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:login forKey:@"login"];
    [params setValue:password forKey:@"password"];
    
    [[BMNetworkHandler sharedInstance] conURL:LOGIN
                                  networkType:NetWorkPOST
                                       params:params
                                     delegate:nil
                                      showHUD:YES
                                 successBlock:^(id returnData) {
                                     int result = [[returnData objectForKey:@"result"] intValue];
                                     
                                     if (result == 1) {
                                         if (completionBlock) {
                                             completionBlock(1, [returnData objectForKey:@"data"]);
                                         }
                                     }
                                     else {
//                                         [UIAlertView alertWithTitle:@"提示" message:[returnData objectForKey:@"error"] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                                         
                                         if (completionBlock) {
                                             completionBlock(result, nil);
                                         }
                                     }
                                     
                                 } failureBlock:^(NSError *error) {
                                     if (completionBlock) {
                                         completionBlock(API_COULD_NOT_CONNECT_ERROR, nil);
                                     }
                                 }];
}

@end
