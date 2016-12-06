//
//  NSObject+Common.h
//  LPBM
//
//  Created by 刘世财 on 15/3/3.
//  Copyright (c) 2015年 BM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Common)

#pragma mark Tip M
- (NSString *)tipFromError:(NSError *)error;
- (void)showError:(NSError *)error;
- (void)showHudTipStr:(NSString *)tipStr;
- (void)showStatusBarQueryStr:(NSString *)tipStr;
- (void)showStatusBarSuccessStr:(NSString *)tipStr;
- (void)showStatusBarError:(NSError *)error;
- (void)showStatusBarProgress:(CGFloat)progress;
- (void)hideStatusBarProgress;


//服务器返回错误信息
-(id)handleResponse:(id)responseJSON;

@end
