//
//  OrdermanagementViewController.m
//  BMProject
//
//  Created by xa on 15/11/9.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import "OrdermanagementViewController.h"
#import "Masonry.h"
#import "AppConfigure.h"
#import "OrderHeaderCell.h"
@interface OrdermanagementViewController (){
    
    UILabel *lable;
    
    NSString *orderId;
    
    NSInteger isHidden;
    
    NSMutableDictionary *orderdict;
    
    NSArray *orderallkeyarray;
    
    NSMutableArray *orederarray;
}

@end

@implementation OrdermanagementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackBarButton];
    self.title = @"订单管理";
    self.oneView.layer.borderWidth = 0.5;
    self.oneView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.ingoodsInformationArray = [NSMutableArray array];
    
    UIBarButtonItem *rightbarbut = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"iconfont-shuaxin"] style:UIBarButtonItemStyleDone target:self action:@selector(ruturnPreviouspage:)];
 self.navigationItem.rightBarButtonItem = rightbarbut;   
    
     //便利店未处理订单接口
    [self untreatedListAction];
    
   }

#pragma mark -- 便利店未处理订单接口
- (void)untreatedListAction {
    
    NSString *stroeid = [COM byStoreId];
    
    if (stroeid.length == 0) {
        return;
    }

    //封装参数
    NSDictionary *dict = @{
                           @"pageNo" : @"1",
                           
                           @"storeId": stroeid
                           
                           };
    
    //装成json字符串
    NSString *stringJson = [JSONFunction jsonStringWithNSDictionary:dict];
    NSDictionary *jsonDic = @{@"mData" : stringJson};
    
    //拼接链接
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,UNTREATEDlIST];
    
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:jsonDic UrlStr:url andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {
            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
               
                orderdict = [NSMutableDictionary dictionaryWithCapacity:10];
                orderdict = responseData[@"result"];
                orderallkeyarray  = [orderdict allKeys];
                
                if(!orderallkeyarray.count==0){
                    
                    
                    [self changeTableView];
                    
                }else{
                    
                    [self  Noorder];
                    lable.text = @"你还没未处理的订单";
                }
                
                
                [self.InTableView reloadData];

            }
            else {
                
            }
        }else{
        }
    }];

}

-(void)changeTableView{
    
    self.InTableView.dataSource = self;
    self.InTableView.delegate = self;
   [self.InTableView registerNib:[UINib nibWithNibName:@"OrdermanagermentTableViewCell" bundle:nil] forCellReuseIdentifier:@"InCell"];
    

      
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return orderallkeyarray.count;
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 30)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.userInteractionEnabled = YES;
    OrderHeaderCell *  cell = [[[NSBundle mainBundle] loadNibNamed:@"OrderHeaderCell" owner:self options:nil] lastObject];
    cell.orderLable.text = orderallkeyarray[section];
    [cell.canelBut addTarget:self action:@selector(canelorders:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.canelBut.layer.borderWidth = 1;
    cell.canelBut.layer.borderColor = [UIColor redColor].CGColor;
    cell.canelBut.layer.cornerRadius = 6;
    cell.canelBut.layer.masksToBounds = YES;
    
    
    cell.canelBut.tag = section;
    
    if(isHidden == 0){
        
        cell.canelBut.hidden = NO;
    }else{
        
        cell.canelBut.hidden = YES;
        
    }

    
    [bgView addSubview:cell];
    
    return bgView;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 44;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    orederarray = orderdict[orderallkeyarray[section]];
    
    return orederarray.count;
    
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    static NSString *rouse = @"InCell";
        OrdermanagermentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rouse];
    
    //添加图片
    NSString *imagestr = orderdict[orderallkeyarray[section]] [row][@"logoUrl"];
    if(imagestr.length == 0){
        
        cell.ordermanImageView.image = [UIImage imageNamed:@"water.jpg"];
    }else{
        
        
        NSString *urlimage = [NSString stringWithFormat:@"%@%@",kSERVER_GOODS_IMAGE,imagestr];
        [cell.ordermanImageView setImageWithURL:[NSURL URLWithString:urlimage]];
        
    }

    
    
    
     cell.ordermangoodsName.text = orderdict[orderallkeyarray[section]] [row][@"comName"];
     cell.ordermangoodsPhone.text = orderdict[orderallkeyarray[section]] [row][@"phone"];
     cell.ordermangoodsPice.text = orderdict[orderallkeyarray[section]] [row][@"price"];
     cell.ordermangoodsAddress.text = orderdict[orderallkeyarray[section]] [row][@"address"];
     cell.orderount.text = orderdict[orderallkeyarray[section]] [row][@"count"];
   
     return cell;
    
       
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)Noorder{
    __weak typeof(self) weakSelf = self;
    lable = [[UILabel alloc]init];
    lable.textColor = [UIColor blackColor];
    lable.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(weakSelf.view.mas_centerY);
        make.centerX.equalTo(weakSelf.view.mas_centerX);
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

//刷新
-(void)ruturnPreviouspage :(UIBarButtonItem *)sender{
    
    switch (isHidden) {
        case 0:
            [self untreatedListAction];
 
            break;
            
        case 1:
            [self distributionAction];
            break;
            
        case 2:
             [self completedAction];
            break;
            
        default:
            break;
    }
    
    
   
}

#pragma mark -- 订单完成的接口
- (void)completedAction {
    
    NSString *stroeid = [COM byStoreId];
    
    if (stroeid.length == 0) {
        return;
    }
    //封装参数
    NSDictionary *dict = @{@"pageNo"  : @"1",
                           
                           @"storeId" : stroeid
                           
                           };
    
    //装成json字符串
    NSString *stringJson = [JSONFunction jsonStringWithNSDictionary:dict];
    NSDictionary *jsonDic = @{@"mData" : stringJson};
    
    //拼接链接
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,FINISHLIST];
    
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:jsonDic UrlStr:url andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {
            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
                orderdict = [NSMutableDictionary dictionaryWithCapacity:10];
                orderdict = responseData[@"result"];
                orderallkeyarray  = [orderdict allKeys];
                
              if(orderallkeyarray.count != 0){
                    
                    [self changeTableView];
                    
                }else{
                    
                    
                    [self  Noorder];
                    lable.text = @"你还没有已完成的订单";
                    
                    
                }

                    [_InTableView reloadData];
            }
            else {
                
            }
        }else{
        }
    }];
    

}

