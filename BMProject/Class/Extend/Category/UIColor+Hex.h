//
//  UIColor+Hex.h
//  XHWL
//
//  Created by WangKaifeng on 15/7/29.
//  Copyright (c) 2015年 王凯锋 158682312@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end
