//
//  ViewController.m
//  RootTableView
//
//  Created by 张栋枭 on 2018/4/9.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray *listItem;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"team" ofType:@"plist"];
    
    self.listItem = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listItem count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    NSInteger idx = [indexPath row];
    
    NSDictionary *tmDict = self.listItem[idx];
    
    NSString *imgSuffix = [[NSString alloc] initWithFormat:@"%@.png", tmDict[@"image"]];
    
    cell.imageView.image = [UIImage imageNamed:imgSuffix];
    cell.textLabel.text = tmDict[@"name"];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
    
}


@end
