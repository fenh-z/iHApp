//
//  ViewController.m
//  DatePickCoding
//
//  Created by 张栋枭 on 2018/4/5.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIDatePicker *datePick;
@property (strong, nonatomic) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    //datePick
    CGFloat datepickWidth = 320;
    CGFloat datepickHeight = 167;
    
    self.datePick = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, datepickWidth, datepickHeight)];
    self.datePick.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
    self.datePick.datePickerMode = UIDatePickerModeDateAndTime;
    
    [self.view addSubview: self.datePick];
    
    //label
    CGFloat labelWidth = 200;
    CGFloat labelHeight = 21;
    CGFloat labelTopView = 281;
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake((screen.size.width-labelWidth)/2, labelTopView, labelWidth, labelHeight)];
    self.label.text = @"label";
    self.label.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview: self.label];
    
    UIButton *chgBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    CGFloat chgBtnWidth = 46;
    CGFloat chgBtnHeight = 30;
    CGFloat chgBtnTopView = 379;
    chgBtn.frame = CGRectMake((screen.size.width-chgBtnWidth)/2, chgBtnTopView, chgBtnWidth, chgBtnHeight);
    [chgBtn setTitle:@"BUTTON" forState:UIControlStateNormal];
    [chgBtn addTarget:self action:@selector(onclick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: chgBtn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onclick:(id)sender{
    
    NSDate *date = self.datePick.date;
    NSDateFormatter *datefmt = [[NSDateFormatter alloc] init];
    [datefmt setDateFormat:@"YYYY-MM-DD HH:mm:ss"];
    self.label.text = [datefmt stringFromDate:date];
    
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
