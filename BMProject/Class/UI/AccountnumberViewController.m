//
//  AccountnumberViewController.m
//  BMProject
//
//  Created by xa on 15/11/7.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import "AccountnumberViewController.h"

@interface AccountnumberViewController ()

@end

@implementation AccountnumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self setBackBarButton];
    self.title = @"修改昵称";
    self.nicknameView.backgroundColor = RGBACOLOR(249,249,249,1);
    UITapGestureRecognizer *gesrecog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TextTapGes:)];
    gesrecog.cancelsTouchesInView = NO;
    [self.view  addGestureRecognizer:gesrecog];
     self.modifynicknameTextfild.clearButtonMode = UITextFieldViewModeWhileEditing;

    
    // Do any additional setup after loading the view from its nib.
}
- (void)TextTapGes:(UIGestureRecognizer *)sender{
    [self.view endEditing:YES];
    
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

- (IBAction)preservationBut:(id)sender {
    
//    [self showSuccessHud:@"成功"];
    Ian_Alert(@"成功");
    //[self.navigationController popViewControllerAnimated:YES];
    
}
@end
