//
//  MessageViewController.h
//  BMProject
//
//  Created by xa on 15/11/10.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessagesTableViewCell.h"
#import "SVSegmentedControl.h"
@interface MessageViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong)SVSegmentedControl *svssegmentCtrl;
@property (weak, nonatomic) IBOutlet UITableView *messagesTableView;
@property (nonatomic,strong)NSMutableArray *notreadmessagesArray;
@property (nonatomic,strong)NSMutableArray *readmessagesArray;
@end
