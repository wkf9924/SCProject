//
//  AFNetworkTool.m
//  AFNetText
//
//  Created by wxxu on 15/1/27.
//  Copyright (c) 2015年 wxxu. All rights reserved.
//

#import "AFNetworkTool.h"
#import "AFHTTPRequestOperation.h"
#import "JSONFunction.h"
#import "AFNetworking.h"
#import "AppConfigure.h"


//#import "NSURLRequest+Url.h"

@implementation AFNetworkTool



/**
 第二种方法，利用AFHTTPRequestOperation
 param:url          请求地址
 param:params       请求参数
 param:success      请求成返回json
 param:fail         请求失败
 */
+ (void)httpRequestWithUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSString *data))success fail:(void (^)())fail
{
    NSURL *urlstr = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:urlstr];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html = operation.responseString;
//        NSData* data=[html dataUsingEncoding:NSUTF8StringEncoding];
        if (success) {
            success(html);
            
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"httpRequest:%@",error);
        if (fail) {
            fail();
        }

    }];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
    
}

+ (void)httpRequestWithUrl:(NSString *)url success:(void (^)(NSString *data))success fail:(void (^)())fail
{
    return [self httpRequestWithUrl:url params:nil success:success fail:fail];
}


+ (void)jsonGetRequestWithUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSDictionary *data))success fail:(void (^)())fail
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *data = [JSONFunction JSONString:responseObject];
        NSDictionary *ds = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];

        if (ds) {
            success(ds);
        }
        NSLog(@"dsdsdsdsds:%@",ds);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        fail(error.description);
//        [[iToast makeToast:error.description] show];
       
    }];
    
}
+ (void)jsonPostRequestWithUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSDictionary *data))success fail:(void (^)())fail
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *data = [JSONFunction JSONString:responseObject];
        NSDictionary *ds = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        if (ds) {
            success(ds);
        }
        NSLog(@"POST:%@",ds);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
    }];
    
    
    
}

+ (void)jsonRequestWithUrl:(NSString *)url success:(void (^)(NSDictionary *data))success fail:(void (^)())fail
{
    return [self jsonGetRequestWithUrl:url params:nil success:success fail:fail];
}



+ (void)jsonStringRequestWithUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSString *data))success fail:(void (^)())fail
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (!responseObject) {
            NSLog(@"responseObject:%@", responseObject);
            return;
        }
        NSData *data = [JSONFunction JSONString:responseObject];
        NSString *ds = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        if (ds) {
            success(ds);
        }
        NSLog(@"GETString:%@",ds);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        fail(error.description);
        
    }];

    
}
/**
 *  POST提交  返回id数据
 *
 *  @param url
 *  @param params
 *  @param success
 *  @param fail
 */

+ (void)jsonPostStringRequestWithUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(id  data))success fail:(void (^)())fail;
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSLog(@"URL=======%@%@",url, params);

    [LCProgressHUD showLoadingText:@"加载中"];
    
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [LCProgressHUD hide];
        if (!responseObject) {
            NSLog(@"responseObject:%@ \n operation%@", responseObject, operation.responseString);
            return;
        }
                NSData *data = [JSONFunction JSONString:responseObject];
                id ds = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//        NSString *ds = [responseObject toJsonString];
//        NSDictionary *jsonData = [ds toJsonDictionary];
        NSLog(@"jsonData:%@ ", ds);
        if (ds) {
            success(ds);
        }
//        NSLog(@"POSTString:%@",ds);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [LCProgressHUD hide];
//        [IanAlert hideLoading];
        NSLog(@"Error: %@ operationName;%@", error,operation.responseString);
    }];
}

/**
 *  json字符串提交数据
 */
+ (void)jsonPostRequestStringUrl:(NSString *)url params:(NSString *)params success:(void (^)(NSString *data))success fail:(void (^)())fail;
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (!responseObject) {
            NSLog(@"responseObject:%@........string:%@", responseObject, operation.responseString);
            return;
        }
        NSData *data = [JSONFunction JSONString:responseObject];
        NSString *ds = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        if (ds) {
            success(ds);
        }
        NSLog(@"POSTString:%@",ds);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@ operationName;%@", error,operation.responseString);
    }];
}


@end
