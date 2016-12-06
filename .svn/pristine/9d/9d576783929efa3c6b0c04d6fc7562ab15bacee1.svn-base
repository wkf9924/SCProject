//
//  InfoVC.m
//  BMProject
//
//  Created by WangKaifeng on 15/12/8.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import "InfoVC.h"

@interface InfoVC ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

- (IBAction)submit:(id)sender;
@end

@implementation InfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"意见反馈";
    [self setBackBarButton];
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

- (IBAction)submit:(id)sender {

    sleep(2);

    ITOAST_ALERT(@"提交成功");
    [self backHome:nil];
}
@end
