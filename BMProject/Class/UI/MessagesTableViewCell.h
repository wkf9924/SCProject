//
//  MessagesTableViewCell.h
//  BMProject
//
//  Created by xa on 15/11/10.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessagesTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *messagecontentLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UILabel *lbCount;

//给用户介绍赋值并且实现自动换行
-(void)setIntroductionText:(NSString*)text;
//初始化cell类
-(id)initWithReuseIdentifier:(NSString*)reuseIdentifier;
@end
