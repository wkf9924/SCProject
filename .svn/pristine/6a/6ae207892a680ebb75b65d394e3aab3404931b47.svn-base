//
//  AppConfigure.h
//  HttpRequest
//
//  Created by rang on 12-11-8.
//
//
//

#import "LCProgressHUD.h"
#import "UIImageView+AFNetworking.h"
#import "UIViewController+GeneralMethod.h"
#import "AFNetworkTool.h"
#import "GRNetworkAgent.h"
#import "JsonReciprocity.h"
#import "JSONFunction.h"
#import "Common.h"
#import "iToast.h"
#import "BM_NetAPIManager.h"
#import "MBProgressHUD+MJ.h"
#import "MBProgressHUD+Add.h"
#import "MBProgressHUD.h"
#import "MHNetwrok.h"
#import "NSObject+Common.h"
#import "GTMDefines.h"
#import "GTMBase64.h"
#import "IanAlert.h"

//测试账号
#define CESHI_ZHANGHAO @"18712365478"

//#define kSERVER @"http://192.168.2.117:8081/Constore/b/mobile/"
//#define kSERVER_IMAGE @"http://192.168.2.117:8081/Constore/b/"
//#define kSERVER_CODEIMAGE @"http://192.168.2.117:8081/Constore/"

#define kSERVER @"http://192.168.2.254:8080/Constore/b/mobile/"
#define kSERVER_IMAGE @"http://192.168.2.254:8080/Constore/b/"
#define kSERVER_CODEIMAGE @"http://192.168.2.254:8080/Constore/"  //二维码
#define kSERVER_IMAGE_LOGO @"http://192.168.2.254:8080/Constore/userfiles/" //更新logo
#define kSERVER_GOODS_IMAGE @"http://192.168.2.254:8080"

//用户详情pmUserDetails
#define pmUserDetails @"pmUserDetails"


//登陆
#define kLOGIN @"login"
//注册
#define PASS_WOELD @"register"

//便利店添加基本信息 addStoreInfo
#define ADDSTOREINFO @"addStoreInfo"

//便利店基本信息修改 untreatedLis
#define UPDATEINFO @"updateInfo"

//便利店未处理订单 untreatedLis
#define UNTREATEDlIST @"untreatedList"

//便利店处理中的订单processingList
#define PROCESSINGLIST @"processingList"

//便利店已完成的接口 finishList
#define FINISHLIST @"finishList"

//便利店派送订单sendOrder
#define SENDORDER @"sendOrder"

//便利店详情接口 storeDetails
#define STOREDETAILS @"storeDetails"

//添加后商品管理列表 storeComList
#define COMLISTBYCLASSIFY @"storeComList"

//商品分类 comListByClassify_list
#define COMLISTBYCLASSIFY_List @"comClassify"

//商品列表 comListByClassify_list
#define COMLISTBYCLASSIFY_GOODSList @"comListByClassify"

//添加商品 comListByClassify_list
#define COMLISTBYCLASSIFY_ADDGOODS @"addCom"

//便利店商品添加后列表 storeComList
#define STORECOMLIST @"storeComList"

//商品派送行为 
#define SENDORDER @"sendOrder"


/** 上传图像回显URL
 *
 * @pram
 */
#define kLOGOURL @"rest/path/img"

 
//上传图像
#define kUPLOAD_PHOTO @"uploadPhoto"

#define DISPATCH_TIME_NOW (0ull)
#define NSEC_PER_SEC 1000000000ull
#define MAXFLOAT    0x1.fffffep+127f
#define  NOIMG  @"un_img.jpg"


/*－－－－－－－－－－－－－－－－－－－－app的相关配置－－－－－－－－－
 －－－－－－－－－*/
/*---------相关值根据需要自行更改--------------*/
//view背景颜色

#define VIWE_BACKGROUND [self.view setBackgroundColor:RGBCOLOR(240, 240, 239)];

/*-------------------------------------------------*/

