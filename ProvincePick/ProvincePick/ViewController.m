//
//  ViewController.m
//  ProvincePick
//
//  Created by 张栋枭 on 2018/4/5.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *provincePick;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (strong, nonatomic) NSDictionary *pickData;
@property (strong, nonatomic) NSArray *pickProvinceData;
@property (strong, nonatomic) NSArray *pickCityData;

- (IBAction)onclick:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *provincePlistPath = [bundle pathForResource:@"provinces_cities" ofType:@"plist"];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:provincePlistPath];
    self.pickData = dict;
    
    self.pickProvinceData = [dict allKeys];
    
    //默认区第一个省份
    NSString *selectedProvince = [self.pickProvinceData objectAtIndex:0];
    self.pickCityData = [self.pickData objectForKey:selectedProvince];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 0){
        return [self.pickProvinceData count];
    }else{
        return [self.pickCityData count];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 0){
        return [self.pickProvinceData objectAtIndex:row];
    }else{
        return [self.pickCityData objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component == 0){
        NSString *selectedProvince = [self.pickProvinceData objectAtIndex:row];
        NSArray *arrayTmp = [self.pickData objectForKey:selectedProvince];
        self.pickCityData = arrayTmp;
        [self.provincePick reloadComponent:1];
    }
}

- (IBAction)onclick:(id)sender {
    
    NSInteger row1 = [self.provincePick selectedRowInComponent:0];
    NSInteger row2 = [self.provincePick selectedRowInComponent:1];
    
    NSString *selectedProvince = [self.pickProvinceData objectAtIndex:row1];
    NSString *selectedCity = [self.pickCityData objectAtIndex:row2];
    
    NSString *title = [[NSString alloc] initWithFormat:@"%@ %@市", selectedProvince, selectedCity];
    
    self.label.text = title;
    
}
@end
