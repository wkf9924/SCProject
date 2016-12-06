//
//  UIViewController+ViewControllerGeneralMethod.m
//  Golf
//
//  Created by Blankwonder on 6/4/13.
//  Copyright (c) 2013 Suixing Tech. All rights reserved.
//

#import "UIViewController+GeneralMethod.h"
#import "KDXEasyTouchButton.h"

@implementation UIViewController (GeneralMethod)

- (void)popViewController {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dismissViewController {
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)setBackBarButton
{
    UIButton *button = [KDXEasyTouchButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 13, 20, 40);
    [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)setDismissBarButton
{
    UIButton *button = [KDXEasyTouchButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 45, 20);
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button addTarget:self action:@selector(dismissViewController) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)setDoneBarButtonWithSelector:(SEL)selector andTitle:(NSString *)title{
    UIButton *button = [KDXEasyTouchButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 10, 45, 45);
    [button setImage:[UIImage imageNamed:title] forState:UIControlStateNormal];
    //[button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)setDoneBarButtonImageWithSelector:(SEL)selector imageName:(NSString *)title{
    UIButton *button = [KDXEasyTouchButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 36, 32);
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:title] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}








@end
