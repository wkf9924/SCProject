//
//  Common.m
//  GoldArrow
//
//  Created by Long on 12-6-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Common.h"

#define LOGIN_DATA @"LOGINDATA"//登陆成功数据
#define USERID     @"USERID"   //用户id
#define REUSERID   @"REUSERID"  //用户REUSERID
#define USERNAME   @"USERNAME" //用户名
#define FileNoticeId  @"FileNoticeId"
#define USERPWD    @"USERPWD"//用户密码
#define USERIAMGEURL @"USERIAMGEURL" //用户头像url
#define YesIsNo @"yesorno"
#define STOREID @"STOREID"
#define STORENAME @"STORENAME" //便利店name
#define LATORLONG @"LATORLONG"  //经纬度

static Common *_sharedInstance = nil;

@implementation Common

#pragma mark - Common公共类: Class life cycle method
+ (Common *) sharedInstance
{
//    @synchronized(self)
//	{
//        if (_sharedInstance == nil)
//		{
//            _sharedInstance = [[self alloc] init];
//        }
//    }
//    return _sharedInstance;

    static Common *_sharedInstance = nil;
    
    static dispatch_once_t predicate; dispatch_once(&predicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self)
	{
        if(_sharedInstance == nil)
		{
            _sharedInstance = [super allocWithZone:zone];
			return _sharedInstance;
        }
    }
	
    return nil;
}

- (id)init
{
	if ((self=[super init]))
	{
    }
    return self;
}

- (void)dealloc {
}


#pragma mark - Common公共类: Other Custom Method


///tableview多余的线隐藏
+ (void)setExtraCellLineHidden:(UITableView *)tableView;
{
    
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
    
    
    
}

/**
 * 检测邮箱是否正确
 *
 *@param  email 邮箱地址
 *
 *
 *@return 是否为邮箱
 */
- (BOOL)checkIsEmail:(NSString *)email{
    if (!email || email.length == 0) {
        return NO;
    }
    NSString * regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:email];
    
    return isMatch;
}

/**
 * 检测是否只包含数字
 *
 *@param  digital 检测字符串
 *
 *
 *@return 是否只包含数字
 */
- (BOOL)checkIsdigital:(NSString *)digital{
    if (!digital || digital.length == 0) {
        return NO;
    }
    NSString * regex = @"^[0-9]*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:digital];
    
    return isMatch;
    
}

/**
 * 检测密码格式
 *
 *@param  str 检测字符串
 *
 *
 *@return 是否正确
 */
- (BOOL)checkPassword:(NSString *)str{
    if (!str || str.length == 0) {
        return NO;
    }
    //只能是字符，数字，下划线，长度大于8小于16
    NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$";//@"^[a-zA-Z0-9_]{8,16}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    
    return isMatch;
    
}

/**
 * 检测用户名格式
 *
 *@param  str 检测字符串
 *
 *
 *@return 是否正确
 */
- (BOOL)checkUserName:(NSString *)str{
    if (!str || str.length == 0) {
        return NO;
    }
    //只能是字符，数字，下划线，长度大于8小于16
    NSString * regex = @"^1\\d{10}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    
    return isMatch;
    
}

//***************************验证

//邮箱
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
//车牌号验证
+ (BOOL) validateCarNo:(NSString *)carNo
{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}
//车型
+ (BOOL) validateCarType:(NSString *)CarType
{
    NSString *CarTypeRegex = @"^[\u4E00-\u9FFF]+$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CarTypeRegex];
    return [carTest evaluateWithObject:CarType];
}
//用户名
+ (BOOL) validateUserName:(NSString *)name
{
    NSString *userNameRegex = @"^[A-Za-z0-9]{4,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:name];
    return B;
}
//密码
+ (BOOL) validatePassword:(NSString *)passWord
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}
//昵称
+ (BOOL) validateNickname:(NSString *)nickname
{
    NSString *nicknameRegex = @"([\u4e00-\u9fa5]{2,5})(&middot;[\u4e00-\u9fa5]{2,5})*";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}
//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}
//银行卡
+ (BOOL) validateBankCardNumber: (NSString *)bankCardNumber
{
    BOOL flag;
    if (bankCardNumber.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{15,30})";
    NSPredicate *bankCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [bankCardPredicate evaluateWithObject:bankCardNumber];
}
//银行卡后四位
+ (BOOL) validateBankCardLastNumber: (NSString *)bankCardNumber
{
    BOOL flag;
    if (bankCardNumber.length != 4) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{4})";
    NSPredicate *bankCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [bankCardPredicate evaluateWithObject:bankCardNumber];
}
//CVN
+ (BOOL) validateCVNCode: (NSString *)cvnCode
{
    BOOL flag;
    if (cvnCode.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{3})";
    NSPredicate *cvnCodePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [cvnCodePredicate evaluateWithObject:cvnCode];
}
//month
+ (BOOL) validateMonth: (NSString *)month
{
    BOOL flag;
    if (!(month.length == 2)) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"(^(0)([0-9])$)|(^(1)([0-2])$)";
    NSPredicate *monthPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [monthPredicate evaluateWithObject:month];
}
//month
+ (BOOL) validateYear: (NSString *)year
{
    BOOL flag;
    if (!(year.length == 2)) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^([1-3])([0-9])$";
    NSPredicate *yearPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [yearPredicate evaluateWithObject:year];
}
//verifyCode
+ (BOOL) validateVerifyCode: (NSString *)verifyCode
{
    BOOL flag;
    if (!(verifyCode.length == 6)) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{6})";
    NSPredicate *verifyCodePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [verifyCodePredicate evaluateWithObject:verifyCode];
}


