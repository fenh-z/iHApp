//
//  RootViewController.m
//  AlertView
//
//  Created by 张栋枭 on 2018/3/30.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    UIButton *alertBtnview = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [alertBtnview setTitle:@"ALERT VIEW" forState:UIControlStateNormal];
    
    CGFloat btnAlertViewWidth = 100;
    CGFloat btnAlertViewHeight = 30;
    CGFloat btnAlertViewTopView = 130;
    
    alertBtnview.frame = CGRectMake((screen.size.width-btnAlertViewWidth)/2, btnAlertViewTopView, btnAlertViewWidth, btnAlertViewHeight);
    
    [alertBtnview addTarget:self action:@selector(actionSheet:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:alertBtnview];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickAlert:(id)sender{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"ALERT VIEW" message:@"This is an alert" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"click no button");
    }];
    
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"click yes button");
    }];
    
    [alertController addAction:yesAction];
    [alertController addAction:noAction];
    
    [self presentViewController:alertController animated:TRUE completion:^{
        NSLog(@"missing complete");
    }];
    
}

- (void)actionSheet:(id)sender{
    
    UIAlertController *alertController = [[UIAlertController alloc] init];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"其他" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"click other");
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"click cancel");
    }];
    
    UIAlertAction *shareAction = [UIAlertAction actionWithTitle:@"Share weibo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"click share weibo");
    }];
    
    [alertController addAction:otherAction];
    [alertController addAction:cancelAction];
    [alertController addAction:shareAction];
    
    [self presentViewController:alertController animated:TRUE completion:nil];
    
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
