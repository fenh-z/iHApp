//
//  ViewController.m
//  NavigationBar
//
//  Created by 张栋枭 on 2018/4/2.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
- (IBAction)save:(id)sender;
- (IBAction)Add:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label.adjustsFontSizeToFitWidth = YES;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)save:(id)sender {
    self.label.text = @"zhaopj sb";
    self.label.adjustsFontSizeToFitWidth = YES;
}

- (IBAction)Add:(id)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"add zhaopj sh" message:@"r u sure?" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.label.text = @"zhaopj sb";
        self.label.adjustsFontSizeToFitWidth = YES;
    }];
    
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        self.label.text = @"zhaopj big sb";
        self.label.adjustsFontSizeToFitWidth = YES;
    }];
    
    [alertController addAction:yesAction];
    [alertController addAction:noAction];
    
    [self presentViewController:alertController animated:TRUE completion:nil];
    
}
@end
