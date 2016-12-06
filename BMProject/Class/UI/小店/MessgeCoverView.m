//
//  MessgeCoverView.m
//  模仿新闻UI
//
//  Created by 林海 on 15/10/17.
//  Copyright © 2015年 林海. All rights reserved.
//

#import "MessgeCoverView.h"
#import "AddCommodityViewController.h"
@interface MessgeCoverView()
@property (nonatomic,strong) NSMutableArray *btnArray;
@property (nonatomic,strong) NSMutableArray *googsListArray;
@property (nonatomic,strong) NSMutableArray *googsDetailsArray;
@property (nonatomic,weak) UIView *popoverView;
@property (nonatomic,weak) UIView *coverView;

@end


@implementation MessgeCoverView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverClick)];
        [self addGestureRecognizer:tap];
        
        UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, VIEW_HEIHT)];
        coverView.backgroundColor = [UIColor blackColor];
        coverView.alpha = 0.1;
        [self insertSubview:coverView atIndex:0];
        
        //是固定的位置，不会变化的话 就先设置好fream，改变view的tranfrom 会触发layoutsubviews 会出现问题。
        UIView *popoverView = [[UIView alloc] init];
        popoverView.backgroundColor = [UIColor whiteColor];
        popoverView.layer.cornerRadius = 4;
        popoverView.clipsToBounds = YES;
        popoverView.alpha = 0.1;
        //我特么日了🐶了 不要问我为什么这么写！！！！！
        //_popoverView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width- 75, -66, 125, 320);
        _popoverView = popoverView;
//        _popoverView
        [self addSubview:popoverView];

        _btnArray = [NSMutableArray array];
       _googsListArray = [NSMutableArray array];
        
        [self getData];
    
    }
    
    return self;
}


-(UIButton *)buttonWithTitle:(NSString *)title : (NSInteger)i
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = i;
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [btn setTitle:title forState:UIControlStateNormal];
    //[btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"app_share_popup_button_right_press"] forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(LoadGoods:) forControlEvents:UIControlEventTouchUpInside];
     [_popoverView addSubview:btn];
    [_btnArray addObject:btn];
    return btn;
}
-(void)LoadGoods:(UIButton *)sender{
    COM.clickYesOrNo = YES;
    UIButton *but = sender;
    NSString *goodsID = _googsListArray[but.tag][@"id"];
    NSString *goodsName = _googsListArray[but.tag][@"claName"];
    [self addloadGoods:goodsID :@"1" ];
    [self hidden];
    
    NSDictionary *dict = @{@"ID"        : goodsID,
                           
                           @"goodsname" :goodsName
                           
                           };
  
     COM.goodDic = dict;

}

-(void)load{
    
}
//显示出来
-(void)show
{
        self.hidden = NO;
    //这只锚点 这个点进行缩放
    _popoverView.layer.anchorPoint = CGPointMake(1,0);
    //先让要显示的view最小直至消失
    _popoverView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    [UIView animateWithDuration:0.4 animations:^{
        _popoverView.alpha = 1.0;
        _popoverView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
}

//缩回去
-(void)hidden
{
    [UIView animateWithDuration:0.4 animations:^{
        _popoverView.alpha = 0.1;
        _popoverView.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
    }completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

-(void)coverClick
{
    [self hidden];
}
#pragma mark -- 商品分类
- (void)getData {
    //封装参数
    NSDictionary *dict = @{};
    
    //装成json字符串
    NSString *stringJson = [JSONFunction jsonStringWithNSDictionary:dict];
    NSDictionary *jsonDic = @{@"mData" : stringJson};
    
    //拼接链接
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,COMLISTBYCLASSIFY_List];
    
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:jsonDic UrlStr:url andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {
            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
                _googsListArray = responseData[@"result"];
                _popoverView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width- 105, 20, 100, _googsListArray.count * 40);
                
                [self addlineBut];
                
                
            }
            else {
                
                [LCProgressHUD showError:@"失败"];
            }
        }else{
        }
    }];
}
#pragma mark -- 商品列表详情
-(void)addloadGoods : (NSString *)ID : (NSString *)pageNO{
    
   
    //封装参数
    NSDictionary *dict = @{
                           @"claId"      : ID,
                           @"pageNo"  : pageNO
                          
                           };
    
    //装成json字符串
    NSString *stringJson = [JSONFunction jsonStringWithNSDictionary:dict];
    NSDictionary *jsonDic = @{@"mData" : stringJson};
    
    //拼接链接
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,COMLISTBYCLASSIFY_GOODSList];
    
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:jsonDic UrlStr:url andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {
            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
                _googsDetailsArray = responseData[@"result"][@"list"];
                
               
                [_delegate myAction:_googsDetailsArray];
            
            }
            else {
                
                [LCProgressHUD showError:@"失败"];
                
            }
        }else{
        }
    }];
}

    
-(void)addlineBut{
    //添加分割线
    for (int i = 0; i < _googsListArray.count; i++) {
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = [UIColor blackColor];
        line.alpha = 0.1;
        line.frame = CGRectMake(0, i * 40, 125, 1);
        [_popoverView addSubview:line];

        //加载商品分类
UIButton *btn1 = [self buttonWithTitle:_googsListArray[i][@"claName"] :i];
btn1.frame = CGRectMake(0,i*40, 129, 40);
        
    }

    
    
}

@end
