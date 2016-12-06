//
//  BM_NetAPIManager.m
//  LPBM
//
//  Created by 赵文龙 on 15/3/3.
//  Copyright (c) 2015年 BM. All rights reserved.
//

#import "BM_NetAPIManager.h"
#import "BM_NetAPIClicnet.h"

@implementation BM_NetAPIManager

+ (instancetype)sharedManager {
    static BM_NetAPIManager *shared_manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shared_manager = [[self alloc] init];
    });
    return shared_manager;
}

/**
 *  通用方法
 *
 *  @param params 传入所需要的参数
 */
-(void)request_WithParamsPost:(id)params UrlStr:(NSString*)url andBlock:(void (^)(id responseData, NSError *error))block
{
    [[BM_NetAPIClicnet sharedJsonClient] requestJsonDataWithPath:url withParams:params withMethodType:Post andBlock:^(id responseData, NSError *error)
     {
         if(responseData)
         {
             block(responseData,nil);
         }
         else
         {
             block(nil,error);
         }
     }];
}

/**
 *  获取菜品分类列表
 *
 *  @param params 传入所需要的参数 app=menus store_id=1 func = getCategory
 */
-(void)request_getCategory_WithParams:(id)params andBlock:(void (^)(id responseData, NSError *error))block
{
    [[BM_NetAPIClicnet sharedJsonClient] requestJsonDataWithPath:@"" withParams:params withMethodType:Post andBlock:^(id responseData, NSError *error)
     {
         if(responseData)
         {
             block(responseData,nil);
         }
         else
         {
             block(nil,error);
         }
     }];
}

/**
 *  获取菜品列表
 *
 *  @param params 传入所需要的参数 &category_id=1 &store_id=1 &p=0 &psize=10 &order=1 &app=menus &func=getMenusList
 */
-(void)request_getMenusList_WithParams:(id)params andBlock:(void (^)(id responseData, NSError *error))block
{
    [[BM_NetAPIClicnet sharedJsonClient] requestJsonDataWithPath:@"" withParams:params withMethodType:Post andBlock:^(id responseData, NSError *error)
     {
         if(responseData)
         {
             block(responseData,nil);
         }
         else
         {
             block(nil,error);
         }
     }];
}

/**
 *  获取商品分类列表
 *
 *  @param params 传入所需要的参数 &app=goods &func=getAllCategory
 */
-(void)request_getAllCategory_WithParams:(id)params andBlock:(void (^)(id responseData, NSError *error))block
{
    [[BM_NetAPIClicnet sharedJsonClient] requestJsonDataWithPath:@"" withParams:params withMethodType:Post andBlock:^(id responseData, NSError *error)
     {
         if(responseData)
         {
             block(responseData,nil);
         }
         else
         {
             block(nil,error);
         }
     }];
}

/**
 *  获取商品列表
 *
 *  @param params 传入所需要的参数 &app=goods &func=getGoodsList &category_id=14 &p=0 &psize=10 &order=1
 */
-(void)request_getGoodsList_WithParams:(id)params andBlock:(void (^)(id responseData, NSError *error))block
{
    [[BM_NetAPIClicnet sharedJsonClient] requestJsonDataWithPath:@"" withParams:params withMethodType:Post andBlock:^(id responseData, NSError *error)
     {
         if(responseData)
         {
             block(responseData,nil);
         }
         else
         {
             block(nil,error);
         }
     }];
}
/**
 *  获取商品详情
 *
 *  @param params 传入所需要的参数 &app=goods &func=getGoodsInfo &content_id=49
 */
-(void)request_getGoodsInfo_WithParams:(id)params andBlock:(void (^)(id responseData, NSError *error))block
{
    
    [[BM_NetAPIClicnet sharedJsonClient] requestJsonDataWithPath:@"" withParams:params withMethodType:Post andBlock:^(id responseData, NSError *error)
     {
         if(responseData)
         {
             block(responseData,nil);
         }
         else
         {
             block(nil,error);
         }
     }];

}

/**
 *  获取商户列表【shop_type:0(商城)，1（外卖）】
 *
 *  @param params 传入所需要的参数 &app=store &func=getStoreList &district_id=? &shop_type=? &p=? &psize=?
 */
-(void)request_getStoreList_WithParams:(id)params andBlock:(void (^)(id responseData, NSError *error))block
{
    [[BM_NetAPIClicnet sharedJsonClient] requestJsonDataWithPath:@"" withParams:params withMethodType:Post andBlock:^(id responseData, NSError *error)
     {
         if(responseData)
         {
             block(responseData,nil);
         }
         else
         {
             block(nil,error);
         }
     }];
}

/**
 *  获取菜品详情
 *
 *  @param params 传入所需要的参数 &app=menus &func=getMenusDetail &content_id=1 &userid=0
 */
-(void)request_getMenusDetail_WithParams:(id)params andBlock:(void (^)(id responseData, NSError *error))block
{
    [[BM_NetAPIClicnet sharedJsonClient] requestJsonDataWithPath:@"" withParams:params withMethodType:Post andBlock:^(id responseData, NSError *error)
     {
         if(responseData)
         {
             block(responseData,nil);
         }
         else
         {
             block(nil,error);
         }
     }];
}

/**
 *  获取外卖店铺评价列表
 *
 *  @param params 传入所需要的参数 app=menuscomment &func=getCommentList &store_id=1 &p=0 &psize=10
 */
-(void)request_getCommentList_WithParams:(id)params andBlock:(void (^)(id responseData, NSError *error))block
{
    [[BM_NetAPIClicnet sharedJsonClient] requestJsonDataWithPath:@"" withParams:params withMethodType:Post andBlock:^(id responseData, NSError *error)
     {
         if(responseData)
         {
             block(responseData,nil);
         }
         else
         {
             block(nil,error);
         }
     }];
}

/**
 *  获取商场和城市列表
 *
 *  @param params 传入所需要的参数 &app=district &func=getCityAndDistrict
 */
-(void)request_getCityAndDistrict_WithParams:(id)params andBlock:(void (^)(id responseData, NSError *error))block
{
    [[BM_NetAPIClicnet sharedJsonClient] requestJsonDataWithPath:@"" withParams:params withMethodType:Post andBlock:^(id responseData, NSError *error)
     {
         if(responseData)
         {
             block(responseData,nil);
         }
         else
         {
             block(nil,error);
         }
     }];
}

/**
 *  获取商铺详情
 *
 *  @param params 传入所需要的参数 &app=store &func=getStoreinfo &store_id=?
 */
-(void)request_getStoreinfo_WithParams:(id)params andBlock:(void (^)(id responseData, NSError *error))block
{
    [[BM_NetAPIClicnet sharedJsonClient] requestJsonDataWithPath:@"" withParams:params withMethodType:Post andBlock:^(id responseData, NSError *error)
     {
         if(responseData)
         {
             block(responseData,nil);
         }
         else
         {
             block(nil,error);
         }
     }];
}

@end