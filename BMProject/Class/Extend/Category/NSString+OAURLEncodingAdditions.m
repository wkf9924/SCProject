//
//  NSString+OAURLEncodingAdditions.m
//  CheBaoLianMeng
//
//  Created by hff on 13-10-18.
//  Copyright (c) 2013年 YangJingchao® All Right. All rights reserved.
//

#import "NSString+OAURLEncodingAdditions.h"

@implementation NSString (OAURLEncodingAdditions)
- (NSString *)URLEncodedString{
    //":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)self,                                                                           NULL,
                                                                           CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                           kCFStringEncodingUTF8));
//    [result autorelease];
    return result;
}

- (NSString*)URLDecodedString{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                           (CFStringRef)self,
                                                                                           CFSTR(""),
                                                                                           kCFStringEncodingUTF8));
//    [result autorelease];
    return result;
}
- (NSString *)get_YYYYMMDD_String{
    
    NSDate *sting = [NSDate dateWithTimeIntervalSince1970:[self intValue]];
    NSDateFormatter *dateformat=[[NSDateFormatter alloc] init];
    [dateformat setDateFormat:@"yyyy-MM-dd"];
    return [dateformat stringFromDate:sting];
    
}
- (NSString *)get_MMDDHHMM_String{
    NSDate *sting = [NSDate dateWithTimeIntervalSince1970:[self intValue]];
    NSDateFormatter *dateformat=[[NSDateFormatter alloc] init];
    [dateformat setDateFormat:@"MM-dd HH:mm"];
    return [dateformat stringFromDate:sting];
}

- (NSString *)get_YYYYMMDD_HHmm_String{
    
    NSDate *sting = [NSDate dateWithTimeIntervalSince1970:[self intValue]];
    NSDateFormatter *dateformat=[[NSDateFormatter alloc] init];
    [dateformat setDateFormat:@"yyyy-MM-dd HH:mm"];
    return [dateformat stringFromDate:sting];
    
}
- (NSString *)get_HHmm_String{
    
    
    if ([self rangeOfString:@":"].length) {
        return self;
    }
    
    NSDate *sting = [NSDate dateWithTimeIntervalSince1970:[self intValue]];
    NSDateFormatter *dateformat=[[NSDateFormatter alloc] init];
    [dateformat setDateFormat:@"HH:mm"];
    return [dateformat stringFromDate:sting];
    
}

- (NSString *)get_YYMMDD_String{
    
    if ([self rangeOfString:@":"].length) {
        return self;
    }
    
    NSDate *sting = [NSDate dateWithTimeIntervalSince1970:[self intValue]];
    NSDateFormatter *dateformat=[[NSDateFormatter alloc] init];
    [dateformat setDateFormat:@"yy-MM-dd"];
    return [dateformat stringFromDate:sting];

}
- (NSString *)get_MM_String{
    
    NSDate *sting = [NSDate dateWithTimeIntervalSince1970:[self intValue]];
    NSDateFormatter *dateformat=[[NSDateFormatter alloc] init];
    [dateformat setDateFormat:@"MM"];
    return [NSString stringWithFormat:@"%@月",[dateformat stringFromDate:sting]];
    
}
- (NSString *)get_DD_String{
    
    NSDate *sting = [NSDate dateWithTimeIntervalSince1970:[self intValue]];
    NSDateFormatter *dateformat=[[NSDateFormatter alloc] init];
    [dateformat setDateFormat:@"dd"];
    return [dateformat stringFromDate:sting];;
    
}
@end
