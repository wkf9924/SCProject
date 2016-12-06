//
//  SigninViewController.m
//  BMProject
//
//  Created by xa on 15/11/25.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import "SigninViewController.h"

@interface SigninViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;

@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation SigninViewController


- (IBAction)loginAction:(id)sender {
    //封装参数
    NSDictionary *dict = @{@"phone" : _userName.text, //phone代表便利店  mobile 代表用户
                           @"userPass" : _password.text};
    
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
                NSDictionary *resultDic = responseData[@"result"];
                ITOAST_ALERT(@"登录成功");
                
                NSString *storeid = resultDic[@"storeId"];
                NSString *storeName = resultDic[@"storeName"];
                [COM saveStoreId:storeid];
                //保存用户名
                [COM saveUserName:_userName.text];
                //保存便利店名字
                [COM saveStoreName:storeName];
                [COM saveUserPWD:_password.text];
                [self backHome:nil];
            }
            else {
                
            }
        }
        else{
            
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackBarButton];
     self.title = @"登录";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)siginButton:(id)sender {
    
    
}
@end
