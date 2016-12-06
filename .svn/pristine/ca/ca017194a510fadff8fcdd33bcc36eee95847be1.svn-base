//
//  SetupViewController.m
//  BMProject
//
//  Created by xa on 15/11/10.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import "SetupViewController.h"
#import "AppConfigure.h"
#import "InfoVC.h"
#import "CodeVC.h"
@interface SetupViewController ()

@end

@implementation SetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackBarButton];
    self.title = @"设置";
    self.setupView.layer.borderWidth = 0.5;
    self.setupView.layer.borderColor = [[UIColor grayColor] CGColor];
    
    self.setupTableView.dataSource = self;
    self.setupTableView.delegate = self;
    self.setupTableView.scrollEnabled =NO;
    self.arrayName = @[@"关于我们", @"我的二维码"];
    // Do any additional setup after loading the view from its nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayName.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *rouse = @"SetupCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rouse];
    if(cell == nil){
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:rouse];
    }
//    NSString *imageName = [NSString stringWithFormat:@"设置%li",indexPath.row];
    
//    cell.imageView.image = [UIImage imageNamed:imageName];
    cell.textLabel.text = self.arrayName[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if(indexPath.row == 0){
    cell.detailTextLabel.text = @"V 1.0.0版";
        
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger row = indexPath.row;
    
    switch (row) {
        case 0:
            
            break;
            
        case 1:
             [self.navigationController pushViewController:[[CodeVC alloc] init] animated:YES];
            break;
            
        case 2:
            
           
            
            break;
            
        default:
            break;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
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

- (IBAction)exitaccountButton:(id)sender {
    
    [IanAlert confirmWithTitle:@"是否退出登录" message:nil yes:@"确定" actionYes:^{
        [COM saveUserName:@""];
        [COM saveStoreId:@""];
        
        ITOAST_ALERT(@"注销成功");
//        _exitaccountBut.enabled = NO;
//        _exitaccountBut.backgroundColor = [UIColor grayColor];
        
        [self backHome:nil];

    } andno:@"取消" actionNo:^{
        
    }];
    
   }
@end
