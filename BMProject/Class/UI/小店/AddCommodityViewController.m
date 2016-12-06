//
//  AddCommodityViewController.m
//  BMProject
//
//  Created by xa on 15/11/5.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#define NUMBERS @"0123456789\n"
#import "AddCommodityViewController.h"
#import "SDRefresh.h"
@interface AddCommodityViewController (){
    BOOL State;
    
    NSString *comName;
    NSString *addpice;
    NSString *imageurl;
    NSDictionary *ionary;
    
}
@property (nonatomic,assign) BOOL isClick;
@property (nonatomic, weak) SDRefreshFooterView *refreshFooter;
@property (nonatomic, weak) SDRefreshHeaderView *refreshHeader;
@end

@implementation AddCommodityViewController

-(MessgeCoverView *)coverView
{
    if (!_coverView) {
        _coverView = [[MessgeCoverView alloc] initWithFrame:CGRectMake(0, 0, MAIN_WIDTH,VIEW_HEIHT)];
        _coverView.delegate = self;
        [self.view addSubview:_coverView];
        
    }
    return _coverView;
}

- (void) myAction:(NSMutableArray *)array {
    
 
   self.arraygoods = [NSMutableArray array];
    _arraygoods = array;
    
 [self.addGoodsTableView reloadData];
    
}

- (void)getData {
    //封装参数
    NSDictionary *dict = @{};
    
    //装成json字符串
    NSString *stringJson = [JSONFunction jsonStringWithNSDictionary:dict];
    NSDictionary *jsonDic = @{@"mData" : stringJson};
    
    //拼接链接
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,COMLISTBYCLASSIFY_List];
    
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:jsonDic UrlStr:url andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {
            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
                _googsDetailsArray = responseData[@"result"];
                NSString *idString = _googsDetailsArray[1][@"id"];
                NSString *nameString = _googsDetailsArray[1][@"claName"];
                
                NSDictionary *dict = @{@"ID"        : idString,
                                       
                                       @"goodsname" : nameString
                                       
                                       };
                COM.goodDic = dict;
               
                [self addloadGoods:idString];
                
            }
            else {
                
                [self showErrorHud:@"加载失败"];
            }
        }else{
        }
    }];
}



-(void)addloadGoods:(NSString *)stringid {
    
    
    //封装参数
    NSDictionary *dict = @{
                           @"claId"   : stringid,
                           @"pageNo"  : @"1"
                           
                           };
    
    //装成json字符串
    NSString *stringJson = [JSONFunction jsonStringWithNSDictionary:dict];
    NSDictionary *jsonDic = @{@"mData" : stringJson};
    
    //拼接链接
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,COMLISTBYCLASSIFY_GOODSList];
    
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:jsonDic UrlStr:url andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {
            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
                _arraygoods = responseData[@"result"][@"list"];
                
                [self.addGoodsTableView reloadData];
                
            }
            else {
                
                
            }
        }else{
        }
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBackBarButton];
    [self setDoneBarButtonWithSelector:@selector(rightButton:) andTitle:@"导航"];
    self.title = @"添加商品";
    _isClick = YES;
    COM.clickYesOrNo = YES;
    ionary = [NSDictionary dictionary];
    
    [self setupHeader];
    [self setupFooter];
    [self getData];
    
    self.addGoodsTableView.dataSource = self;
    self.addGoodsTableView.delegate = self;
    
    
   
}


- (void)setupHeader
{
    SDRefreshHeaderView *refreshHeader = [SDRefreshHeaderView refreshView];
    
    // 默认是在navigationController环境下，如果不是在此环境下，请设置 refreshHeader.isEffectedByNavigationController = NO;
    [refreshHeader addToScrollView:self.addGoodsTableView];
    
    __weak SDRefreshHeaderView *weakRefreshHeader = refreshHeader;
    __weak typeof(self) weakSelf = self;
    refreshHeader.beginRefreshingOperation = ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
//            count = 1;
//            if (arrayTableView) {
//                [arrayTableView removeAllObjects];
           
            //请求新的数据 重新刷新表格 每次在刷新之前移除array
            //[self getData:count];
            [weakSelf.addGoodsTableView reloadData];
            [weakRefreshHeader endRefreshing];
        });
    };

    // 进入页面自动加载一次数据
    [weakRefreshHeader autoRefreshWhenViewDidAppear];
 }

- (void)setupFooter
{
    SDRefreshFooterView *refreshFooter = [SDRefreshFooterView refreshView];
    [refreshFooter addToScrollView:self.addGoodsTableView];
    [refreshFooter addTarget:self refreshAction:@selector(footerRefresh)];
    _refreshFooter = refreshFooter;
}


