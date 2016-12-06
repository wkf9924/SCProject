//
//  BaseViewController.m
//  PerfectProject
//
//  Created by Meng huan on 14/11/19.
//  Copyright (c) 2014年 M.H Co.,Ltd. All rights reserved.
//

#import "BaseViewController.h"
#import "KVNProgress.h"
#import "PQFCustomLoaders.h"
#import "UIColor+flat.h"
@interface BaseViewController ()

@property (nonatomic, strong) PQFBarsInCircle *barsInCircle;
@property (nonatomic, strong) PQFBouncingBalls *bouncingBalls;
@property (nonatomic, strong) PQFCirclesInTriangle *circlesInTriangle;
@property (nonatomic) BOOL showLabels;
@end

@implementation BaseViewController{
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Do any additional setup after loading the view.
    }
    return self;
}
- (void)setupBaseKVNProgressUI
{
    // See the documentation of all appearance propoerties
    [KVNProgress appearance].statusColor = [UIColor darkGrayColor];
    [KVNProgress appearance].statusFont = [UIFont systemFontOfSize:17.0f];
    [KVNProgress appearance].circleStrokeForegroundColor = [UIColor darkGrayColor];
    [KVNProgress appearance].circleStrokeBackgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.3f];
    [KVNProgress appearance].circleFillBackgroundColor = [UIColor clearColor];
    [KVNProgress appearance].backgroundFillColor = [UIColor colorWithWhite:0.9f alpha:0.9f];
    [KVNProgress appearance].backgroundTintColor = [UIColor whiteColor];
    [KVNProgress appearance].successColor = [UIColor darkGrayColor];
    [KVNProgress appearance].errorColor = [UIColor darkGrayColor];
    [KVNProgress appearance].circleSize = 75.0f;
    [KVNProgress appearance].lineWidth = 2.0f;
}

- (void)setupCustomKVNProgressUI
{
    // See the documentation of all appearance propoerties
    [KVNProgress appearance].statusColor = [UIColor whiteColor];
    [KVNProgress appearance].statusFont = [UIFont fontWithName:@"HelveticaNeue-Thin" size:15.0f];
    [KVNProgress appearance].circleStrokeForegroundColor = [UIColor whiteColor];
    [KVNProgress appearance].circleStrokeBackgroundColor = [UIColor colorWithWhite:1.0f alpha:0.3f];
    [KVNProgress appearance].circleFillBackgroundColor = [UIColor colorWithWhite:1.0f alpha:0.1f];
    [KVNProgress appearance].backgroundFillColor = [UIColor colorWithRed:0.173f green:0.263f blue:0.856f alpha:0.9f];
    [KVNProgress appearance].backgroundTintColor = [UIColor colorWithRed:0.173f green:0.263f blue:0.856f alpha:1.0f];
    [KVNProgress appearance].successColor = [UIColor whiteColor];
    [KVNProgress appearance].errorColor = [UIColor whiteColor];
    [KVNProgress appearance].circleSize = 110.0f;
    [KVNProgress appearance].lineWidth = 1.0f;
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
//    [self setupBaseKVNProgressUI];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
//    // iOS7顶部屏幕适配
//    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
//    {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
//#endif
    
    // 默认背景色
    self.view.backgroundColor = DEF_RGB_COLOR(59, 172, 252);
//    self.view.backgroundColor = [UIColor whiteColor];
    
}
//-(CGFloat)navBarHeight{
//    
//    return  44+[UIApplication sharedApplication].statusBarFrame.size.height;
//}

#pragma mark - 指示器 加载动画
- (void)activityIndicatorStartShowInView:(UIView *)showView loadText:(NSString *)loadText loadType:(int)type {
    
    if (type == 1) {
        self.bouncingBalls = [[PQFBouncingBalls alloc] initLoaderOnView:self.view];
        //        self.bouncingBalls.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.5];
        self.bouncingBalls.label.text = loadText;
        [self.bouncingBalls show];
    }else if (type == 2){
        
        self.barsInCircle = [[PQFBarsInCircle alloc] initLoaderOnView:self.view];
        self.barsInCircle.center = CGPointMake(self.barsInCircle.center.x, self.barsInCircle.center.y - self.bouncingBalls.frame.size.height - 40);
        self.barsInCircle.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.5];
        self.barsInCircle.label.text = loadText;
        [self.barsInCircle show];
    }else{
        self.circlesInTriangle = [[PQFCirclesInTriangle alloc] initLoaderOnView:self.view];
        self.circlesInTriangle.center = CGPointMake(self.circlesInTriangle.center.x, self.circlesInTriangle.center.y + self.bouncingBalls.frame.size.height + 40);
        self.circlesInTriangle.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.5];
        self.circlesInTriangle.label.text = loadText;
        [self.circlesInTriangle show];
    }
    
}

