//
//  TabBarView.m
//  PerfectProject
//
//  Created by Meng huan on 14/12/12.
//  Copyright (c) 2014年 M.H Co.,Ltd. All rights reserved.
//

#import "TabBarView.h"

// App下导航栏页数
#define DEF_TAB_ITEM_COUNT 2

@implementation TabBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor    = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_bg"]];
        self.backgroundColor    = [UIColor whiteColor];
//        self.layer.borderWidth  = 1;
//        self.layer.borderColor  = [[UIColor grayColor] colorWithAlphaComponent:0.3].CGColor;
        
        // tabBar上每个item的宽度
        float itemWidth = DEF_SCREEN_WIDTH/DEF_TAB_ITEM_COUNT;
        
        //
        NSArray *btnNameArray = [NSArray arrayWithObjects:@"Home", @"Albums", @"相机", @"音乐", @"我的", nil];
        
        // 创建每个item
        for (int i=0; i<DEF_TAB_ITEM_COUNT; i++)
        {
            UIButton *itemButton                    = [[UIButton alloc] initWithFrame:CGRectMake(itemWidth*i, 0, itemWidth, DEF_HEIGHT(self))];
            itemButton.tag                          = i;
            itemButton.adjustsImageWhenHighlighted  = NO;
            
//            [itemButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tab_item%d", i]] forState:UIControlStateNormal];
//            [itemButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tab_item%d_select", i]] forState:UIControlStateSelected];
            [itemButton setTitle:[btnNameArray objectAtIndex:i] forState:UIControlStateNormal];
            [itemButton setTitleColor:[[UIColor grayColor] colorWithAlphaComponent:0.5] forState:UIControlStateNormal];
            [itemButton setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
            
            [itemButton addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:itemButton];
            
            if (i == 0) {
                itemButton.selected = YES;
            }
        }
    }
    return self;
}

- (void)itemClick:(UIButton *)item
{
    for (UIButton *button in self.subviews)
    {
        button.selected = NO;
    }
    item.selected = YES;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarView:didSelectAtIndex:)]) {
        [self.delegate tabBarView:self didSelectAtIndex:item.tag];
    }
}

@end