#define LOAD_STRING @"信息获取中..."
#define NETWORK_ERROR @"请检查网络"
#define lOADING @"请稍候..."
#define SUCCE_STR @"操作成功"   //提示返回数据的
#define FAIL_STR @"操作失败"   //提示返回数据的


#define StrFromFloat(F)     [NSString stringWithFormat : @ "%f", F]
#define StrFromInt(I)       [NSString stringWithFormat : @ "%d", I]
#define StrFromFloat(F)     [NSString stringWithFormat : @ "%f", F]
#define StrFromInt(I)       [NSString stringWithFormat : @ "%d", I]

#define NumFromBOOL(B)      [NSNumber numberWithBool : B]
#define NumFromInt(I)       [NSNumber numberWithInt : I]
#define NumFromDouble(D)    [NSNumber numberWithDouble : D]
#define NumFromFloat(f)     [NSNumber numberWithFloat : f]

#define FormatStr(fmt, ...) [NSString stringWithFormat : fmt, ## __VA_ARGS__]

//判断上拉还是上提
#define REQUEST_PAGE_ONE    1
#define REQUEST_PAGE_NEXT   2


/**
 *  风火轮
 *
 */
//显示加载状态
#define SB_MBPHUD_SHOW(str,yesorno) [SBPublicAlert showMBProgressHUD:str andWhereView:self.view states:yesorno];
//提示网络加载错误等相关信息
#define SB_MBPHUD_HIDE(str,numSuccess) [SBPublicAlert hideYESMBprogressHUDcontent:str isSuccess:numSuccess];

//请稍候...
#define SB_LOADING [SBPublicAlert showMBProgressHUD:lOADING andWhereView:self.view states:NO];
//隐藏提示框
#define SB_HUD_HIDE [SBPublicAlert hideMBprogressHUD:self.view];
//提示操作成功
#define SB_TOAST(str)[SBPublicAlert showMBProgressHUD:str andWhereView:self.view  hiddenTime:2];
//在主线程或在后台执行block
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)


//#define NSLog(...)
//判断app版本
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey]
//显示加载状态
#define MBPHUD_SHOW   [MBProgressHUD showOnView:self.view];
//隐藏
#define MBPHUD_HIDDEN  [MBProgressHUD dismissForView:self.view];

//*******************************************

//windwos
#define THE_KEY_WINDOWN [UIApplication sharedApplication].keyWindow

//判断是否有网络
#define NET_WORK [NetworkUtil canConnect]

//取消网络请求
#define CANCEL_REQUEST     for (ASIFormDataRequest *request in [ASIFormDataRequest sharedQueue].operations) {[request clearDelegatesAndCancel];}

//设置app界面字体及颜色

#define kTitleFontLarge              [UIFont boldSystemFontOfSize:25]//一级标题字号
#define kTitleFontMiddle             [UIFont boldSystemFontOfSize:19]//二级标题字号
#define kTitleFontSmall              [UIFont boldSystemFontOfSize:16]//三级标题字号

#define kContentFontLarge            [UIFont systemFontOfSize:19]  //内容部分大字号
#define kContentFontMiddle           [UIFont systemFontOfSize:16]  //内容部分中字号
#define kContentFontSmall            [UIFont systemFontOfSize:13]  //内容部分小字号

//内容部分正常显示颜色和突出显示颜色
#define kContentColorNormal      [UIColor colorWithRed:57/255.0 green:32/255.0 blue:0/255.0 alpha:1]
#define kContentColorHighlight   [UIColor colorWithRed:0/255.0 green:191/255.0 blue:225/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
//几个常用色彩

#define kGrayColor              [UIColor colorWithRed:192/255.0 green:192/255.0 blue:192/255.0 alpha:1]
#define kBlackColor             [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1]
#define kRedColor               [UIColor colorWithRed:255/255.0 green:110/255.0 blue:107/255.0 alpha:1]
#define kBlueColor              [UIColor colorWithRed:96/255.0 green:195/255.0 blue:202/255.0 alpha:1]
#define kClearColor             [UIColor clearColor]
#define kWhiteColor             [UIColor whiteColor]
#define kAppBgColor             [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1]
#define kMainColor              [UIColor colorWithRed:64/255.0 green:168/255.0 blue:174/255.0 alpha:1]



