//
//  ViewController.m
//  UploadViewCoding
//
//  Created by 张栋枭 on 2018/4/2.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIProgressView *progressView;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGFloat progressViewWidth = 200;
    CGFloat progressViewHeight = 2;
    CGFloat progressViewTopVView = 283;
    
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake((screen.size.width - progressViewWidth)/2, progressViewTopVView, progressViewWidth, progressViewHeight)];
    
    [self.view addSubview:self.progressView];
    
    [self.progressView setHidden:TRUE];
    
    UIButton *downloadBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [downloadBtn setTitle:@"DOWNLOAD" forState:UIControlStateNormal];
    
    CGFloat downloadBtnWidth = 69;
    CGFloat downloadBtnHeight = 30;
    CGFloat downloadBtnTopView = 384;
    
    downloadBtn.frame = CGRectMake((screen.size.width-downloadBtnWidth)/2, downloadBtnTopView, downloadBtnWidth, downloadBtnHeight);
    
    [downloadBtn addTarget:self action:@selector(downloadProgress:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: downloadBtn];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)downloadProgress:(id)sender{
    
    if([self.progressView isHidden]){
        [self.progressView setHidden:FALSE];
    }
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(download) userInfo:nil repeats:YES];
    
}

- (void)download{
    self.progressView.progress = self.progressView.progress+0.1;
    
    if(self.progressView.progress == 1){
        [self.timer invalidate];
        
        UIAlertController *alertCotrol = [UIAlertController alertControllerWithTitle:@"download complete" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *returnAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [self.progressView setHidden:TRUE];
        }];
        
        [alertCotrol addAction:returnAction];
        
        [self presentViewController:alertCotrol animated:TRUE completion:nil];
        
    }
    
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
