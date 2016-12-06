//
//  UserServices.h
//  Les
//
//  Created by 朱亮亮 on 14-11-4.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMNetWorkURLs.h"

@class UserModel;
@interface UserServices : NSObject

#pragma mark - 登录
/**
 *  登录接口
 *
 *  @param login           登录名（手机或邮箱）
 *  @param password        密码
 *  @param completionBlock 回调
 */
+ (void)loginByLogin:(NSString *)login
            password:(NSString *)password
     completionBlock:(void(^)(int result, id responseObject))completionBlock;

@end
