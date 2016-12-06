//
//  CommoditymanagementViewController.m
//  BMProject
//
//  Created by xa on 15/11/5.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import "CommoditymanagementViewController.h"
#import "AppConfigure.h"
#import "SDRefresh.h"
@interface CommoditymanagementViewController (){
    
    NSMutableArray *arrayTableView;
    NSInteger count;
}
@property (nonatomic, weak) SDRefreshFooterView *refreshFooter;
@property (nonatomic, weak) SDRefreshHeaderView *refreshHeader;
@end

@implementation CommoditymanagementViewController

#pragma mark -- 添加后商品管理
- (void)getData:(NSInteger)countNumber{
   
    
    NSString *countString = STRING_FORMAT(@"%ld", countNumber);
    
    //封装参数
    NSDictionary *dict = @{
                           @"pageNo"   :  countString,
                           @"storeId"  :  [COM byStoreId]
                           
                           
                           };
    
    //装成json字符串
    NSString *stringJson = [JSONFunction jsonStringWithNSDictionary:dict];
    NSDictionary *jsonDic = @{@"mData" : stringJson};
    
    //拼接链接
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,COMLISTBYCLASSIFY];
    
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:jsonDic UrlStr:url andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {

            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
                NSMutableArray *array = [NSMutableArray array];
                array = responseData[@"result"][@"list"];
                
                [arrayTableView addObjectsFromArray:array];
                NSLog(@"jcdskcm========%@",arrayTableView);
            }
            self.goodsTableView.dataSource = self;
            self.goodsTableView.delegate = self;
            [self.goodsTableView reloadData];
           
        }else {
                
                
            }
      }];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    if (arrayTableView) {
        [arrayTableView removeAllObjects];
    }
}

- (void)viewWillAppear:(BOOL)animated {

    [self getData:count];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBackBarButton];
    self.title = @"商品管理";
    [self setupHeader];
    [self setupFooter];
    arrayTableView = [NSMutableArray array];
    [self.goodsTableView registerNib:[UINib nibWithNibName:@"CommoditymanagementTableViewCell" bundle:nil] forCellReuseIdentifier:@"goodsCell"];
    count = 1;
    UIBarButtonItem *rightbarbut = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"iconfont-jiahao-1"] style:UIBarButtonItemStyleDone target:self action:@selector(addGoods:)];
    self.navigationItem.rightBarButtonItem = rightbarbut;
    // Do any additional setup after loading the view from its nib.
}




- (void)setupHeader
{
    SDRefreshHeaderView *refreshHeader = [SDRefreshHeaderView refreshView];
    
    // 默认是在navigationController环境下，如果不是在此环境下，请设置 refreshHeader.isEffectedByNavigationController = NO;
    [refreshHeader addToScrollView:self.goodsTableView];
    
    __weak SDRefreshHeaderView *weakRefreshHeader = refreshHeader;
    __weak typeof(self) weakSelf = self;
    refreshHeader.beginRefreshingOperation = ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            count = 1;
            if (arrayTableView) {
                [arrayTableView removeAllObjects];
            }
            //请求新的数据 重新刷新表格 每次在刷新之前移除array
            [self getData:count];
            [weakSelf.goodsTableView reloadData];
            [weakRefreshHeader endRefreshing];
        });
    };
    
    // 进入页面自动加载一次数据
    [weakRefreshHeader autoRefreshWhenViewDidAppear];
}

- (void)setupFooter
{
    SDRefreshFooterView *refreshFooter = [SDRefreshFooterView refreshView];
    [refreshFooter addToScrollView:self.goodsTableView];
    [refreshFooter addTarget:self refreshAction:@selector(footerRefresh)];
    _refreshFooter = refreshFooter;
}


- (void)footerRefresh
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //self.totalRowCount += 2;
        count++;
        [self getData:count];
        
        [self.goodsTableView reloadData];
        [self.refreshFooter endRefreshing];
    });
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrayTableView.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *rouse = @"goodsCell";
    CommoditymanagementTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rouse];
   
    
    cell.goodsName.text = arrayTableView[indexPath.row][@"comName"];
    cell.goodsPice.text = arrayTableView[indexPath.row][@"comPrice"];
    NSString *strClass = [NSString stringWithFormat:@"(%@)",arrayTableView[indexPath.row][@"claName"]];
    cell.classificationlable.text = strClass;
    cell.descriptionlable.text = arrayTableView[indexPath.row][@"comDescribe"];
[cell.goodsImage setImageWithURL:[NSURL URLWithString:arrayTableView[indexPath.row][@"logoUrl"]]];
    
    NSString *imagestr = arrayTableView[indexPath.row][@"logoUrl"];
    if(imagestr.length == 0){
        
        cell.goodsImage.image = [UIImage imageNamed:@"water.jpg"];
    }else{
        
        
        NSString *urlimage = [NSString stringWithFormat:@"%@%@",kSERVER_GOODS_IMAGE,imagestr];
        [cell.goodsImage setImageWithURL:[NSURL URLWithString:urlimage]];
        
    }
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [arrayTableView removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
        
    }else if (editingStyle == UITableViewCellEditingStyleInsert) {
       
    
    }
    
    
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";


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

- (IBAction)addGoods:(UIBarButtonItem *)sender {
[self.navigationController pushViewController:[[AddCommodityViewController alloc]init]  animated:YES];
    
}
@end
