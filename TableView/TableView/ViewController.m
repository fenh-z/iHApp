//
//  ViewController.m
//  TableView
//
//  Created by 张栋枭 on 2018/4/8.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *listItem;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plist = [bundle pathForResource:@"team" ofType:@"plist"];
    self.listItem = [[NSArray alloc] initWithContentsOfFile:plist];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listItem count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *tableCell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    NSInteger idx = [indexPath row];
    
    NSDictionary *rowTmpDict = self.listItem[idx];
    
    NSString *imgSuffix = [[NSString alloc] initWithFormat:@"%@.png", rowTmpDict[@"image"]];
    
    tableCell.imageView.image = [UIImage imageNamed:imgSuffix];
    tableCell.textLabel.text = rowTmpDict[@"name"];
    
    tableCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return tableCell;
    
}

@end
