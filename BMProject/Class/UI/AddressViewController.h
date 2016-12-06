//
//  AddressViewController.h
//  BMProject
//
//  Created by xa on 15/11/7.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIImageView *LocationImage;
@property (weak, nonatomic) IBOutlet UITextField *LocationTextFild;
@property (weak, nonatomic) IBOutlet UIView *LocationView;
@property (weak, nonatomic) IBOutlet UIView *addressView;
- (IBAction)updateButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *updataBut;

@end
