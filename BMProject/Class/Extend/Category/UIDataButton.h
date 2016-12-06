//
//  UIDataButton.h
//  MYWowGoing
//
//  Created by mac on 12-8-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ImageViewDelegete <NSObject>

- (void)setImage:(UIImage *)image;

@end

@interface UIDataButton : UIButton

@property (strong, nonatomic) NSMutableDictionary  *data;
@property (strong, nonatomic) NSString *carbiddingIdString;
@property (strong, nonatomic) NSString *throwString;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property  int num;

@end
