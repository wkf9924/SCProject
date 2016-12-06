//
//  NSObject+Common.m
//  LPBM
//
//  Created by 刘世财 on 15/3/3.
//  Copyright (c) 2015年 BM. All rights reserved.
//

#import "NSObject+Common.h"
#import "JDStatusBarNotification.h"
#import "MBProgressHUD.h"
#define DEF_NETPATH_BASEURL @"http://testplatform.jkl.com.cn"
@implementation NSObject (Common)

#pragma mark Tip M
- (NSString *)tipFromError:(NSError *)error{
    if (error && error.userInfo) {
        NSMutableString *tipStr = [[NSMutableString alloc] init];
        if ([error.userInfo objectForKey:@"msg"]) {
            NSArray *msgArray = [[error.userInfo objectForKey:@"msg"] allValues];
            NSUInteger num = [msgArray count];
            for (int i = 0; i < num; i++) {
                NSString *msgStr = [msgArray objectAtIndex:i];
                if (i+1 < num) {
                    [tipStr appendString:[NSString stringWithFormat:@"%@\n", msgStr]];
                }else{
                    [tipStr appendString:msgStr];
                }
            }
        }else{
            if ([error.userInfo objectForKey:@"NSLocalizedDescription"]) {
                tipStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
            }else{
                [tipStr appendFormat:@"ErrorCode%ld", (long)error.code];
            }
        }
        return tipStr;
    }
    return nil;
}

#pragma mark 显示错误消息
- (void)showError:(NSError *)error{
    if ([JDStatusBarNotification isVisible]) {//如果statusBar上面正在显示信息，则不再用hud显示error
        NSLog(@"如果statusBar上面正在显示信息，则不再用hud显示error");
        return;
    }
    NSString *tipStr = [self tipFromError:error];
    
    [self showHudTipStr:tipStr];
}

- (void)showHudTipStr:(NSString *)tipStr{
    if (tipStr && tipStr.length > 0) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = tipStr;
        hud.margin = 10.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:1.0];
    }
}

//数据请求中的状态
- (void)showStatusBarQueryStr:(NSString *)tipStr{
    [JDStatusBarNotification showWithStatus:tipStr styleName:JDStatusBarStyleSuccess];
    [JDStatusBarNotification showActivityIndicator:YES indicatorStyle:UIActivityIndicatorViewStyleWhite];
}
//请求成功状态
- (void)showStatusBarSuccessStr:(NSString *)tipStr{
    if ([JDStatusBarNotification isVisible]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [JDStatusBarNotification showActivityIndicator:NO indicatorStyle:UIActivityIndicatorViewStyleWhite];
            [JDStatusBarNotification showWithStatus:tipStr dismissAfter:1.5 styleName:JDStatusBarStyleSuccess];
        });
    }else{
        [JDStatusBarNotification showActivityIndicator:NO indicatorStyle:UIActivityIndicatorViewStyleWhite];
        [JDStatusBarNotification showWithStatus:tipStr dismissAfter:1.0 styleName:JDStatusBarStyleSuccess];
    }
}
//请求失败状态
- (void)showStatusBarError:(NSError *)error{
    if ([JDStatusBarNotification isVisible]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [JDStatusBarNotification showActivityIndicator:NO indicatorStyle:UIActivityIndicatorViewStyleWhite];
            [JDStatusBarNotification showWithStatus:[self tipFromError:error] dismissAfter:1.5 styleName:JDStatusBarStyleError];
        });
    }else{
        [JDStatusBarNotification showActivityIndicator:NO indicatorStyle:UIActivityIndicatorViewStyleWhite];
        [JDStatusBarNotification showWithStatus:[self tipFromError:error] dismissAfter:1.5 styleName:JDStatusBarStyleError];
    }
}

//进度条
- (void)showStatusBarProgress:(CGFloat)progress{
    [JDStatusBarNotification showProgress:progress];
    
}
//影藏
- (void)hideStatusBarProgress{
    [JDStatusBarNotification showProgress:0.0];
}

#pragma mark NetError
/**
 *  解析用户错误信息
 *
 *  @param responseJSON 用户传值过来的json
 *
 *  @return 错误信息
 */
-(id)handleResponse:(id)responseJSON{
    
    NSError *error = nil;
    //repCode不为M0000值时，表示有错
    NSString *resultCode = [NSString stringWithFormat:@"%@",[responseJSON valueForKeyPath:@"repCode"]];
    NSLog(@"responseJSON == %@",responseJSON);
    if(resultCode)
    {
        if(![resultCode isEqualToString:@""]||[resultCode isEqualToString:@"000000"])
        {
            [self showHudTipStr:[responseJSON valueForKeyPath:@"repMsg"]];
        }
    }
    else
    {
        error = [NSError errorWithDomain:DEF_NETPATH_BASEURL code:resultCode.intValue userInfo:responseJSON];
        [self showError:error];
    }
    
    return error;
}

@end
