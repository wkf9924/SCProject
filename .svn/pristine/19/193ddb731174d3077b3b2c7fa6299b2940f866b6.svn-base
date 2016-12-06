//
//  NSString+MHCommon.h
//  PerfectProject
//
//  Created by Meng huan on 14/11/19.
//  Copyright (c) 2014年 M.H Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  NSString 通用Category
 */
@interface NSString (MHCommon)

/**
 *  过滤html特殊字符
 *
 *  @return 过滤后的string
 */
- (NSString *)ignoreHTMLSpecialString;

/**
 *  过滤.net接口返回值的xml外包装，例如：
 *  <?xml version="1.0" encoding="utf-8"?>
 *  <string xmlns="http://tempuri.org/">{"result":"1","data":[{"User_Id":"32","User_Name":"nanq@bluemobi.cn"}]}</string>
 *  服务器返回的数据格式是xml中包JSON，所以要过滤掉外层的xml，直接返回json字符串
 *
 *  @return 过滤后的string
 */
- (NSString *)ignoreDotNetSpecialString;

@end
