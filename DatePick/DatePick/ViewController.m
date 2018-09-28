//
//  ViewController.m
//  DatePick
//
//  Created by 张栋枭 on 2018/4/3.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *datePickLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickView;
- (IBAction)dataPickToLabel:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)dataPickToLabel:(id)sender {
    
    NSDate *date = self.datePickView.date;
    
    NSDateFormatter *dateFmt = [[NSDateFormatter alloc] init];
    
    [dateFmt setDateFormat:@"YYYY-MM-DD hh:mm:ss"];
    
    self.datePickLabel.text = [dateFmt stringFromDate:date];
    
}
@end
