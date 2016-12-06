//
//  AppDelegate.h
//  BMProject
//
//  Created by MengHuan on 15/4/19.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainNavViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainNavViewController *mainNavViewController;

+ (AppDelegate *)appDelegate;

@end

