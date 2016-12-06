//
//  CommoditymanagementTableViewCell.h
//  BMProject
//
//  Created by xa on 15/11/5.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommoditymanagementTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *goodsImage;
@property (weak, nonatomic) IBOutlet UILabel *goodsName;
@property (weak, nonatomic) IBOutlet UILabel *goodsPice;
@property (weak, nonatomic) IBOutlet UILabel *classificationlable;
@property (weak, nonatomic) IBOutlet UILabel *descriptionlable;

@end
