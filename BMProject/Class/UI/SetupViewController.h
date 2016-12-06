//
//  SetupViewController.h
//  BMProject
//
//  Created by xa on 15/11/10.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetupViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *setupView;
@property (weak, nonatomic) IBOutlet UIImageView *PushnotificationImage;
@property (weak, nonatomic) IBOutlet UISwitch *PushnotificationSwitch;

@property (weak, nonatomic) IBOutlet UITableView *setupTableView;
- (IBAction)exitaccountButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *exitaccountBut;

@property(nonatomic,strong)NSArray *arrayName;

@end
