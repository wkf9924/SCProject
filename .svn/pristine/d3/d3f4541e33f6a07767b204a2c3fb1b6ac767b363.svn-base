//
//  TestViewController.m
//  XHFlow
//
//  Created by WangKaifeng on 15/6/16.
//  Copyright (c) 2015年 王凯锋 158682312@qq.com. All rights reserved.
//

#import "TestViewController.h"
#import "GRNetworkAgent.h"
#import "JSONFunction.h"
#import "JsonReciprocity.h"
#import "PersonModel.h"
#import "CarModel.h"
#import "TestObject.h"
#import "HouseModel.h"
#import "AppConfigure.h"
#import "UIActionSheet+Blocks.h"

//#define SERVER               @"http://192.168.1.181:8080"
#define LOGIN                 @"ServiceInfo"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self afnetworkAction];
//    [self setBackBarButton];
    
    //  [self fetchAppleHtml];
    //    [self fetchYahooData];
    //    [self fetchYahooData2_GCD];
    //    [self httpGetWithParams];
    
    //pickview重用
//    _pickview=[[ZHPickView alloc] initPickviewWithArray:array isHaveNavControler:NO];
    
//    实现Delegate
    
//    -(void)toobarDonBtnHaveClick:(ZHPickView *)pickView resultString:(NSString *)resultString row:(NSInteger)rowNum;
    
    [self httpPostWithParams];
    
    
    [UIActionSheet showInView:self.view
                    withTitle:@"Test Action Sheet"
            cancelButtonTitle:@"Cancel"
       destructiveButtonTitle:@"Delete"
            otherButtonTitles:@[@"One", @"Two", @"Three"]
                     tapBlock:^(UIActionSheet *actionSheet, NSInteger buttonIndex){
                         NSLog(@"Tapped '%@' at index %ld", [actionSheet buttonTitleAtIndex:buttonIndex], (long)buttonIndex);
                     }];
}

//最新的请求方式 👄
- (IBAction)block:(UIButton *)sender {
    
    //      __weak typeof(self)weakSelf = self;
    
    [MHNetworkManager postReqeustWithURL:@"http://www.perasst.com:8081/perasst_v2/user/login.pa" params:@{@"userName":@"18538320461",@"password":@"123456"} successBlock:^(id returnData,int code,NSString *msg) {
        
        NSLog(@"----%@",returnData);
        
    } failureBlock:^(NSError *error) {
        
        NSLog(@"-----%@",error.localizedDescription);
        
    } showHUD:YES];
}

- (void)afnetworAction {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    //传入的参数
    NSDictionary *parameters = @{@"userName":@"test11",@"userPass":@"123456"};;
    //你的接口地址
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,@"dd"];
    //发送请求
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

}

- (void)getData{
    
    NSString *fileTitle = @"fileTitle";
    NSDictionary *dict = @{@"fileTitle":fileTitle
                           };
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    NSString *stringJson = [JSONFunction jsonStringWithNSDictionary:dict];
    
    [dictionary setValue:stringJson forKey:@"mData"];
    
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,@"ddd"];
    
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:dictionary UrlStr:url andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {
            NSDictionary *resultDic = responseData[@"result"];
            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
//                listArray = resultDic[@"list"];
//                [self.myTableView reloadData];
            }
        }else{
        }
    }];
    
}


- (void)afnetworkAction {
    
    NSDictionary * dic1 = @{@"username":@"yyl",
                            @"password":@"yyl",
                            @"action":@"1",
                            @"type":@"3"};
    
    //    NSString
    [[GRNetworkAgent sharedInstance] requestUrl:@"/dailyManager/ServiceInfo" param:dic1 baseUrl:kSERVER withRequestMethod:GRRequestMethodPost withCompletionBlockWithSuccess:^(GRBaseRequest * request) {
        NSLog(@"success: %@",request.responseString);
        
    } failure:^(GRBaseRequest * request) {
        NSLog(@"failure: %@",request.responseString);
    } withTag:101];
    
    
    NSDictionary *dic = @{@"manageId":@"18691529897", @"positon":@"0"};
    
    [[GRNetworkAgent sharedInstance] requestUrl:@"/Api.svc/GetAdvertises" param:dic baseUrl:@"http://enterpriseapi.yunshangweiqi.com" withRequestMethod:GRRequestMethodPost withCompletionBlockWithSuccess:^(GRBaseRequest *request) {
        
        NSString *responseString = [JSONFunction jsonObjectWithNSString:request.responseString];
        NSLog(@"request:%@", responseString);
        
        
        
        
    } failure:^(GRBaseRequest *request) {
        
    } withTag:100];


}