#pragma mark -- 配送中
- (void)distributionAction {
    
    NSString *stroeid = [COM byStoreId];
    
    if (stroeid.length == 0) {
        return;
    }

    
    //封装参数
    NSDictionary *dict = @{
                           @"pageNo" : @"1",
                           
                           @"storeId" : stroeid
                           
                           };
    
    //装成json字符串
    NSString *stringJson = [JSONFunction jsonStringWithNSDictionary:dict];
    NSDictionary *jsonDic = @{@"mData" : stringJson};
    
    //拼接链接
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,PROCESSINGLIST];
    
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:jsonDic UrlStr:url andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {
            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
                orderdict = [NSMutableDictionary dictionaryWithCapacity:10];
                orderdict = responseData[@"result"];
                orderallkeyarray  = [orderdict allKeys];

                
                if(orderallkeyarray.count != 0){
                    
                    [self changeTableView];
                    
                }else{
                    
                    
                    [self  Noorder];
                    lable.text = @"你还没有配送中订单";
                    
                }
                
                [self.InTableView reloadData];
                
                
            }
            else {
                
            }
        }else{
        }
    }];
}

#pragma mark -- 派送
- (void)Delivery :(NSString *)orderID {
    
  
    //封装参数
    NSDictionary *dict = @{ @"orderId" : orderID };
    
    //装成json字符串
    NSString *stringJson = [JSONFunction jsonStringWithNSDictionary:dict];
    NSDictionary *jsonDic = @{@"mData" : stringJson};
    
    //拼接链接
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,SENDORDER];
    
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:jsonDic UrlStr:url andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {
            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
                
                [self showSuccessHud:@"派送成功"];
            
                [self.InTableView reloadData];
            
            }
            else {
                
                [self showErrorHud:@"失败"];
               // [IanAlert alertError:@"失败"];
            }
        }else{
        }
    }];
}


- (IBAction)completedButton:(id)sender {
    
     UIButton *but = sender;
    
    CGFloat f = MAIN_WIDTH/2 - 40;
    
    self.linelable.frame = CGRectMake(but.tag*f+5,CGRectGetMaxY(but.frame)+20, 70, 3);
    
    
    if (lable) {
        
        [lable removeFromSuperview];
    
    }
    
   
    switch (but.tag) {
        case 0: //未处理 wkf

            isHidden = 0;
            //便利店未处理订单接口
            [self untreatedListAction];
            
            
            break;
            
        case 1: //配送中 wkf
          
            isHidden = 1;
            [self distributionAction];
            
            break;
        case 2: //已完成 wkf
            
            isHidden = 3;
            [self completedAction];
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        default:
            break;
    }
 
}


-(void)canelorders :(UIButton *)sender{
    UIButton *but = sender;
    
    orderId = orderdict[orderallkeyarray[but.tag]] [0][@"orderId"];
    
    [self Delivery:orderId];
}
@end
