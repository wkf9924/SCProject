//
//  UIImage+RoundImage.m
//  SharpTrader_ios
//
//  Created by plee on 15/8/11.
//  Copyright (c) 2015年 FengYun Technology CO., LTD. All rights reserved.
//

#import "UIImage+RoundImage.h"

@implementation UIImage (RoundImage)

- (UIImage *)returnRoundImageAvater{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat compare = self.size.width - self.size.height;
    CGFloat circleW, circleX, circleY;
    if (compare > 0) {
        circleW = self.size.height;
        circleY = 0;
        circleX = (self.size.width - circleW) / 2.0;
    } else if (compare == 0) {
        circleW = self.size.width;
        circleX = circleY = 0;
    } else {
        circleW = self.size.width;
        circleX = 0;
        circleY = (self.size.height - circleW) / 2.0;
    }
    CGRect circleRect = CGRectMake(circleX, circleY, circleW, circleW);
    CGContextAddEllipseInRect(ctx, circleRect);
    CGContextClip(ctx);
    
    [self drawInRect:circleRect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;

    
}
+ (UIImage *)stretchImageComplete:(UIImage *)image
{
    
    return [image stretchableImageWithLeftCapWidth:20 topCapHeight:15];
}

@end