- (void)footerRefresh
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //self.totalRowCount += 2;
//        count++;
//        [self getData:count];
        
        [self.addGoodsTableView reloadData];
        [self.refreshFooter endRefreshing];
    });
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arraygoods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *rouse = @"addgoodsCell";
    AddCommodityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rouse];
    if(cell == nil){
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"AddCommodityTableViewCell" owner:self options:nil];
        
        cell = [array objectAtIndex:0];
    }
    
    if([_arraygoods[indexPath.row][@"logourl"] isEqualToString:@""]){
        
        cell.goodsImageView.image = [UIImage imageNamed:@"water.jpg"];
    }else{
    
    NSString *imagestr = _arraygoods[indexPath.row][@"logourl"];
    NSString *urlimage = [NSString stringWithFormat:@"%@%@",kSERVER_GOODS_IMAGE,imagestr];
   [cell.goodsImageView setImageWithURL:[NSURL URLWithString:urlimage]];
    
    }
   
    
    cell.goodsNamelLable.text = _arraygoods[indexPath.row][@"comName"];
    cell.goodsPice.text = _arraygoods[indexPath.row][@"comDescribe"];
    
    [cell.goodsChangeBut addTarget:self action:@selector(changeGoodsBut:) forControlEvents:UIControlEventTouchUpInside];
    [cell.goodsChangeBut setBackgroundImage:[UIImage imageNamed:@"未选中"] forState:UIControlStateNormal];
    [cell.goodsChangeBut setBackgroundImage:[UIImage imageNamed:@"选中"] forState:UIControlStateSelected];
     cell.goodsChangeBut.tag = indexPath.row;
   
   
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)rightButton:(UIButton *)sender{
    
    BOOL isbool =  COM.clickYesOrNo;
    if (isbool) {
        [self.coverView show];
        COM.clickYesOrNo = NO;
        
    }else{
        [self.coverView hidden];
        COM.clickYesOrNo= YES;
    }
  
}

- ( void ) changeGoodsBut : ( UIButton * ) sender {
    
     UIButton *bu = sender;
    comName = _arraygoods[bu.tag][@"comName"];
    
     imageurl = _arraygoods[bu.tag][@"logourl"];
    
    
     sender.selected = !sender.selected;
    if( sender.selected){
        _alert = [[UIAlertView alloc] initWithTitle:@"" message:@"你是否要将此商品添加到自己的便利店中 " delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
        _alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        self.textfield = [[UITextField alloc]init];
        self.textfield = [_alert textFieldAtIndex:0];
        self.textfield.placeholder = @"请输入商品价格";
        self.textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        ZenKeyboard *zen = [[ZenKeyboard alloc] initWithFrame:CGRectMake(0, 0, 400, 216)];
        zen.textField = self.textfield;
        addpice = self.textfield.text;
        NSLog(@"-------%@",addpice);
        [_alert show];
        
    
        
    }else{
    
        NSLog(@"+++++-----");
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *message = [_alert buttonTitleAtIndex:buttonIndex];
    
    if([message isEqualToString:@"取消"]){
        
        NSLog(@"-----");
    }else{
        
        addpice = self.textfield.text;
        [self getData1];
        
       
        
    }

}
- (void)getData1 {
    
   if(imageurl.length == 0){
        
       [self Interface1];
       
    }else{
    
        [self Interface];
    
}
  }


-(void)Interface{
    
    //获取当前时间
    NSDate *today = [NSDate date];
    NSDateFormatter *date =[[NSDateFormatter alloc]init];
    [date setDateFormat:@"yyyy:MM:dd hh:mm"];
    NSString *date1 = [date stringFromDate:today];
    
    ionary = COM.goodDic;
    NSString *strID = ionary[@"ID"];
    NSString *strName = ionary[@"goodsname"];
    //封装参数
    NSDictionary *dict = @{
                           @"storeId"   :  [COM byStoreId],
                           
                           @"comName"   :   comName ,
                           
                           @"comPrice"  :   addpice,
                           
                           @"logoUrl"   :   imageurl,
                           
                           @"shelvesTime" : date1,
                           
                           @"claId"     :   strID,
                           
                           @"claName"   :   strName
                           };
    
    //装成json字符串
    NSString *stringJson = [JSONFunction jsonStringWithNSDictionary:dict];
    NSDictionary *jsonDic = @{@"mData" : stringJson};
    
    //拼接链接
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,COMLISTBYCLASSIFY_ADDGOODS];
    
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:jsonDic UrlStr:url andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {
            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
                
                
                ITOAST_ALERT(@"添加成功");
                [self backHome:nil];
                
                
            }
            else {
                
                ITOAST_ALERT(@"添加失败");
            }
        }else{
        }
    }];

    
    
}
-(void)Interface1{
    
    //获取当前时间
    NSDate *today = [NSDate date];
    NSDateFormatter *date =[[NSDateFormatter alloc]init];
    [date setDateFormat:@"yyyy:MM:dd hh:mm"];
    NSString *date1 = [date stringFromDate:today];
    
    ionary = COM.goodDic;
    NSString *strID = ionary[@"ID"];
    NSString *strName = ionary[@"goodsname"];
    //封装参数
    NSDictionary *dict = @{
                           @"storeId"   :  [COM byStoreId],
                           
                           @"comName"   :   comName ,
                           
                           @"comPrice"  :   addpice,
                           
                          // @"logoUrl"   :   imageurl,
                           
                           @"shelvesTime" : date1,
                           
                           @"claId"     :   strID,
                           
                           @"claName"   :   strName
                           };
    
    //装成json字符串
    NSString *stringJson = [JSONFunction jsonStringWithNSDictionary:dict];
    NSDictionary *jsonDic = @{@"mData" : stringJson};
    
    //拼接链接
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,COMLISTBYCLASSIFY_ADDGOODS];
    
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:jsonDic UrlStr:url andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {
            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
                
                
                ITOAST_ALERT(@"添加成功");
                [self backHome:nil];
                
                
            }
            else {
                
                ITOAST_ALERT(@"添加失败");
            }
        }else{
        }
    }];
    
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_textfield becomeFirstResponder];
    
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
