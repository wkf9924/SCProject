//
//  MessageViewController.m
//  BMProject
//
//  Created by xa on 15/11/10.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import "MessageViewController.h"
#import "Masonry.h"
@interface MessageViewController ()
{
    NSMutableArray *array;
}
@property (nonatomic, strong)NSArray *aaa;
@property (nonatomic, strong)UILabel *lable;
@property (nonatomic, strong)UILabel *lable1;
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息";
    [self setBackBarButton];
    
//   _svssegmentCtrl =[[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"未读消息", @"已读消息", nil]];
//   _svssegmentCtrl.backgroundColor = [UIColor clearColor];
//   _svssegmentCtrl.selectedIndex = 0;
//    [_svssegmentCtrl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
//    self.navigationItem.titleView =_svssegmentCtrl ;
//    self.notreadmessagesArray = [NSMutableArray array];
//    self.readmessagesArray = [NSMutableArray array];
    
    [self.messagesTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _aaa = @[];
    [self.notreadmessagesArray addObjectsFromArray:_aaa];
    
    array = [NSMutableArray array];
    NSArray *arrayTemp  = @[@"测试内容！！", @"测试内容！！", @"测试内容！！", @"测试内容！！"];
    [array addObjectsFromArray:arrayTemp];
    
    _messagesTableView.delegate = self;
    _messagesTableView.dataSource = self;
    
    [self.messagesTableView registerNib:[UINib nibWithNibName:@"MessagesTableViewCell" bundle:nil] forCellReuseIdentifier:@"MessagesCell"];
    
    [_messagesTableView reloadData];
}

-(void)establishmessagesTableView{
    for(int i = 0;i< 2;i++){
    self.messagesTableView.delegate = self;
    self.messagesTableView.dataSource = self;
   [self.messagesTableView registerNib:[UINib nibWithNibName:@"MessagesTableViewCell" bundle:nil] forCellReuseIdentifier:@"MessagesCell"];
       
    } 
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return array.count;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}
//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    if(tableView.tag == 0){
//        return _notreadmessagesArray.count;
//        
//    }
//    return _readmessagesArray.count;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger row = indexPath.row;
    static NSString *rouse = @"MessagesCell";
    MessagesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rouse];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.lbCount.text = array[row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self tableView:_messagesTableView cellForRowAtIndexPath:indexPath];
   
    return cell.frame.size.height;
    
}
-(void)notreadmessagesLabel{
    __weak typeof(self) weakSelf = self;
    _lable = [[UILabel alloc]init];
//    _lable.text = @"暂时没有未读消息";
    _lable.textColor = [UIColor blackColor];
    _lable.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_lable];
    [_lable mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(weakSelf.view.mas_centerY);
        make.centerX.equalTo(weakSelf.view.mas_centerX);
    }];
}
-(void)readmessagesLabel{
    __weak typeof(self) weakSelf = self;
    _lable1 = [[UILabel alloc]init];
//    _lable1.text = @"你暂时没有读过消息";
    _lable1.textColor = [UIColor blackColor];
    _lable1.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_lable1];
    [_lable1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(weakSelf.view.mas_centerY);
        make.centerX.equalTo(weakSelf.view.mas_centerX);
    }];
}

-(void)segmentedControlChangedValue:(SVSegmentedControl *)sender{
   self.messagesTableView.tag =  _svssegmentCtrl.selectedIndex ;
   
    if( _svssegmentCtrl.selectedIndex == 0){
        if(self.notreadmessagesArray.count == 0){
            [self.lable1 removeFromSuperview];
            [self notreadmessagesLabel];
            
        }else{
          [self establishmessagesTableView];
            
        }
        
       
    }else{
        
        
        if(self.readmessagesArray.count == 0){
            
            [self.lable removeFromSuperview];
            [self readmessagesLabel];
            
        }else{
            [self establishmessagesTableView];
            
        }
  
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

- (IBAction)Notreadmessagesbutton:(id)sender {
}

- (IBAction)ReadmessagesButton:(id)sender {
}
@end
