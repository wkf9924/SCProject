//
//  MessgeCoverView.h
//  模仿新闻UI
//
//  Created by 林海 on 15/10/17.
//  Copyright © 2015年 林海. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MessgeCoverViewDelegate <NSObject>

- (void) myAction:(NSMutableArray *)array;

@end

@interface MessgeCoverView : UIView

@property (assign, nonatomic) id<MessgeCoverViewDelegate> delegate;

-(void)show;
-(void)hidden;
-(void)LoadGoods:(UIButton *)sender;
@end
