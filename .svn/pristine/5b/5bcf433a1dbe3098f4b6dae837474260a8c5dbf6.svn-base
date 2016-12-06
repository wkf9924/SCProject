//
//  CMManager.h
//  BMProject
//
//  Created by MengHuan on 15/4/19.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

/**
 *  常用方法管理器
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SingletonTemplate.h"   // 单例模板


@interface CMManager : NSObject

singleton_for_header(CMManager)


#pragma mark - MD5加密
/**
 *  MD5加密
 *
 *  @param string 要加密的字段
 *
 *  @return MD5加密后的新字段
 */
- (NSString *)md5ByString:(NSString *)string;


#pragma mark - 判断字符串是否为空
/**
 *  判断字符串是否为空
 *
 *  @param string 要判断的字符串
 *
 *  @return 返回YES为空，NO为不空
 */
- (BOOL)isBlankString:(NSString *)string;


#pragma mark - 判断是否为真实手机号码
/**
 *  判断是否为真实手机号码
 *
 *  @param mobile 手机号
 *
 *  @return 返回YES为真实手机号码，NO为否
 */
- (BOOL)checkInputMobile:(NSString *)_text;


#pragma mark - 判断email格式是否正确
/**
 *  判断email格式是否正确
 *
 *  @param emailString 邮箱
 *
 *  @return 返回YES为Email格式正确，NO为否
 */
- (BOOL)isAvailableEmail:(NSString *)emailString;


#pragma mark - 姓名验证
/**
 *  姓名验证
 *
 *  @param name 姓名
 *
 *  @return 返回YES为姓名规格正确，NO为否
 */
- (BOOL)isValidateName:(NSString *)name;


#pragma mark - 修改对象的单个属性值
/**
 *  修改对象的单个属性值
 *
 *  @param view  要修改的view、imageView、button、...
 *  @param key   要修改的属性，例如：@"x",@"y",@"w",@"h"
 *  @param value 被修改属性的新值
 */
- (void)viewFrameSet:(UIView *)view key:(NSString *)key value:(CGFloat)value;


#pragma mark - 修改对象的多个属性值
/**
 *  修改对象的多个属性值
 *
 *  @param view   要修改的view、imageView、button、...
 *  @param key1   要修改的属性1，例如：@"x",@"y",@"w",@"h"
 *  @param value1 属性1的新值
 *  @param key2   要修改的属性2，例如：@"x",@"y",@"w",@"h"
 *  @param value2 属性2的新值
 */
- (void)viewFrameSet:(UIView *)view key1:(NSString *)key1 value1:(CGFloat)value1 key2:(NSString *)key2 value2:(CGFloat)value2;


#pragma mark - URL编码
/**
 *  URL编码，http请求遇到汉字的时候，需要转化成UTF-8
 *
 *  @param urlString 需要编码的URL字符串
 *
 *  @return 编码的字符串
 */
- (NSString *)urlCodingToUTF8ByUrlString:(NSString *)urlString;


#pragma mark - URL解码
/**
 *  URL解码，URL格式是 %3A%2F%2F 这样的，则需要进行UTF-8解码
 *
 *  @param utf8String 需要解码的URL字符串
 *
 *  @return 解码的字符串
 */
- (NSString *)urlDecodingToUrlStringByUTF8String:(NSString *)utf8String;


@end
