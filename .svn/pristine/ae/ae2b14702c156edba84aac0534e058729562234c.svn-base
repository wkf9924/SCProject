//
//  MessagesTableViewCell.m
//  BMProject
//
//  Created by xa on 15/11/10.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import "MessagesTableViewCell.h"

@implementation MessagesTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(id)initWithReuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
    
    }
    
    
    return self;
}


//赋值 and 自动换行,计算出cell的高度
-(void)setIntroductionText:(NSString*)text{
    //获得当前cell高度
    CGRect frame = [self frame];
    //文本赋值
    self.messagecontentLable.text = text;
    
    self.messagecontentLable.textAlignment = UIControlContentVerticalAlignmentTop;
    

    //设置label的最大行数
    self.messagecontentLable.numberOfLines = 10;
    
    CGSize size = CGSizeMake(ViewWidth(self.messagecontentLable), 260);
    
    UIFont *fnt = [UIFont fontWithName:@"HelveticaNeue" size:18.0f];
    CGRect textSize = [self.messagecontentLable.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt,NSFontAttributeName, nil] context:nil];
    
    self.messagecontentLable.frame = CGRectMake(self.messagecontentLable.frame.origin.x, self.messagecontentLable.frame.origin.y, textSize.size.width, textSize.size.height);
    
    //计算出自适应的高度
    frame.size.height = textSize.size.height+40;
    
    self.frame = frame;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
