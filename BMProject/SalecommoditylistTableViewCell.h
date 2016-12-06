//
//  SalecommoditylistTableViewCell.h
//  BMProject
//
//  Created by xa on 15/11/2.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SalecommoditylistTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *salegoodsInage;
@property (weak, nonatomic) IBOutlet UILabel *salegoodsName;
@property (weak, nonatomic) IBOutlet UILabel *salegoodsPice;

- (IBAction)addto:(id)sender;

@end