#pragma mark - 错误提示
- (void)errorTipHUDByMsg:(NSString *)msg
{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:nil
                                                 message:msg
                                                delegate:nil
                                       cancelButtonTitle:@"好"
                                       otherButtonTitles:nil, nil];
    [av show];
}

- (void)removeLoaders {
    [self.barsInCircle remove];
    [self.circlesInTriangle remove];
    [self.bouncingBalls remove];
}

- (void)activityIndicatorFinish{
    
    [self.barsInCircle hide];
    [self.circlesInTriangle hide];
    [self.bouncingBalls hide];
    [self removeLoaders];
    //    [_xmLoading stopAnimationWithLoadText:@"加载成功" withType:type];
}
- (void)hiddenHud{
    
    [KVNProgress dismiss];
}

- (void)showNoTextHud:(float)time{
    
    [KVNProgress show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hiddenHud];
    });
    
}
- (void)showSuccessHud:(NSString *)presentation{
    
    [KVNProgress showSuccessWithStatus:presentation];
}
- (void)showErrorHud:(NSString *)presentation{
    
    [KVNProgress showErrorWithStatus:presentation];
}
- (void)showTextHud:(NSString *)presentation waitTime:(float)time{
    
    [KVNProgress showWithStatus:presentation];
    
}
- (void)showProgressHud:(NSString *)presentation{
    
    [KVNProgress showProgress:0.0f status:presentation];
}
-(void)updateProgressHud:(float)lenth{
    
    [KVNProgress updateProgress:lenth animated:YES];
}

-(BOOL)isNullWith:(id)sender{
    if ([sender isKindOfClass:[NSNull class]]) {
        return YES ;
    }
    return NO ;
    
    
}
#pragma mark - 构建广告滚动视图

- (void)createScrollView: (UIView *)view andViewHight:(float)viewHight
{
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    float hight =  viewHight > 0 ? viewHight : 150;
    
    
    self.adView = [AdView adScrollViewWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, hight)  \
                                   imageLinkURL:_imagesURL\
                            placeHoderImageName:NOIMG \
                           pageControlShowStyle:UIPageControlShowStyleLeft];
    
    //    self.adView = [AdView adScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, hight) localImageLinkURL:_imagesURL pageControlShowStyle:UIPageControlShowStyleRight];
    
    //    是否需要支持定时循环滚动，默认为YES
    //    adView.isNeedCycleRoll = YES;
    
    [self.adView setAdTitleArray:self.imageTitles withShowStyle:AdTitleShowStyleRight];
    //    设置图片滚动时间,默认3s
    //    adView.adMoveTime = 2.0;
    
    //图片被点击后回调的方法
    self.adView.callBack = ^(NSInteger index,NSString * imageURL)
    {
       
    };
    [view addSubview:self.adView];
    
}



#pragma mark - tableview
-(void)createTableview:(CGRect)rect tableStype:(UITableViewStyle *)style{
    //    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
    //        self.edgesForExtendedLayout = UIRectEdgeNone;
    
//    _tableview = [[UITableView alloc] initWithFrame:rect style:(int)style];
//    _tableview.frame = rect;
//    _tableview.showsVerticalScrollIndicator=NO;
//    _tableview.delegate = self;
//    _tableview.dataSource = self;
//    [self.view addSubview:_tableview];
//    [self setExtraCellLineHidden:_tableview];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        //cell的四种样式
        //UITableViewCellStyleDefault,       只显示图片和标题
        //UITableViewCellStyleValue1,        显示图片，标题和子标题（子标题在右边）
        //UITableViewCellStyleValue2,        标题和子标题
        //UITableViewCellStyleSubtitle       显示图片，标题和子标题（子标题在下边）
    }
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return .1f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

#pragma mark - backHome
-(void)backHome:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)isMobileNumber:(NSString *)mobileNum
{
    
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,152,155,156,185,186
     */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133,1349,153,180,189
     */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


#pragma mark   --------------
#pragma mark   根据字符串计算Lable的宽度

-(CGFloat)GetLengthFronString:(NSString *)string font:(UIFont *)font height:(CGFloat)height{
    if (font == nil) {
        font =  [UIFont systemFontOfSize:15.f];
    }
    CGSize size = [string sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, height)];
    return size.width ;
    
}

#pragma mark   --------------
#pragma mark   根据字符串计算Lable的高度

-(CGFloat)GetheightfromString:(NSString *)string font:(UIFont *)font width:(CGFloat)width{
    if (font == nil) {
        font =  [UIFont systemFontOfSize:15.f];
    }
    CGSize textSize = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                           options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                        attributes:@{NSFontAttributeName: font}
                                           context:nil].size;
    return textSize.height ;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -
#pragma mark - 支持重力感应，屏幕旋转
- (BOOL)shouldAutorotate
{
    // 开启自动旋转，通过supportedInterfaceOrientations来指定旋转的方向
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    // 指定旋转的方向
    
    return UIInterfaceOrientationMaskAll;
//    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
//    return UIInterfaceOrientationMaskPortrait;
}

@end