//asynchronousRequest connection
-(void)fetchAppleHtml{
    NSString *urlString = @"http://www.apple.com";
    NSURL *url = [NSURL URLWithString:urlString];
    //    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30.0f]; //maximal timeout is 30s
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if ([data length] > 0 && connectionError == nil) {
            NSString *documentsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            NSString *filePath = [documentsDir stringByAppendingPathComponent:@"apple.html"];
            [data writeToFile:filePath atomically:YES];
            NSLog(@"Successfully saved the file to %@",filePath);
            NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"HTML = %@",html);
        }else if ([data length] == 0 && connectionError == nil){
            NSLog(@"Nothing was downloaded.");
        }else if (connectionError != nil){
            NSLog(@"Error happened = %@",connectionError);
        }
    }];
}


//synchronousRequest connection
-(void)fetchYahooData{
    NSLog(@"We are here...");
    NSString *urlString = @"http://www.yahoo.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSLog(@"Firing synchronous url connection...");
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    if ([data length] > 0 && error == nil) {
        NSLog(@"%lu bytes of data was returned.",(unsigned long)[data length]);
    }else if([data length] == 0 && error == nil){
        NSLog(@"No data was return.");
    }else if (error != nil){
        NSLog(@"Error happened = %@",error);
    }
    NSLog(@"We are done.");
    
}
/*
 |
 | as we know, it will chock main thread when we call sendSynchronousRequest on main thread,,,,change below
 |
 v
 */
//call sendSynchronousRequest on GCD pool
-(void)fetchYahooData2_GCD{
    NSLog(@"We are here...");
    NSString *urlString = @"http://www.yahoo.com";
    NSLog(@"Firing synchronous url connection...");
    dispatch_queue_t dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(dispatchQueue, ^{
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        NSURLResponse *response = nil;
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
        if ([data length] > 0 && error == nil) {
            NSLog(@"%lu bytes of data was returned.",(unsigned long)[data length]);
        }else if ([data length] == 0 && error == nil){
            NSLog(@"No data was returned.");
        }else if (error != nil){
            NSLog(@"Error happened = %@",error);
        }
    });
    NSLog(@"We are done.");
    
}


//send a GET request to server with some params
-(void)httpGetWithParams{
    NSString *urlString = @"http://chaoyuan.sinaapp.com";
    urlString = [urlString stringByAppendingString:@"?p=1059"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setTimeoutInterval:30.0f];
    [urlRequest setHTTPMethod:@"GET"];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if ([data length] > 0 && connectionError == nil) {
            NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"HTML = %@",html);
        }else if([data length] == 0 && connectionError == nil){
            NSLog(@"nothing was download.");
        }else if(connectionError != nil){
            NSLog(@"Error happened = %@",connectionError);
        }
    }];
}

//send a POST request to a server with some params
-(void)httpPostWithParams{
    //    NSString *urlAsString = @"http://chaoyuan.sinaapp.com";
    
    NSString *urlAsString = @"http://www.prmt.cn/wkq-app/ThermostatService.asmx";
    urlAsString = [urlAsString stringByAppendingString:@"?param1=First"];
    urlAsString = [urlAsString stringByAppendingString:@"&param2=Second"];
    NSURL *url = [NSURL URLWithString:urlAsString];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url]; [urlRequest setTimeoutInterval:30.0f];
    [urlRequest setHTTPMethod:@"POST"];
    NSString *body = @"bodyParam1=BodyValue1&bodyParam2=BodyValue2"; [urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection
     sendAsynchronousRequest:urlRequest
     queue:queue completionHandler:^(NSURLResponse *response, NSData *data,
                                     NSError *error) {
         if ([data length] >0 &&
             error == nil){
             NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]; NSLog(@"HTML = %@", html);
         }
         else if ([data length] == 0 &&
                  error == nil){
             NSLog(@"Nothing was downloaded.");
         }
         else if (error != nil){
             NSLog(@"Error happened = %@", error);
         }
     }];
}