#import "AppDelegate.h"

/*--------------------------------开发中常用到的宏定义--------------------------------------*/

#define ITOAST_ALERT(itString) [[iToast makeText:itString] show]
#define Ian_Alert(str) [IanAlert alertError:str]

//Toast体香
//#define ITOAST_LERT(itString) [[[iToast makeText:itString]setGravity:iToastGravityCenter] show]

//系统目录
#define kDocuments  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]


//----------方法简写-------
#define mAppDelegate        (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define mWindow             [[[UIApplication sharedApplication] windows] lastObject]
#define mKeyWindow          [[UIApplication sharedApplication] keyWindow]
#define mUserDefaults       [NSUserDefaults standardUserDefaults]
#define mNotificationCenter [NSNotificationCenter defaultCenter]

//加载图片
#define mImageByName(name)        [UIImage imageNamed:name]
#define mImageByPath(name, ext)   [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:name ofType:ext]]

//以tag读取View
#define mViewByTag(parentView, tag, Class)  (Class *)[parentView viewWithTag:tag]
//读取Xib文件的类
#define mViewByNib(Class, owner) [[[NSBundle mainBundle] loadNibNamed:Class owner:owner options:nil] lastObject]

//id对象与NSData之间转换
#define mObjectToData(object)   [NSKeyedArchiver archivedDataWithRootObject:object]
#define mDataToObject(data)     [NSKeyedUnarchiver unarchiveObjectWithData:data]

//度弧度转换
#define mDegreesToRadian(x)      (M_PI * (x) / 180.0)
#define mRadianToDegrees(radian) (radian*180.0) / (M_PI)

//金花通用颜色 土豪金
#define ColorWords(B5A15A) [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:1.0]


//颜色转换
#define mRGBColor(r, g, b)         [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define mRGBAColor(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
//rgb颜色转换（16进制->10进制）
#define mRGBToColor(rgb) [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:1.0]

//G－C－D
#define kGCDBackground(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define kGCDMain(block)       dispatch_async(dispatch_get_main_queue(),block)

//简单的以AlertView显示提示信息
#define mAlertView(title, msg) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil \
cancelButtonTitle:@"确定" \
otherButtonTitles:nil]; \
[alert show];


//----------设备系统相关---------
#define mRetina   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define mIsiP5    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136),[[UIScreen mainScreen] currentMode].size) : NO)
#define mIsPad    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define mIsiphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define mIsiOS7 [[[UIDevice currentDevice] systemVersion] floatValue] == 7.0
#define mIsiOS6 [[[UIDevice currentDevice] systemVersion] floatValue] == 6.0

#define mSystemVersion   ([[UIDevice currentDevice] systemVersion])
#define mCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
#define mAPPVersion      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define mFirstLaunch     mAPPVersion     //以系统版本来判断是否是第一次启动，包括升级后启动。
#define mFirstRun        @"firstRun"     //判断是否为第一次运行，升级后启动不算是第一次运行

//--------调试相关-------

//ARC
#if __has_feature(objc_arc)
//compiling with ARC
#else
#define mSafeRelease(object)     [object release];  x=nil
#endif

//调试模式下输入NSLog，发布后不再输入。
#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif

#if defined (DEBUG) && DEBUG == 1

#else
#define NSLog(...) {};
#endif

#if mTargetOSiPhone
//iPhone Device
#endif

#if mTargetOSiPhoneSimulator
//iPhone Simulator
#endif


/**
 * 导航图片
 */

//#define NAV_BACKGROUNDIMAGE self.navigationController.navigationBar.barTintColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"navBar"]];\
//self.navigationController.navigationBar.shadowImage=[UIImage imageNamed:@"navBar"];\
//self.navigationController.navigationBar.translucent=NO;\
//self.navigationController.interactivePopGestureRecognizer.delegate = self;\
//[self.navigationController.navigationBar setTitleTextAttributes:\
// @{NSFontAttributeName:[UIFont systemFontOfSize:20],\
//   NSForegroundColorAttributeName:[UIColor whiteColor]}];

