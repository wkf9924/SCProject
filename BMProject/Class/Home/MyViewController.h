//
//  MyViewController.h
//  BMProject
//
//  Created by xa on 15/11/5.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommoditymanagementViewController.h"
#import "MyconveniencestoreViewController.h"
#import "OrdermanagementViewController.h"
#import "MessageViewController.h"
#import "SetupViewController.h"
@interface MyViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIButton *commoditymanagementBut;
@property (weak, nonatomic) IBOutlet UIButton *ordermanagementBut;
@property (weak, nonatomic) IBOutlet UIButton *IncomeBut;
@property (weak, nonatomic) IBOutlet UIButton *newsBut;
@property (weak, nonatomic) IBOutlet UIButton *setupBut;
- (IBAction)myconvenstorJumpBut:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;
@property (weak, nonatomic) IBOutlet UIImageView *myImageVIew;
@property (weak, nonatomic) IBOutlet UILabel *myNanme;
@property (weak, nonatomic) IBOutlet UILabel *myIncome;
@property (weak, nonatomic) IBOutlet UIView *myView;



@end
