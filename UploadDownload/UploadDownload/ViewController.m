//
//  ViewController.m
//  UploadDownload
//
//  Created by 张栋枭 on 2018/3/30.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activtyIndicatorView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (strong, nonatomic) NSTimer *timer;

- (IBAction)start2Move:(id)sender;
- (IBAction)downloadProgress:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.progressView setHidden:TRUE];
    self.progressView.progress = 0;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)start2Move:(id)sender {
    
    if([self.activtyIndicatorView isAnimating]){
        [self.activtyIndicatorView stopAnimating];
    }else{
        [self.activtyIndicatorView startAnimating];
    }
    
}

- (IBAction)downloadProgress:(id)sender {
    
    if([self.progressView isHidden]){
        [self.progressView setHidden:FALSE];
    }
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(download) userInfo:nil repeats:YES];
}

- (void)download {
    self.progressView.progress = self.progressView.progress+0.1;
    
    if(self.progressView.progress == 1){
        [self.timer invalidate];
        
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"download complete" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [self.progressView setHidden:TRUE];
        }];
    
        [alertView addAction:okAction];
        
        [self presentViewController:alertView animated:TRUE completion:nil];
        
    }
    
}

@end
