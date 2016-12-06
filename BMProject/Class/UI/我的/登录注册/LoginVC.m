//
//  LoginVC.m
//  BMProject
//
//  Created by WangKaifeng on 15/11/23.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import "LoginVC.h"
#import <SMS_SDK/SMSSDK.h>
#import <SMS_SDK/SMSSDK+AddressBookMethods.h>
#import "MyViewController.h"
#define TIME 60
@interface LoginVC ()
{
    NSTimer* _timer1;
    NSTimer* _timer2;
}

@property (weak, nonatomic) IBOutlet UIButton *btVercode;

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *tfVerCode;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;

@end

@implementation LoginVC
#pragma mark -- 注册
- (IBAction)loginAction:(id)sender {
    
    [self verAction];
    [self getData];
}

- (void)getData{
    
    NSString *userName = _userName.text;
    NSString *pss = _tfPassword.text;
    //封装参数
    NSDictionary *dict = @{@"phone" : userName,
                           @"userPass" : pss
                           };
    
    //装成json字符串
    NSString *stringJson = [JSONFunction jsonStringWithNSDictionary:dict];
    NSDictionary *jsonDic = @{@"mData" : stringJson, @"loginType" : @"1"};
    
    //拼接链接
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,PASS_WOELD];
    
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:jsonDic UrlStr:url andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {
            
            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
                NSLog(@"success@!");
                NSString *storeIDstring = responseData[@"result"][@"storeId"];
                [COM saveStoreId:storeIDstring]; //保存storeid
                MyViewController* yj = [[MyViewController alloc] init];
                [self.navigationController pushViewController:yj animated:YES];
                [COM saveUserName:userName];
                [COM saveUserPWD:pss];
                
            }
        }else{
            
            mAlertView(@"提示", @"此手机号已注册");
            
        }
    }]; 
}

#pragma mark -- 获取验证码

- (IBAction)gainVercode:(id)sender {
    
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:TIME
                                                      target:self
                                                    selector:@selector(showRepeatButton)
                                                    userInfo:nil
                                                     repeats:YES];
    
    _timer1 = timer;
    NSTimer* timer2 = [NSTimer scheduledTimerWithTimeInterval:1
                                                       target:self
                                                     selector:@selector(updateTime)
                                                     userInfo:nil
                                                      repeats:YES];
    _timer2 = timer2;
    
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.userName.text zone:@"86" customIdentifier:@"旗讯" result:^(NSError *error) {
        //注意区号和手机号码前面都不要加“＋”号，有的开发者喜欢这样写，@“＋86”，这种是错误的写法
        if (!error) {
            
            NSLog(@"获取验证码成功");
        } else {
            NSLog(@"错误吗：zi");
        }
    }];
    
}

#pragma mark -- 验证验证码
- (void) verAction {

    [SMSSDK commitVerificationCode:self.tfVerCode.text phoneNumber:self.userName.text zone:@"86" result:^(NSError *error) {
        //self.verfyCode.text这里传的是获取到的验证码，可以把获取到的验证码填写在文本框里面，然后获取到文本框里面的值传进参数里
        if (error) {
            
            ITOAST_ALERT(@"填写正确的验证码");
        }
    }];
    
//    [SMS_SDK commitVerifyCode:self.verfyCode.text result:^(enum SMS_ResponseState state) {
//        //self.verfyCode.text这里传的是获取到的验证码，可以把获取到的验证码填写在文本框里面，然后获取到文本框里面的值传进参数里
//        if (1==state) {
//            NSLog(@"验证成功");
//        } else if (0==state){
//            NSLog(@"验证失败");
//        }
//    }];
    
}

static int count = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackBarButton];
    self.userName.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.userName.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.userName.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    [_timer2 invalidate];
    [_timer1 invalidate];
    
    count = 0;
}

-(void)updateTime
{
    count++;
    if (count >= TIME)
    {
        _btVercode.userInteractionEnabled = YES;
        [_btVercode setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_timer2 invalidate];
        return;
    }
    
    
    [_btVercode setTitle:[NSString stringWithFormat:@"%i%@",TIME-count,@"秒"] forState:UIControlStateNormal];
}

-(void)showRepeatButton{
    NSLog(@"定时器完成");
    [_timer1 invalidate];
    return;
}
- (void)didReceiveMemoryWarning: (UIGestureRecognizer*)sender{
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

@end
