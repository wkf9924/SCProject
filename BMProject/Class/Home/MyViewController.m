    //
//  MyViewController.m
//  BMProject
//
//  Created by xa on 15/11/5.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import "MyViewController.h"
#import "Masonry.h"
#import "UIActionSheet+Blocks.h"
#import "AppConfigure.h"
#import "LoginVC.h"
#import "RegVC.h"
#import "LCNavigationController.h"
#import "CCLocationManager.h"
#import "MMLocationManager.h"
#import "SigninViewController.h"
@interface MyViewController () {
    
    NSString *latitudeString; //纬度
    NSString *longitudeString; //经度
    NSDictionary *resultDic;
}

@end

@implementation MyViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([COM byUserName].length == 0) {
        _myImageVIew.image = [UIImage imageNamed:@"user"];
    }
    _myNanme.text = [COM byUserName];
    if ([COM byUserName].length == 0) {
        _myIncome.text = @"";
        return;
    }
    NSString *logoURL= [COM byuserImageURL];
    [_myImageVIew setImageWithURL:[NSURL URLWithString:logoURL]];
    
    //每次打开便利店应用请求一次接口获取用户的最新收入等祥光内容， 走一次登陆接口
    [self getUserFile];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"便利店";
    resultDic = [NSDictionary dictionary];
    self.myNanme.text = [COM byUserName];
    self.myImageVIew.image = [UIImage imageNamed:@"user"];
    self.myImageVIew.layer.cornerRadius = 40;
    self.myImageVIew.layer.masksToBounds = YES;
    self.myImageVIew.userInteractionEnabled = YES;
    UITapGestureRecognizer *gesrecog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(photoAction)];
    gesrecog.cancelsTouchesInView = NO;
    [self.myView  addGestureRecognizer:gesrecog];

    [self.commoditymanagementBut.layer setMasksToBounds:YES];
    [self.commoditymanagementBut.layer setCornerRadius:15.0];
    [self.ordermanagementBut.layer setMasksToBounds:YES];
    [self.ordermanagementBut.layer setCornerRadius:15.0];
    [self.IncomeBut.layer setMasksToBounds:YES];
    [self.IncomeBut.layer setCornerRadius:15.0];
    [self.newsBut.layer setMasksToBounds:YES];
    [self.newsBut.layer setCornerRadius:15.0];
    [self.setupBut.layer setMasksToBounds:YES];
    [self.setupBut.layer setCornerRadius:15.0];
    
    NSLayoutConstraint * layout = self.width;
    layout.constant = (Main_Screen_Width-80)/3 ;
    
    if (iOS7) {
        [[MMLocationManager shareLocation] getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
            NSString *weizhi = [NSString stringWithFormat:@"纬度%f 经度%f",locationCorrrdinate.latitude,locationCorrrdinate.longitude];
            NSLog(@"weizhi:%@", weizhi);
        }];
    }
    
    if (IOSVersion >= 8.0) {
        [[CCLocationManager shareLocation] getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
            
            NSLog(@"纬度%f 经度%f",locationCorrrdinate.latitude,locationCorrrdinate.longitude);
            latitudeString = STRING_FORMAT(@"%f", locationCorrrdinate.latitude);
            longitudeString = STRING_FORMAT(@"%f", locationCorrrdinate.longitude);
            
        }];
    }
}

#pragma mark -- 点击图像到我的便利店界面
- (void)photoAction {
    if ([COM byUserName].length == 0) {
        [self TextTapGes];
        return;
    }
    [self.navigationController pushViewController:[[MyconveniencestoreViewController alloc] init]animated:YES];
}

#pragma mark -- 获取用户图像资料
- (void)getUserFile {
    NSString *userName = [COM byUserName];
    NSString *pwd = [COM byUserPWD];
    if (userName.length == 0  || pwd.length == 0) {
        return;
    }
    
    //封装参数
    NSDictionary *dict = @{@"phone" : userName, //phone代表便利店  mobile 代表用户
                           @"userPass" : pwd};
    
    //装成json字符串
    NSString *stringJson = [JSONFunction jsonStringWithNSDictionary:dict];
    NSDictionary *jsonDic = @{@"mData" : stringJson,
                              @"loginType" : @"1"}; //0 用户  1 便利店
    
    
    //拼接链接
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,kLOGIN];
    
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:jsonDic UrlStr:url andBlock:^(id responseData, NSError *error) {
        NSLog(@"Error @!  %@   %@", error.debugDescription, error.description);
        if (responseData)
        {
            BOOL result = [responseData[@"success"] boolValue];
            
            if (result == YES) {
                 resultDic = responseData[@"result"];
                NSString *balanceStr = resultDic[@"balance"];
                NSString *storeLogoUrl = resultDic[@"storeLogoUrl"];
                _myIncome.text = STRING_FORMAT(@"%@元", balanceStr);
                NSString *URL = [NSString stringWithFormat:@"%@%@", kSERVER_IMAGE_LOGO,storeLogoUrl];
                [_myImageVIew setImageWithURL:[NSURL URLWithString:URL]];
            }
            else {
                
            }
        }
        else{
            
        }
    }];
}


#pragma mark -- 我的账户 点击图片进入
-(void)TextTapGes{
    NSLog(@"----------");
    NSString *loginString = [COM byUserName];
    if (loginString.length == 0) {
        [UIActionSheet showInView:self.view
                        withTitle:@"是否登录"
                cancelButtonTitle:@"取消"
           destructiveButtonTitle:@"注册"
                otherButtonTitles:@[@"登录"]
                         tapBlock:^(UIActionSheet *actionSheet, NSInteger buttonIndex){
                             
                             switch (buttonIndex) {
                                 case 0: {
                                     LoginVC *loc = [[LoginVC alloc] init];
                                     [self.navigationController pushViewController:loc animated:YES];
                                 }
                                     break;
                                     
                                 case 1: {
                                     SigninViewController *sigin = [[SigninViewController alloc] init];
                                     [self.navigationController pushViewController:sigin animated:YES];
                                 }
                                     break;
                                     
                                 default:
                                     break;
                             }
                             NSLog(@"Tapped '%@' at index %ld", [actionSheet buttonTitleAtIndex:buttonIndex], (long)buttonIndex);
                         }];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)myconvenstorJumpBut:(id)sender {
    UIButton *button = sender;
    if ([COM byUserName].length == 0) {
        [self TextTapGes];
        return;
    }
    switch (button.tag) {
            //商品
            
           
        case 1:
            //点击商品获取审核状态的值
            [self getUserFile];
            if([resultDic[@"state"] isEqualToString:@"0"]){
                [IanAlert confirmWithTitle:@"你的信息还未审核，请先去审核在来使用" message:nil yes:@"确定"actionYes:^{
                    
                    RegVC *loginvc  = [[RegVC alloc] init];
                    
                    [self.navigationController pushViewController:loginvc animated:YES];
                }andno:@"取消" actionNo:^{
                    
                }];
                return;
            }

            [self.navigationController pushViewController:[[CommoditymanagementViewController alloc]init] animated:YES];
            
            break;
            //订单
        case 2:
            [self.navigationController pushViewController:[[OrdermanagementViewController alloc]init] animated:YES];
            break;
            //消息
        case 3:
            [self.navigationController pushViewController:[[MessageViewController alloc]init] animated:YES];
            break;
            //设置
        case 4:
            [self.navigationController pushViewController:[[SetupViewController alloc]init] animated:YES];            break;
            
        default:
            break;
    }
    
    
}


@end