#define NAV_BACKGROUNDIMAGE self.navigationController.navigationBar.barTintColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"navBar"]];\
self.navigationController.navigationBar.shadowImage=[UIImage imageNamed:@"navBar"];\
self.navigationController.navigationBar.translucent=NO;\
[self.navigationController.navigationBar setTitleTextAttributes:\
@{NSFontAttributeName:[UIFont systemFontOfSize:20],\
NSForegroundColorAttributeName:[UIColor whiteColor]}];


/**
 *  改变导航标题颜
 */
#define NAVGATION_TITLE_COLOR_WHITECOLOR  [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:17],NSFontAttributeName,nil]];

#define NAV_TITLE_COLOR(c,fontsize) [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:c,NSForegroundColorAttributeName,[UIFont systemFontOfSize:fontsize],NSFontAttributeName,nil]];

//################################### PUSH ############################################

#define NAV_PUSH -(UIBarButtonItem*)customLeftBackButton{\
UIImage *image=[UIImage imageNamed:@"返回.png"];\
UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];\
btn.frame=CGRectMake(15, 20, 25, 44);\
[btn setBackgroundImage:image forState:UIControlStateNormal];\
[btn addTarget:self action:@selector(popself) forControlEvents:UIControlEventTouchUpInside];\
UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];\
return backItem;\
}\
- (void)popself{\
[self.navigationController popViewControllerAnimated:YES];\
}


/**
 *  alert
 */

#define IS_STRING @"请填写完整信息"

//################################### Server Name Define
#define APPLICATION_SERVICE_DISK @"APPLICATION_SERVICE"

#define XcodeAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//修改导航栏back按钮
#define BACK_ITEM UIImage *image=[UIImage imageNamed:@"返回.png"];\
UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];\
btn.frame=CGRectMake(15, 20, 25, 44);\
[btn setBackgroundImage:image forState:UIControlStateNormal];\
[btn addTarget:self action:@selector(popself) forControlEvents:UIControlEventTouchUpInside];\
UIBarButtonItem *backItem = [[[UIBarButtonItem alloc] initWithCustomView:btn] autorelease];\
return backItem;

//---------界面跳转-------
#define NAVIGATION_NUM(num) [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:(self.navigationController.viewControllers.count - (num))] animated:YES];



//判断上拉还是上提
#define REQUEST_PAGE_ONE    1
#define REQUEST_PAGE_NEXT   2

//往右滑动
#define SWIPE_RIGHT     UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];\
[swipeRight setNumberOfTouchesRequired:1];\
[swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];\
[self.view addGestureRecognizer:swipeRight];

#define SWIPE_RIGHT_MONTH - (void)handleSwipe:(UISwipeGestureRecognizer *)gestureRecognizer {\
CGPoint location = [gestureRecognizer locationInView:self.view];\
if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionLeft) {\
location.x -= 220.0;\
}\
else if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionUp) {\
location.x -= 220.0;\
}\
else if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionDown) {\
location.x -= 220.0;\
}\
else{\
location.x += 220.0;\
}\
[UIView animateWithDuration:0.5 animations:^{\
[self back:nil];\
}];\
}



//** 沙盒路径 ***********************************************************************************
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

//获取颜色
#define COLOR_FOR_RGB(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

//Build 对应的是 CFBundleVersion（内部标示，用以记录开发版本的，每次更新的时候都需要比上一次高 如：当前版本是11  下一次就要大于11 比如 12，13 ....10000）
#define BundleVersion [[NSBundle  mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];

//版本号 Version 对应的就是CFBundleShortVersionString （发布版本号 如当前上架版本为1.1.0  之后你更新的时候可以改为1.1.1
#define ShortVersionBundleVersion [[NSBundle  mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]