/*
 tips:
 except http get and post there are http delete and put and something else, if you are crazy about http, please GOOGLE!
 */


//-(void)goxmlrequest
//
//{
//
//    NSURL *url=[NSURL URLWithString:@""];
//
//    NSURLRequest *reauest=[NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30.f];
//
//
//    NSURLConnection *connection=[NSURLConnection connectionWithRequest:reauest delegate:self];
//
//    [connection start];
//
//}
//
//
//-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response{
//
//    NSLog(@"%@receiveResponse   ",self);
//
//}
//
//-(void)connection:(NSURLConnection*)connection didReceiveData:(NSData *)data{
//
//    NSLog(@"%@ didReceiveData  \n",self);
//
////    self.stringdata=[[NSMutableString alloc]initWithData:data encoding:NSUTF8StringEncoding];
////
////    NSLog(@"%@",strPartData);
//
//}



-(void)connectionDidFinishLoading:(NSURLConnection*)connection{
    
    //取出self.stringdata数据
    

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/





- (UIButton *)btnWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

#pragma mark - JsonString -> JsonDictionary

- (void)jsonStringToJsonDictionary {
    NSString *jsonString = @"\
    {\
    \"id\": 1420194,\
    \"name\" : \"Jack\",\
    \"score\" : 88.33,\
    \"register_date\" : 1428647083,\
    \"last_login_time\" : 1430642742,\
    \"house\": {\
    \"address\": \"GuangZhou China\",\
    \"area\": 95.6,\
    \"tags\":[\
    \"nice\",\
    \"comfort\"\
    ]}\
    },\
    \"cars\":[{\
    \"brand\":\"benz\",\
    \"num\":\"A14212\"\
    }]\
    }";
    NSDictionary *jsonDictionary = [jsonString toJsonDictionary];
    
    NSLog(@"jsonString: %@", jsonString);
    NSLog(@"jsonDictionary: %@", jsonDictionary);
}

#pragma mark - JsonDictionary -> JsonObject

- (void)jsonDictionaryToJsonObject {
    NSDictionary *jsonDictionary = @{
                                     @"id":@"1420194",
                                     @"name"  :@"Jack",
                                     @"score" : @"88.33",
                                     @"register_date": @"1428647083",
                                     @"last_login_time" : @"1430642742",
                                     @"house" : @{
                                             @"address" : @"GuangZhou China",
                                             @"area" : @(95.6),
                                             @"tags" : @[@"nice",
                                                         @"comfort"]
                                             },
                                     @"cars" : @[@{
                                                     @"brand":@"benz",
                                                     @"num":@"A14212"
                                                     }]
                                     };
    PersonModel *personModel = [PersonModel objectFromJsonDict:jsonDictionary];
    
    NSLog(@"jsonDictionary: %@", jsonDictionary);
    NSLog(@"jsonObject: %@", personModel.name);
}


#pragma mark - JsonString -> JsonObject

- (void)jsonStringToJsonObject {
    NSString *jsonString = @"\
    {\
    \"id\": 1420194,\
    \"name\" : \"Jack\",\
    \"score\" : 88.33,\
    \"register_date\" : 1428647083,\
    \"last_login_time\" : 1430642742,\
    \"house\": {\
    \"address\": \"GuangZhou China\",\
    \"area\": 95.6,\
    \"tags\":[\
    \"nice\",\
    \"comfort\"\
    ]}\
    },\
    \"cars\":[{\
    \"brand\":\"benz\",\
    \"num\":\"A14212\"\
    }]\
    }";
    PersonModel *personModel = [PersonModel objectFromJsonDict:[jsonString toJsonDictionary]];
    
    NSLog(@"jsonString: %@", jsonString);
    NSLog(@"jsonModel: %@", personModel);
}

#pragma mark - JsonObject -> JsonDictionary

- (void)jsonOjectToJsonDictionary {
    PersonModel *personModel = [[PersonModel alloc] init];
    personModel.id = 1420194;
    personModel.name = @"Jack";
    personModel.score = 88.33;
    personModel.registerDate = [NSDate dateWithTimeIntervalSince1970:1428647083];
    HouseModel *house = [[HouseModel alloc] init];
    house.address = @"GuangZhou China";
    house.area = 95.6;
    house.tags = @[@"nice", @"comfort"];
    personModel.house = house;
    CarModel *car = [[CarModel alloc] init];
    car.brand = @"benz";
    car.num = @"A14212";
    personModel.cars = @[car];
    
    NSDictionary *jsonDictionary = [personModel toJsonDictionary];
    
    NSLog(@"jsonObject: %@", personModel);
    NSLog(@"jsonDictionary: %@", jsonDictionary);
}



#pragma mark - JsonDictionary -> JsonString

- (void)jsonDictionaryToJsonString {
    NSDictionary *jsonDictionary = @{
                                     @"id":@"1420194",
                                     @"name"  :@"Jack",
                                     @"score" : @"88.33",
                                     @"register_date": @"1428647083",
                                     @"last_login_time" : @"1430642742",
                                     @"house" : @{
                                             @"address" : @"GuangZhou China",
                                             @"area" : @(95.6),
                                             @"tags" : @[@"nice",
                                                         @"comfort"]
                                             },
                                     @"cars" : @[@{
                                                     @"brand":@"benz",
                                                     @"num":@"A14212"
                                                     }]
                                     };
    NSString *jsonString = [jsonDictionary toJsonString];
    
    NSLog(@"jsonDictionary: %@", jsonDictionary);
    NSLog(@"jsonString: %@", jsonString);
}

#pragma mark - JsonObject -> JsonString

- (void)jsonObjectToJsonString {
    PersonModel *personModel = [[PersonModel alloc] init];
    personModel.id = 1420194;
    personModel.name = @"Jack";
    personModel.score = 88.33;
    personModel.registerDate = [NSDate dateWithTimeIntervalSince1970:1428647083];
    HouseModel *house = [[HouseModel alloc] init];
    house.address = @"GuangZhou China";
    house.area = 95.6;
    house.tags = @[@"nice", @"comfort"];
    personModel.house = house;
    CarModel *car = [[CarModel alloc] init];
    car.brand = @"benz";
    car.num = @"A14212";
    personModel.cars = @[car];
    
    NSString *jsonString = [personModel toJsonString];
    
    NSLog(@"jsonObject: %@", personModel);
    NSLog(@"jsonString: %@", jsonString);
}

#pragma mark - JsonString -> JsonObjectArray

- (void)jsonStringToJsonObjectArray {
    NSString *jsonString = @"\
    [{\
    \"id\": 1420194,\
    \"name\" : \"Jack\",\
    \"score\" : 88.33,\
    \"register_date\" : 1428647083,\
    \"last_login_time\" : 1430642742,\
    \"house\": {\
    \"address\": \"GuangZhou China\",\
    \"area\": 95.6,\
    \"tags\":[\
    \"nice\",\
    \"comfort\"\
    ]}\
    },\
    \"cars\":[{\
    \"brand\":\"benz\",\
    \"num\":\"A14212\"\
    }]\
    },{\
    \"id\": 1420194,\
    \"name\" : \"Jack\",\
    \"score\" : 88.33,\
    \"register_date\" : 1428647083,\
    \"last_login_time\" : 1430642742,\
    \"house\": {\
    \"address\": \"GuangZhou China\",\
    \"area\": 95.6,\
    \"tags\":[\
    \"nice\",\
    \"comfort\"\
    ]}\
    },\
    \"cars\":[{\
    \"brand\":\"benz\",\
    \"num\":\"A14212\"\
    }]\
    }]";
    NSArray *personModels = [PersonModel objectArrayFromJsonArray:[jsonString toJsonArray]];
    NSLog(@"jsonString: %@", jsonString);
    NSLog(@"jsonObjects: %@", personModels);
}

#pragma mark - JsonReciprocityDelegateDemo

- (void)jsonReciprocityDelegateDemo {
    NSString *jsonString = @"{\
    \"date1\" : \"2015/07/11\",\
    \"date2\" : \"2015.05.29\",\
    \"content_detail\" : \"this is a detail\",\
    \"test\" : \"Hello world\"\
    }";
    TestObject *object = [TestObject objectFromJsonDict:[jsonString toJsonDictionary]];
    NSLog(@"jsonString: %@", jsonString);
    NSLog(@"jsonObject: %@", object);
}






@end
