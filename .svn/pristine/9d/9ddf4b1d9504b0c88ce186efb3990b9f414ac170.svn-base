//
//  NSString+MHCommon.m
//  PerfectProject
//
//  Created by Meng huan on 14/11/19.
//  Copyright (c) 2014年 M.H Co.,Ltd. All rights reserved.
//

#import "NSString+MHCommon.h"
#import "GDataXMLNode.h"

@implementation NSString (MHCommon)

- (NSString *)ignoreHTMLSpecialString
{
    NSString *returnStr = [self stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&lt;" withString:@""];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
    
    // 如果还有别的特殊字符，请添加在这里
    // ...
    /*
     returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&ge;" withString:@"—"];
     returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&mdash;" withString:@"®"];
     returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&ldquo;" withString:@"“"];
     returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&rdquo;" withString:@"”"];
     returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
     */
    
    return returnStr;
}

- (NSString *)ignoreDotNetSpecialString
{
    NSError *error;
    GDataXMLDocument *xmlDoc    = [[GDataXMLDocument alloc] initWithXMLString:self options:0 error:&error];
    NSString *jsonStr           = [[xmlDoc rootElement] stringValue];
    
    jsonStr = [[[[jsonStr stringByReplacingOccurrencesOfString:@"\\" withString:@"" ] stringByReplacingOccurrencesOfString:@"\n" withString:@""] stringByReplacingOccurrencesOfString:@"<br>" withString:@""] stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    
    return jsonStr;
}

@end