//判断字典是不是空，是不是字典对象
#define DIC_IS_NOT_EMPTY(dicobj) [dicobj isKindOfClass:[NSDictionary class]]

//字符串不为空
#define IS_NOT_EMPTY(string) (string !=nil && ![string isKindOfClass:[NSString class]] && ![string isEqualToString:@""])
//字符串为空
#define NO_STRING(str)  if ([str isEqualToString:@""] || ![str isKindOfClass:[NSString class]]) {\
return;\
}

//数组不为空
#define ARRAY_IS_NOT_EMPTY(array) (array && [array isKindOfClass:[NSArray class]] && [array count])

//对象中的属性有网络请求对象（NetRequestController） 调用此宏释放
#define RELEASE_WEB_SERVICE(obj) {[obj releaseBlock];[obj release];obj=nil;}

#define THE_KEY_WINDOWN [UIApplication sharedApplication].keyWindow

#define YELLOW_COL COLOR_FOR_RGB(155,66,21,1)



/* ****************************************************************************************************************** */
#pragma mark - Frame (宏 x, y, width, height)

// App Frame
#define Application_Frame       [[UIScreen mainScreen] applicationFrame]

// App Frame Height&Width
#define App_Frame_Height        [[UIScreen mainScreen] applicationFrame].size.height
#define App_Frame_Width         [[UIScreen mainScreen] applicationFrame].size.width

// MainScreen Height&Width
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width
#define MAIN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define VIEW_HEIHT  [UIScreen mainScreen].bounds.size.height 



// 系统控件默认高度
#define kStatusBarHeight        (20.f)

#define kTopBarHeight           (44.f)
#define kBottomBarHeight        (49.f)

#define kCellDefaultHeight      (44.f)

#define kEnglishKeyboardHeight  (216.f)
#define kChineseKeyboardHeight  (252.f)


/* ****************************************************************************************************************** */
#pragma mark - Funtion Method (宏 方法)

// 加载图片
#define PNGIMAGE(NAME)          [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define JPGIMAGE(NAME)          [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define IMAGE(NAME, EXT)        [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]

// 字体大小(常规/粗体)
#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]

// 颜色(RGB)
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

// 当前版本
#define FSystemVersion          ([[[UIDevice currentDevice] systemVersion] floatValue])
#define DSystemVersion          ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define SSystemVersion          ([[UIDevice currentDevice] systemVersion])

// 当前语言
#define CURRENTLANGUAGE         ([[NSLocale preferredLanguages] objectAtIndex:0])

// 是否Retina屏
#define isRetina                ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(640, 960), \
[[UIScreen mainScreen] currentMode].size) : \
NO)

// 是否iPhone5
#define isiPhone5               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(640, 1136), \
[[UIScreen mainScreen] currentMode].size) : \
NO)
//判断是否ios7
#define IOS_VERSION_7 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)? (YES):(NO))
// 1.判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)

// 是否iPad
#define isPad                   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


//动态获取设备高度
#define IPHONE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define IPHONE_WIDTH [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define StateBarHeight 20
#define MainHeight (ScreenHeight - StateBarHeight)
#define MainWidth ScreenWidth
#define ContentHeight MainHeight - 44.0f

#define CGRECT_MAIN CGRectMake(0.0f, 0.0f, MainWidth, MainHeight)
#define CGRECT_CONTENT CGRectMake(0.0f, 0.0f, MainWidth, ContentHeight)

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)


// UIView - viewWithTag
#define VIEWWITHTAG(_OBJECT, _TAG)\
\
[_OBJECT viewWithTag : _TAG]

//格式化字符串
#define STRING_FORMAT(stringType,string) [NSString stringWithFormat:stringType,string];
#define FORMAT_INT(int) [NSString stringWithFormat:@"%d",int];
#define FORMAT_STR(str) [NSString stringWithFormat:@"%@",str];

#define ERROR_STRING(err) \
NSString *errorStr = [NSString stringWithFormat:@"%@", error];\
\
[[iToast makeToast: errorStr] show];


