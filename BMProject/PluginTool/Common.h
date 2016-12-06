//
//  Common.h
//  GoldArrow
//
//  Created by Long on 12-6-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"


#define COM [Common sharedInstance]

#pragma mark - Common公共类
/**
 * Common公共类
 *
 * 该类放置与本次项目相关的公用变量、属性或方法。
 * 注意：如果是通用代码（与项目或业务逻辑无关的代码），请放置到RLLibrary中。
 */

@interface Common : NSObject<MBProgressHUDDelegate>


@property (nonatomic, strong) NSString *carSouceString; //判断是不是从车源管理过来的
@property (nonatomic, strong) NSString *cancelString;
@property (nonatomic, strong) NSDictionary *goodDic;
@property BOOL clickYesOrNo;


/// Common类的单例实例
+ (Common *)sharedInstance;

///判断字符串是否为空字符
- (BOOL) isBlankString:(NSString *)string;

/**
 * 检测邮箱是否正确
 *@param  email 邮箱地址
 *@return 是否为邮箱
 */
- (BOOL)checkIsEmail:(NSString *)email;

/**
 * 检测是否只包含数字
 *@param  digital 检测字符串
 *@return 是否只包含数字
 */
- (BOOL)checkIsdigital:(NSString *)digital;
/**
 * 检测密码格式
 *@param  str 检测字符串
 *@return 是否正确
 */
- (BOOL)checkPassword:(NSString *)str;



/**
 * 检测用户名密码格式
 *@param  str 检测字符串
 *@return 是否正确
 */
- (BOOL)checkUserName:(NSString *)str;

/**
 * 检测是否包含空格
 *@param  email 检测字符串
 *@return 是否包含
 */
- (BOOL)checkContainSpce:(NSString *)str;

//邮箱
+ (BOOL) validateEmail:(NSString *)email;
//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile;
//车牌号验证
+ (BOOL) validateCarNo:(NSString *)carNo;
//车型
+ (BOOL) validateCarType:(NSString *)CarType;
//用户名
+ (BOOL) validateUserName:(NSString *)name;
//密码
+ (BOOL) validatePassword:(NSString *)passWord;
//昵称
+ (BOOL) validateNickname:(NSString *)nickname;
//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard;
//银行卡
+ (BOOL) validateBankCardNumber: (NSString *)bankCardNumber;
//银行卡后四位
+ (BOOL) validateBankCardLastNumber: (NSString *)bankCardNumber;
//CVN
+ (BOOL) validateCVNCode: (NSString *)cvnCode;
//month
+ (BOOL) validateMonth: (NSString *)month;
//month
+ (BOOL) validateYear: (NSString *)year;
//verifyCode
+ (BOOL) validateVerifyCode: (NSString *)verifyCode;



/**
 *  保存登陆数据
 *
 *  @param diction
 */
- (void)saveLoginSuccessData:(NSDictionary *)diction;
/**
 *  获取登陆数据
 *
 *  @param diction
 *
 *  @return
 */
- (NSDictionary *)byLoginSuccessData:(NSDictionary *)diction;
/**
 *  保存reuserId
 *
 *  @param reuserIdString
 */
- (void)savereuserId:(NSString *)reuserIdString;

/**
 *  获取reuserId
 *
 *  @return
 */
- (NSString *)byreuserId;


/**
 *  保存userImageURL
 *
 *  @param userIdString
 */
- (void)saveuserImageURL:(NSString *)userImageURL;
/**
 *  获取userImageURL
 *
 *  @return
 */
- (NSString *)byuserImageURL;

/**
 *  保存userid
 *
 *  @param userIdString
 */
- (void)saveUserId:(NSString *)userIdString;
/**
 *  获取userid
 *
 *  @return
 */
- (NSString *)byUserId;


/**
 *  保存用户名
 *
 *  @param userIdString
 */
- (void)saveUserName:(NSString *)userNameString;

/**
 *  获取用户名
 *
 *  @return
 */
- (NSString *)byUserName;



/**
 *  保存登陆状态
 *
 *  @return
 */
- (void)saveLogin:(BOOL)yesIsNo;

/**
 *  保存用户名密码
 *
 *  @param userIdString
 */
- (void)saveUserPWD:(NSString *)USERPWD;
/**
 *  获取用户名密码
 *
 *  @return
 */
- (NSString *)byUserPWD;

/**
 *  保存fileNoticeId
 *
 *  @param userIdString
 */

- (void)savefileNoticeId:(NSString *)fileNoticeIdString;
/**
 *  获取fileNoticeId
 *
 *  @return
 */
- (NSString *)byfileNoticeId;

/**
 *  保存storeid
 *
 */

- (void)saveStoreId:(NSString *)stirngStoreid;

/**
 *  获取storeid
 *
 *  @return
 */

- (NSString *)byStoreId;

//记住密码
+ (void)savePassword:(NSString *)userName pwd:(NSString *)password;
//取消记住密码
+ (void)deletePwd;



//判断是否点击了记住密码状态
+ (BOOL)isSaveUserPwd;




/**
 *  保存便利店名字
 *
 *  @return
 */
- (void)saveStoreName:(NSString *)storeName;


/**
 *  获取便利店名字
 *
 *  @return
 */
- (NSString *)byStoreName;

/**
 *  保存审核状态
 */

- (void)saveState:(NSString *)state;

/**
 *  获取审核状态
 */
- (NSString *)byState;


/**
 *  保存经纬度
 */
- (void)saveLatitudeOrLongitude:(NSDictionary *)latitudeDIc;

/**
 * 获取经纬度
 */

- (NSDictionary *)byLatitudeOrLongitude;



@end