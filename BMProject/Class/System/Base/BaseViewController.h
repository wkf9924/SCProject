//
//  BaseViewController.h
//  PerfectProject
//
//  Created by Meng huan on 14/11/19.
//  Copyright (c) 2014年 M.H Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdView.h"
@interface BaseViewController : UIViewController
@property (nonatomic, retain) UIView *navBar;
@property (nonatomic, retain) UIButton *leftBtn;
@property (nonatomic, retain) UIButton *rightBtn;
@property(retain, nonatomic) NSArray * imagesURL;
@property(retain, nonatomic) NSArray * imageTitles;
@property(retain, nonatomic)  AdView * adView;


//指示器
- (void)activityIndicatorStartShowInView:(UIView *)showView loadText:(NSString *)loadText loadType:(int)type ;
- (void)activityIndicatorFinish;
//HUD
//隐藏
- (void)hiddenHud;
//加载等待无文字
- (void)showNoTextHud:(float)time;
//加载等待有文字
- (void)showTextHud:(NSString *)presentation waitTime:(float)time;
//加载进度条
- (void)showProgressHud:(NSString *)presentation;
//更新进度条
-(void)updateProgressHud:(float)lenth;
//成功
- (void)showSuccessHud:(NSString *)presentation;
//失败
- (void)showErrorHud:(id)presentation;
//验证电话号码
- (BOOL)isMobileNumber:(NSString *)mobileNum;

-(BOOL)isNullWith:(id)sender ;

-(void)backHome:(id)sender;

-(CGFloat)GetLengthFronString:(NSString *)string font:(UIFont *)font height:(CGFloat)height;
-(CGFloat)GetheightfromString:(NSString *)string font:(UIFont *)font width:(CGFloat)width;
- (void)createScrollView: (UIView *)view andViewHight:(float)viewHight;


@end
