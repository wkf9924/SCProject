//
//  AFNetworkTool.h
//  AFNetText
//
//  Created by wxxu on 15/1/27.
//  Copyright (c) 2015年 wxxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFNetworkTool : NSObject



/**第二种方法，利用AFHTTPRequestOperation**/
+ (void)httpRequestWithUrl:(NSString *)url success:(void (^)(NSString *data))success fail:(void (^)())fail;
+ (void)httpRequestWithUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSString *data))success fail:(void (^)())fail;

+ (void)jsonRequestWithUrl:(NSString *)url success:(void (^)(NSDictionary *data))success fail:(void (^)())fail;

+ (void)jsonGetRequestWithUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSDictionary *data))success fail:(void (^)())fail;


+ (void)jsonPostRequestWithUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSDictionary *data))success fail:(void (^)())fail;


+ (void)jsonStringRequestWithUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSString *data))success fail:(void (^)())fail;

/**
 *  POST提交 返回id数据
 *
 *  @param url     <#url description#>
 *  @param params  <#params description#>
 *  @param success <#success description#>
 *  @param fail    <#fail description#>
 */
+ (void)jsonPostStringRequestWithUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(id  data))success fail:(void (^)())fail;

/**
 *   json字符串提交数据 @param url     serverUrl   params  提交的参数
 *  @param url     serverUrl
 *  @param params  提交的参数
 *  @param success <#success description#>
 *  @param fail    fail description
 */
+ (void)jsonPostRequestStringUrl:(NSString *)url params:(NSString *)params success:(void (^)(NSString *data))success fail:(void (^)())fail;

@end
