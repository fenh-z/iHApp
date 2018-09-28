//
//  ViewController.m
//  ToolsBarCode
//
//  Created by 张栋枭 on 2018/4/2.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGFloat toolsBarHeight = 44;
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, screen.size.height-toolsBarHeight, screen.size.width, toolsBarHeight)];
    
    UIBarButtonItem *saveBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    
    UIBarButtonItem *openBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"Open" style:UIBarButtonItemStylePlain target:self action:@selector(open:)];
    
    UIBarButtonItem *flexibleBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    toolBar.items = @[saveBtnItem, flexibleBtnItem, openBtnItem];
    
//    toolBar.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:toolBar];
    
    CGFloat labelWidth = 84;
    CGFloat labelHeight = 21;
    CGFloat labelTopView = 250;
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake((screen.size.width-labelWidth)/2, labelTopView, labelWidth, labelHeight)];
    
    self.label.adjustsFontSizeToFitWidth = YES;
    
    [self.view addSubview:self.label];
    
   
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

- (void)save:(id)sender{
    self.label.text = @"zhaopj sb";
}

- (void)open:(id)sender{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"zhaopj is sb" message:@"r u sure zhaopj is sb" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.label.text = @"zhapj sb";
    }];
    
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"no" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        self.label.text = @" ";
    }];
    
    [alertController addAction:yesAction];
    [alertController addAction:noAction];
    
    [self presentViewController:alertController animated:TRUE completion:nil];
    
}

@end
