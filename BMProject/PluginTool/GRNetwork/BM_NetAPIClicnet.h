//
//  BM_NetAPIClicnet.h
//  LPBM
//
//  Created by 赵文龙 on 15/3/3.
//  Copyright (c) 2015年 BM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef enum {
    Get = 0,
    Post,
    Put,
    Delete
} NetworkMethod;

@interface BM_NetAPIClicnet : AFHTTPRequestOperationManager

+ (BM_NetAPIClicnet *)sharedJsonClient;

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(int)NetworkMethod
                       andBlock:(void (^)(id data, NSError *error))block;

@end
