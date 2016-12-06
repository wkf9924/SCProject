//
//  BMNetWorkURLs.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-12.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#ifndef BlueMobiProject_BMNetWorkURLs_h
#define BlueMobiProject_BMNetWorkURLs_h

//Code=-1001 "The request timed out."
//Code=-1009 "The Internet connection appears to be offline."
//Code=-1004 "Could not connect to the server."

/**
 *  超时错误序号 －1001
 */
#define API_COULD_NOT_CONNECT_ERROR -1001

/**
 *  API的HOST
 */
//#define API_HOST @"http://www.sendm.cn/index.php?app=api&"

#define API_HOST @"http://121.40.19.141/index.php?app=api&"

/**
 *  Socket的HOST
 */
#define SOCKET_HOST @"58.83.147.106"

/**
 *  Socket的PORT
 */
#define SOCKET_PORT 10000

/// Class
#define PublicitfcClass @"Publicitfc"
#define UseritfcClass @"Useritfc"
#define WeiboitfcClass @"Weiboitfc"


/// 请在此定义请求URL

// 01. 注册接口1
#define REGISTER1                  [NSString stringWithFormat:@"%@mod=Publicitfc&act=doregister", API_HOST]
//#define REGISTER1                  @"http://192.168.1.152/vmdai/web/app.php/iphone/recommend"

// 02. 上传头像
#define UPLOAD_FACE                [NSString stringWithFormat:@"%@mod=Publicitfc&act=upload_face", API_HOST]

// 03. 注册接口2
#define DOSTEP1                    [NSString stringWithFormat:@"%@mod=Publicitfc&act=doStep1", API_HOST]

// 04. 登录接口
#define LOGIN                      [NSString stringWithFormat:@"%@mod=Publicitfc&act=doLogin", API_HOST]

// 05. 发布新鲜事
#define NEW_THING                  [NSString stringWithFormat:@"%@mod=Weiboitfc&act=addFeed", API_HOST]

// 06. 获取所有新鲜事列表
#define ALL_THING                  [NSString stringWithFormat:@"%@mod=Weiboitfc&act=public_timeline", API_HOST]

// 07. 赞某条新鲜事
#define GOOD_THING                 [NSString stringWithFormat:@"%@mod=Weiboitfc&act=editdigg", API_HOST]

// 08. 某条新鲜事点赞用户列表
#define GOOD_THING_LIST            [NSString stringWithFormat:@"%@mod=Weiboitfc&act=getdigglist", API_HOST]

// 09. 某条新鲜事评论列表
#define REPLY_THING_LIST           [NSString stringWithFormat:@"%@mod=Weiboitfc&act=comments", API_HOST]

// 10. 新鲜事评论接口
#define REPLY_THING                [NSString stringWithFormat:@"%@mod=Weiboitfc&act=comment", API_HOST]

// 11. 注销接口
#define LOGOUT                     [NSString stringWithFormat:@"%@mod=Publicitfc&act=loginOut", API_HOST]

// 12. 获取用户信息
#define USER_INFO                  [NSString stringWithFormat:@"%@mod=Useritfc&act=getUserInfo", API_HOST]

// 13. 获取用户的新鲜事列表
#define USER_THING                 [NSString stringWithFormat:@"%@mod=Weiboitfc&act=user_timeline", API_HOST]

// 14. 关注/取消关注某用户
#define EDIT_FOLLOW                [NSString stringWithFormat:@"%@mod=Useritfc&act=edit_follow", API_HOST]

// 15. 用户关注的人列表
#define USER_FOLLOWING             [NSString stringWithFormat:@"%@mod=Useritfc&act=user_following", API_HOST]

// 16. 用户粉丝列表
#define USER_FOLLOWER              [NSString stringWithFormat:@"%@mod=Useritfc&act=user_followers", API_HOST]

// 17. 用户好友列表
#define USER_FREIEND               [NSString stringWithFormat:@"%@mod=Useritfc&act=user_friends", API_HOST]

// 18. 获取附近用户
#define NEIGHBORS                  [NSString stringWithFormat:@"%@mod=Useritfc&act=neighbors", API_HOST]

// 19. 获取所有新鲜事列表
#define FRIEND_THING               [NSString stringWithFormat:@"%@mod=Weiboitfc&act=friends_timeline", API_HOST]

// 20. 举报新鲜事列表
#define AUTO_DENOUNCE              [NSString stringWithFormat:@"%@mod=Weiboitfc&act=autoDenounce", API_HOST]

// 21. 举报新鲜事列表
#define UPLOAD_ALBUM               [NSString stringWithFormat:@"%@mod=Useritfc&act=upload_photo", API_HOST]

// 22. 浏览记录
#define SCRAN_HISTORY              [NSString stringWithFormat:@"%@mod=Useritfc&act=getLookme", API_HOST]

// 23. 拉黑/放黑
#define DO_BLACK                   [NSString stringWithFormat:@"%@mod=Useritfc&act=doBlack", API_HOST]

// 24. 获取用户黑名单列表
#define BLACK_LIST                 [NSString stringWithFormat:@"%@mod=Useritfc&act=getUserBlackList", API_HOST]

// 25. 举报某人
#define ADD_DENOUNCE               [NSString stringWithFormat:@"%@mod=Useritfc&act=addDenounce", API_HOST]

// 26. 我的图片
#define MY_PICTURE                 [NSString stringWithFormat:@"%@mod=Useritfc&act=getPhotos", API_HOST]

// 27 上传图片
#define UOPLOAD_PICTURE               [NSString stringWithFormat:@"%@mod=Useritfc&act=upload_photo", API_HOST]


// 28 隐私图片
#define LOCK_PICTURE               [NSString stringWithFormat:@"%@mod=Useritfc&act=lock_photo", API_HOST]


// 29 删除图片
#define DELETE_PICTURE               [NSString stringWithFormat:@"%@mod=Useritfc&act=del_photo", API_HOST]

// 30 获得广告
#define GET_AD                   [NSString stringWithFormat:@"%@mod=Publicitfc&act=getBannerList", API_HOST]


// 31 上传背景
#define UPLOAD_BACKGROUND                 [NSString stringWithFormat:@"%@mod=Useritfc&act=upload_coverImage", API_HOST]

// 32 意见反馈
#define YIJIAN_FEED                   [NSString stringWithFormat:@"%@mod=Publicitfc&act=addFeedback", API_HOST]


// 32 版本更新
#define GET_VERSION                 [NSString stringWithFormat:@"%@mod=Publicitfc&act=getVersion", API_HOST]

// 32 版本更新
#define CHANGE_PASSWORD                 [NSString stringWithFormat:@"%@mod=Useritfc&act=doSavePassword", API_HOST]

// 32 版本更新
#define CHANGE_ZILIAO                 [NSString stringWithFormat:@"%@mod=Useritfc&act=updateUser", API_HOST]

#endif

