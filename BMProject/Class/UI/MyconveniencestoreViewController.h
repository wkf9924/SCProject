//
//  MyconveniencestoreViewController.h
//  BMProject
//
//  Created by xa on 15/11/6.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountnumberViewController.h"
#import "ConSroreNameViewController.h"
#import "AddressViewController.h"
#import "TelephoneViewController.h"
@interface MyconveniencestoreViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate, UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UIButton *myimageBut;
@property (weak, nonatomic) IBOutlet UITableView *mymessageTableView;
@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UILabel *lable;

@end