// 本地化字符串
/** NSLocalizedString宏做的其实就是在当前bundle中查找资源文件名“Localizable.strings”(参数:键＋注释) */
#define LocalString(x, ...)     NSLocalizedString(x, nil)
/** NSLocalizedStringFromTable宏做的其实就是在当前bundle中查找资源文件名“xxx.strings”(参数:键＋文件名＋注释) */
#define AppLocalString(x, ...)  NSLocalizedStringFromTable(x, @"someName", nil)

// RGB颜色转换（16进制->10进制）

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#if TARGET_OS_IPHONE
/** iPhone Device */
#endif

#if TARGET_IPHONE_SIMULATOR
/** iPhone Simulator */
#endif

// ARC
#if __has_feature(objc_arc)
/** Compiling with ARC */
#else
/** Compiling without ARC */
#endif



/* ****************************************************************************************************************** */
#pragma mark - Constants (宏 常量)


/** 时间间隔 */
#define kHUDDuration            (1.f)

/** 一天的秒数 */
#define SecondsOfDay            (24.f * 60.f * 60.f)
/** 秒数 */
#define Seconds(Days)           (24.f * 60.f * 60.f * (Days))

/** 一天的毫秒数 */
#define MillisecondsOfDay       (24.f * 60.f * 60.f * 1000.f)
/** 毫秒数 */
#define Milliseconds(Days)      (24.f * 60.f * 60.f * 1000.f * (Days))


#define ALERT_VIEW_TAG 1001
#define CONTANT_ALERT_VIEW_TAG 1002
#define ALERT_FOR_CONFIRM_BOOKING 2001
#define ALERT_FOR_UNCONFIRM_BOOKING 2002
#define ALERT_FOR_VEHICLE_CANCEL_BOOKING 2003
#define ALERT_FOR_PASSENGER_CANCEL_BOOKING 2004
#define ALERT_FOR_CALL_TAXI_AGAIN 2005
#define ALERT_FOR_PASSENGER_TAKE_TAXI 2006
#define ALERT_FOR_VEHICLE_UNCOMPLETE 2007
#define ALERT_FOR_VEHICLE_CANCEL 2008
#define ALERT_FOR_VEHICLE_CANCEL_COMFRIM 2009

#define VIEW_NEW_BOOKING_TAG 3005

#define ALERT_FOR_MUST_UPDATE 5001
#define ALERT_FOR_CAN_UPDATE 5002
#define ALERT_FOR_LOGOUT 5003
#define ALERT_FOR_LOGOUT_CANCLE_BOOKING 5004
#define ALERT_FOR_LOCATION 5005


// debug log
#ifdef ENABLE_DEBUGLOG
#define APP_DebugLog(...) NSLog(__VA_ARGS__)
#define APP_DebugLogBlue(...) LogBlue(__VA_ARGS__)
#define APP_DebugLogRed(...) LogRed(__VA_ARGS__)
#define APP_DebugLogGreen(...) LogGreen(__VA_ARGS__)
#else
#define APP_DebugLog(...) do { } while (0);
#define APP_DebugLogBlue(...) do { } while (0);
#define APP_DebugLogRed(...) do { } while (0);
#define APP_DebugLogGreen(...) do { } while (0);
#endif

// log
#define APP_Log(...) NSLog(__VA_ARGS__)



