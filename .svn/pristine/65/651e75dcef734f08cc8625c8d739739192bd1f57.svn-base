//
//  AppDelegate.m
//  BMProject
//
//  Created by MengHuan on 15/4/19.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

#import "AppDelegate.h"
#import "Reachability.h"
#import "GuideView.h"
#import "MyViewController.h"
#import "LCNavigationController.h"
#import "DTNavigationController.h"
#import "CCLocationManager.h"
#import "AppConfigure.h"
#import "MMLocationManager.h"
#import <SMS_SDK/SMSSDK.h>
#import <SMS_SDK/SMSSDK+AddressBookMethods.h>

#define appKey @"c6033dd89b60"
#define appSecret @"6b682dbf265c7503b3229401b827f124"

@interface AppDelegate ()
{
    NSMutableArray *arrayTemp;
}

// 网络状态实时监听
@property (strong, nonatomic) Reachability *reachability;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // 实时监听网络状态
    [self startRealTimeNetworkStatus];
    
    Ian_Alert(@"ddddd");
    
    
    //初始化应用，appKey和appSecret从后台申请得到
    [SMSSDK registerApp:appKey
             withSecret:appSecret];
    
    // 构造window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    MyViewController *myView = [[MyViewController alloc] init];
    UINavigationController *nav = [[ UINavigationController  alloc] initWithRootViewController:myView];
    
    self.window.rootViewController = nav;
    
    // 显示window主窗口
    [self.window makeKeyAndVisible];
//
//    // 设置rootViewController
//    self.mainNavViewController      = [[MainNavViewController alloc]init];
//    self.window.rootViewController  = self.mainNavViewController;
    
    // 显示引导页
//    [self showGuideHUD];

    
    
    // 显示水印
//    [self blueMobiWatermark];
    
    
    [self getAllInfo];
    

    
    
    // Override point for customization after application launch.
    return YES;
}

//定位
#pragma mark -- 定位
-(void)getAllInfo
{
    if (iOS7) {
        [[MMLocationManager shareLocation] getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
            NSString *latString11 = [NSString stringWithFormat:@"IOS7纬度：%f  IOS7 经度%f",locationCorrrdinate.latitude,locationCorrrdinate.longitude];
            NSLog(@"latString11:%@", latString11);
            NSString *latString = [NSString stringWithFormat:@"%f", locationCorrrdinate.latitude ];
            NSString *longString = [NSString stringWithFormat:@"%f", locationCorrrdinate.longitude];
            NSDictionary *dic = @{@"lat" : latString,
                                                   @"long" : longString};
            [COM saveLatitudeOrLongitude:dic];
        }];
    }
    
    if(iOS8){
        [[CCLocationManager shareLocation]getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
           NSString *gpsString  = [NSString stringWithFormat:@"IOS8纬度：%f  IOS8 经度：%f",locationCorrrdinate.latitude,locationCorrrdinate.longitude];
            NSString *latString = [NSString stringWithFormat:@"%f", locationCorrrdinate.latitude ];
            NSString *longString = [NSString stringWithFormat:@"%f", locationCorrrdinate.longitude];
            NSDictionary *dic = @{@"lat" : latString,
                                                   @"long" : longString};
            [COM saveLatitudeOrLongitude:dic];
            NSLog(@"位置：%@", gpsString);
        } withAddress:^(NSString *addressString) {
            NSLog(@"addressString  %@",addressString);
//            LocationWZ = addressString;
            
        }];
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark -
+ (AppDelegate *)appDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

#pragma mark - 显示引导页
- (void)showGuideHUD
{
    // 引导页
    if (![DEF_PERSISTENT_GET_OBJECT(@"showGuide") boolValue])
    {
        DEF_PERSISTENT_SET_OBJECT([NSNumber numberWithBool:YES], @"showGuide");
        GuideView *guide = [[GuideView alloc] initWithFrame:self.window.bounds];
        [self.window addSubview:guide];
    }
}

#pragma mark - 水印
- (void)blueMobiWatermark
{
    // 添加水印
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blueMobiWatermark"]];
    iv.frame        = CGRectMake(0, DEF_HEIGHT(self.window) - 12, DEF_WIDTH(self.window), 12);
    [self.window addSubview:iv];
    [self.window bringSubviewToFront:iv];
}


#pragma mark -
#pragma mark - 实时监听网络状态

- (void)startRealTimeNetworkStatus
{
    // 开启网络状况的监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    self.reachability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    [self.reachability startNotifier];
}

- (void)reachabilityChanged:(NSNotification* )note
{
    Reachability *curReach  = [note object];
    NetworkStatus status    = [curReach currentReachabilityStatus];
    
    NSLog(@"网络状态值: %ld", (long)status);
    
    // 根据网络状态值，在这里做你想做的事
    // ...
}

//
//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
//    
//    if ([viewController isKindOfClass:[UINavigationController class]]) {
//        
//        [(UINavigationController *)viewController popToRootViewControllerAnimated:YES];
//        
//    }
//    
//}

@end
