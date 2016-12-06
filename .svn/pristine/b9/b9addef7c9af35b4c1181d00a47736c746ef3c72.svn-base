//
//  CMManager.m
//  BMProject
//
//  Created by MengHuan on 15/4/19.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

#import "CMManager.h"

// MD5加密
#import <CommonCrypto/CommonDigest.h>




@implementation CMManager

singleton_for_class(CMManager)


#pragma mark - MD5加密
- (NSString *)md5ByString:(NSString *)string
{
    const char *cStr = [string UTF8String];
    unsigned char result[32];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    // 先转MD5，再转大写
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

#pragma mark - 判断字符串是否为空
- (BOOL)isBlankString:(NSString *)string
{
    if (string == nil || string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    // 去掉前后空格，判断length是否为0
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    
    if ([string isEqualToString:@"(null)"] || [string isEqualToString:@"null"]) {
        return YES;
    }
    
    return NO;
}

#pragma mark - 判断是否为真实手机号码
- (BOOL)checkInputMobile:(NSString *)_text
{
    //
    NSString *MOBILE    = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString *CM        = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2378]|7[7])\\d)\\d{7}$";   // 包含电信4G 177号段
    NSString *CU        = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString *CT        = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    //
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    BOOL res1 = [regextestmobile evaluateWithObject:_text];
    BOOL res2 = [regextestcm evaluateWithObject:_text];
    BOOL res3 = [regextestcu evaluateWithObject:_text];
    BOOL res4 = [regextestct evaluateWithObject:_text];
    
    if (res1 || res2 || res3 || res4 )
    {
        return YES;
    }
    
    return NO;
}

#pragma mark - 判断email格式是否正确
- (BOOL)isAvailableEmail:(NSString *)emailString
{
    NSString *emailRegEx =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    //先把NSString转换为小写
    NSString *lowerString       = emailString.lowercaseString;
    
    return [regExPredicate evaluateWithObject:lowerString] ;
}

#pragma mark - 姓名验证
- (BOOL)isValidateName:(NSString *)name
{
    // 只含有汉字、数字、字母、下划线不能以下划线开头和结尾
    NSString *userNameRegex = @"^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    return [userNamePredicate evaluateWithObject:name];
}

#pragma mark - 修改view的单个属性值
- (void)viewFrameSet:(UIView *)view key:(NSString *)key value:(CGFloat)value
{
    if (!view) {
        return;
    }
    
    CGRect rect = view.frame;
    
    if ([@"x" isEqualToString:key]) {
        rect.origin.x = value;
        
    } else if ([@"y" isEqualToString:key]) {
        rect.origin.y = value;
        
    } else if ([@"w" isEqualToString:key]) {
        rect.size.width = value;
        
    } else if ([@"h" isEqualToString:key]) {
        rect.size.height = value;
    }
    
    view.frame = rect;
}

#pragma mark - 修改view的多个属性值
- (void)viewFrameSet:(UIView *)view key1:(NSString *)key1 value1:(CGFloat)value1 key2:(NSString *)key2 value2:(CGFloat)value2
{
    if (!view) {
        return;
    }
    
    CGRect rect = view.frame;
    
    if ([@"x" isEqualToString:key1]) {
        rect.origin.x = value1;
        
    } else if ([@"y" isEqualToString:key1]) {
        rect.origin.y = value1;
        
    } else if ([@"w" isEqualToString:key1]) {
        rect.size.width = value1;
        
    } else if ([@"h" isEqualToString:key1]) {
        rect.size.height = value1;
    }
    
    if ([@"x" isEqualToString:key2]) {
        rect.origin.x = value2;
        
    } else if ([@"y" isEqualToString:key2]) {
        rect.origin.y = value2;
        
    } else if ([@"w" isEqualToString:key2]) {
        rect.size.width = value2;
        
    } else if ([@"h" isEqualToString:key2]) {
        rect.size.height = value2;
    }
    
    view.frame = rect;
}

#pragma mark - URL编码
- (NSString *)urlCodingToUTF8ByUrlString:(NSString *)urlString
{
    return [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

#pragma mark - URL解码
- (NSString *)urlDecodingToUrlStringByUTF8String:(NSString *)utf8String
{
    return [utf8String stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


@end
