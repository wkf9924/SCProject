//
//  TelephoneViewController.m
//  BMProject
//
//  Created by xa on 15/11/7.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import "TelephoneViewController.h"

@interface TelephoneViewController (){
    NSDictionary *dic;
}


@end

@implementation TelephoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self setBackBarButton];
    self.title = @"客服电话";
    self.modifPhoneVIew.layer.borderWidth = 0.5;
    self.modifPhoneVIew.layer.borderColor = [[UIColor grayColor] CGColor];
   // self.modifPhoneVIew.backgroundColor = RGBACOLOR(249,249,249,1);
    [self.modifyBut.layer setMasksToBounds:YES];
    [self.modifyBut.layer setCornerRadius:8.0];
    UITapGestureRecognizer *gesrecog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TextTapGes:)];
    gesrecog.cancelsTouchesInView = NO;
   [self.view  addGestureRecognizer:gesrecog];
    self.modifyphoneTextFild.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self userDetailAction];
    // Do any additional setup after loading the view from its nib.
}
- (void)TextTapGes:(UIGestureRecognizer *)sender{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)userDetailAction {
    
    NSString *storeId = [COM byStoreId];
    //封装参数
    NSDictionary *dict = @{@"storeId" : storeId};
    
    //装成json字符串
    NSString *stringJson = [JSONFunction jsonStringWithNSDictionary:dict];
    NSDictionary *jsonDic = @{@"mData" : stringJson};
    
    //拼接链接
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,STOREDETAILS];
    
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:jsonDic UrlStr:url andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {
            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
                NSDictionary *resultDic = responseData[@"result"];
                if (![resultDic isKindOfClass:[NSDictionary class]]) {
                    return;
                }
                
                dic = [NSDictionary dictionaryWithDictionary:resultDic];
                
                
            }
            else {
                
            }
        }else{
        }
    }];
}

- (void)getData {
    
    NSString *ID = dic[@"storeId"];
    NSString *NAME = dic[@"storeName"];
    NSString *address = dic[@"storeAddr"];
    
    NSString *phone = self.modifyphoneTextFild.text;
    
    //封装参数
    NSDictionary *dict = @{
                           @"storeId"    :  ID,
                           @"storeName"  :  NAME,
                           @"storeAddr"  :  address,
                           @"phone"      :  phone
                           
                           };
    
    //装成json字符串
    NSString *stringJson = [JSONFunction jsonStringWithNSDictionary:dict];
    NSDictionary *jsonDic = @{@"mData" : stringJson};
    
    //拼接链接
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,UPDATEINFO];
    
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:jsonDic UrlStr:url andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {
            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
            }
            
            [self backHome:nil];
            
            [self showSuccessHud:@"修改成功"];
            
            
        }else {
            [self showErrorHud:@"修改失败"];
            
        }
    }];
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)modifyButton:(id)sender {
    
    [self getData];
}
@end
