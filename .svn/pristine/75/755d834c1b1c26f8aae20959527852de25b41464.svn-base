//
//  CodeVC.m
//  BMProject
//
//  Created by WangKaifeng on 15/12/14.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import "CodeVC.h"

@interface CodeVC ()

@property (weak, nonatomic) IBOutlet UIImageView *codeImageView;
@end

@implementation CodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getCodeImage]; //获取便利店二维码
    // Do any additional setup after loading the view from its nib.
}

- (void)getCodeImage {
    
    NSString *storeId = [COM byStoreId];
    if (storeId.length == 0) {
        return;
    }
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
                NSString *logoURL = resultDic[@"qrCode"];
                NSString *urlString = [NSString stringWithFormat:@"%@%@", kSERVER_CODEIMAGE, logoURL];
                [_codeImageView setImageWithURL:[NSURL URLWithString:urlString]];
            }
            else {
                
            }
        }else{
        }
    }];

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

@end
