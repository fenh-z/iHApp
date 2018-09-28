//
//  ViewController.m
//  SwitchBar
//
//  Created by 张栋枭 on 2018/3/26.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UILabel *sliderValue;
- (IBAction)switchValueChanged:(id)sender;
- (IBAction)touchnDown:(id)sender;
- (IBAction)sliderValueChange:(id)sender;

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


- (IBAction)switchValueChanged:(id)sender {
    
    UISwitch *withSwitch = (UISwitch *)sender;
    
    BOOL settiing = withSwitch.isOn;
    
    if([withSwitch isEqual: self.rightSwitch]){
        NSLog(@"111111");
        [self.leftSwitch setOn:!settiing animated:TRUE];
    }else{
        NSLog(@"222222");
        [self.rightSwitch setOn:!settiing animated:TRUE];
    }
    
}

- (IBAction)touchnDown:(id)sender {
    
    UISegmentedControl *segmentContol = (UISegmentedControl *)sender;
    NSLog(@"you click %li", segmentContol.selectedSegmentIndex);
    
    if(self.leftSwitch.hidden){
        self.leftSwitch.hidden = FALSE;
        self.rightSwitch.hidden = FALSE;
    } else {
        self.leftSwitch.hidden = TRUE;
        self.rightSwitch.hidden = TRUE;
    }
    
}

- (IBAction)sliderValueChange:(id)sender {
    UISlider *slider = (UISlider *)sender;
    
    int processValue = (int)slider.value;
    
    NSString *sliderValeText = [[NSString alloc] initWithFormat:@"%d", processValue];
    
    self.sliderValue.text = sliderValeText;
}
@end