//***********************************end

/**
 * 检测是否包含空格
 *
 *@param  str 检测字符串
 *
 *
 *@return 是否包含
 */
- (BOOL)checkContainSpce:(NSString *)str{
    if (!str ||str.length == 0) {
        return NO;
    }
    NSRange range  = [str rangeOfString:@" "];
    if (range.length > 0) {
        return YES;
    }
    return NO;
}


///判断字符串是否为空字符
- (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}
 


/**
 *  保存登陆数据
 *
 *  @param diction
 */
- (void)saveLoginSuccessData:(NSDictionary *)diction {
    
    [[NSUserDefaults standardUserDefaults] setObject:diction forKey:LOGIN_DATA];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
/**
 *  获取登陆数据
 *
 *  @param diction
 *
 *  @return
 */
- (NSDictionary *)byLoginSuccessData:(NSDictionary *)diction; {
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN_DATA];
}

/**
 *  保存userImageURL
 *
 *  @param userIdString
 */
- (void)saveuserImageURL:(NSString *)userImageURL {
    [[NSUserDefaults standardUserDefaults] setObject:userImageURL forKey:USERIAMGEURL];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
/**
 *  获取userImageURL
 *
 *  @return
 */
- (NSString *)byuserImageURL {
    return [[NSUserDefaults standardUserDefaults] objectForKey:USERIAMGEURL];
}

//=================================
/**
 *  保存userid
 *
 *  @param userIdString
 */
- (void)saveUserId:(NSString *)userIdString {
    [[NSUserDefaults standardUserDefaults] setObject:userIdString forKey:USERID];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
/**
 *  获取userid
 *
 *  @return
 */
- (NSString *)byUserId {
    return [[NSUserDefaults standardUserDefaults] objectForKey:USERID];
}

//=================================

/**
 *  保存reuserId
 *
 *  @param userIdString
 */
- (void)savereuserId:(NSString *)reuserIdString {
    [[NSUserDefaults standardUserDefaults] setObject:reuserIdString forKey:REUSERID];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
/**
 *  获取reuserId
 *
 *  @return
 */
- (NSString *)byreuserId {
    return [[NSUserDefaults standardUserDefaults] objectForKey:REUSERID];
}


/**
 *  保存用户名
 *
 *  @param userIdString
 */
- (void)saveUserName:(NSString *)userNameString {
    [[NSUserDefaults standardUserDefaults] setObject:userNameString forKey:USERNAME];
    [[NSUserDefaults standardUserDefaults] synchronize];

}
/**
 *  获取用户名
 *
 *  @return
 */
- (NSString *)byUserName {
    return [[NSUserDefaults standardUserDefaults] objectForKey:USERNAME];
}



- (void)saveLogin:(BOOL)yesIsNo{
    [[NSUserDefaults standardUserDefaults] setBool:yesIsNo forKey:YesIsNo];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**
 *  保存用户名密码
 *
 *  @param userIdString
 */
- (void)saveUserPWD:(NSString *)userPWDString {
    [[NSUserDefaults standardUserDefaults] setObject:userPWDString forKey:USERPWD];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
/**
 *  获取用户名秘密啊
 *
 *  @return
 */
- (NSString *)byUserPWD {
    return [[NSUserDefaults standardUserDefaults] objectForKey:USERPWD];
}

/**
 *  保存FileNoticeId
 *
 *  @param userIdString USERSTATE
 */
- (void)savefileNoticeId:(NSString *)fileNoticeIdString{
    [[NSUserDefaults standardUserDefaults] setObject:fileNoticeIdString forKey:FileNoticeId];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
/**
 *  获取FileNoticeId
 *
 *  @return
 */
- (NSString *)byfileNoticeId {
    
     return [[NSUserDefaults standardUserDefaults] objectForKey:FileNoticeId];
}

//记住密码
+ (void)savePassword:(NSString *)userName pwd:(NSString *)password{
    
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:USERNAME];
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:USERPWD];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isSavePwd"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//取消记住密码
+ (void)deletePwd{
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USERNAME];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USERPWD];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isSavePwd"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


/**
 *  保存storeid
 *
 */

- (void)saveStoreId:(NSString *)storeid {
    [[NSUserDefaults standardUserDefaults] setObject:storeid forKey:STOREID];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**
 *  获取storeid
 *
 *  @return
 */

- (NSString *)byStoreId {
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:STOREID];
    
}



/**
 *  保存便利店名字
 *
 *  @return
 */
- (void)saveStoreName:(NSString *)storeName {
    [[NSUserDefaults standardUserDefaults] setObject:storeName forKey:STORENAME];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


/**
 *  获取便利店名字
 *
 *  @return
 */
- (NSString *)byStoreName {
    return [[NSUserDefaults standardUserDefaults] objectForKey:STORENAME];
}


/**
 *  保存经纬度
 */
- (void)saveLatitudeOrLongitude:(NSDictionary *)latitudeDIc {
    [[NSUserDefaults standardUserDefaults] setObject:latitudeDIc forKey:LATORLONG];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**
 * 获取经纬度
 */

- (NSDictionary *)byLatitudeOrLongitude {
    return [[NSUserDefaults standardUserDefaults] objectForKey:LATORLONG];
}


/**
 *  获取是否记住密码状态
 *
 *  @return
 */

+ (BOOL)isSaveUserPwd
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isSavePwd"] == YES) {
        return YES;
    }
    else{
        return NO;
    }
}

@end