// View 坐标(x,y)和宽高(width,height)
#define ViewWidth(v)                        v.frame.size.width
#define ViewHeight(v)                       v.frame.size.height
#define ViewX(v)                            v.frame.origin.x
#define ViewY(v)                            v.frame.origin.y
#define SelfViewHeight                      self.view.bounds.size.height
#define RectX(f)                            f.origin.x
#define RectY(f)                            f.origin.y
#define RectWidth(f)                        f.size.width
#define RectHeight(f)                       f.size.height
#define RectSetWidth(f, w)                  CGRectMake(RectX(f), RectY(f), w, RectHeight(f))
#define RectSetHeight(f, h)                 CGRectMake(RectX(f), RectY(f), RectWidth(f), h)
#define RectSetX(f, x)                      CGRectMake(x, RectY(f), RectWidth(f), RectHeight(f))
#define RectSetY(f, y)                      CGRectMake(RectX(f), y, RectWidth(f), RectHeight(f))
#define RectSetSize(f, w, h)                CGRectMake(RectX(f), RectY(f), w, h)
#define RectSetOrigin(f, x, y)              CGRectMake(x, y, RectWidth(f), RectHeight(f))
#define Rect(x, y, w, h)                    CGRectMake(x, y, w, h)
#define DATE_COMPONENTS                     NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit
#define TIME_COMPONENTS                     NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit
#define FlushPool(p)                        [p drain]; p = [[NSAutoreleasePool alloc] init]
#define StatusBarHeight                     [UIApplication sharedApplication].statusBarFrame.size.height
#define SelfDefaultToolbarHeight            self.navigationController.navigationBar.frame.size.height
#define IOSVersion                          [[[UIDevice currentDevice] systemVersion] floatValue]
#define IsiOS7Later                         !(IOSVersion < 7.0)

#define Size(w, h)                          CGSizeMake(w, h)
#define Point(x, y)                         CGPointMake(x, y)


#define TabBarHeight                        49.0f
#define NaviBarHeight                       44.0f
#define HeightFor4InchScreen                568.0f
#define HeightFor3p5InchScreen              480.0f

#define ViewCtrlTopBarHeight                (IsiOS7Later ? (NaviBarHeight + StatusBarHeight) : NaviBarHeight)
#define IsUseIOS7SystemSwipeGoBack          (IsiOS7Later ? YES : NO)


//右边的itme
#define BAR_ITEM(images,actions) [[UIBarButtonItem alloc] initWithImage:images style:UIBarButtonItemStyleBordered  target:self action:actions];
//UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:PNGIMAGE(@"确定") style:UIBarButtonItemStyleBordered  target:self action:@selector(okAction:)];

/**
 *  alert
 */

#define IS_STRING @"请填写完整信息"


//判断上拉还是上提
#define REQUEST_PAGE_ONE    1
#define REQUEST_PAGE_NEXT   2

//往右滑动
#define SWIPE_RIGHT     UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];\
[swipeRight setNumberOfTouchesRequired:1];\
[swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];\
[self.view addGestureRecognizer:swipeRight];

#define SWIPE_RIGHT_MONTH - (void)handleSwipe:(UISwipeGestureRecognizer *)gestureRecognizer {\
CGPoint location = [gestureRecognizer locationInView:self.view];\
if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionLeft) {\
location.x -= 220.0;\
}\
else if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionUp) {\
location.x -= 220.0;\
}\
else if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionDown) {\
location.x -= 220.0;\
}\
else{\
location.x += 220.0;\
}\
[UIView animateWithDuration:0.5 animations:^{\
[self back:nil];\
}];\
}


//**************************  ShareSdk

#define IMAGE_NAME @"sharesdk_img"
#define IMAGE_EXT @"jpg"

#define CONTENT NSLocalizedString(@"TEXT_SHARE_CONTENT", @"ShareSDK不仅集成简单、支持如QQ好友、微信、新浪微博、腾讯微博等所有社交平台，而且还有强大的统计分析管理后台，实时了解用户、信息流、回流率、传播效应等数据，详情见官网http://sharesdk.cn @ShareSDK")
#define SHARE_URL @"http://www.sharesdk.cn"



//获取appDelegate实例。
//UIKIT_STATIC_INLINE AppDelegate *appDelegate()
//{
//    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
//}



#define HIDE_KEY -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event\
{\
[[UIApplication sharedApplication].keyWindow endEditing:YES];\
}

#define SB_VIEWCONTROLLER(viewController,vc) UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:viewController bundle:nil];\
viewController *vc = [storyBoard instantiateViewControllerWithIdentifier:viewController];


