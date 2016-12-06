//
//  SigninViewController.h
//  BMProject
//
//  Created by xa on 15/11/25.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SigninViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *phonenumberText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

- (IBAction)siginButton:(id)sender;

@end
