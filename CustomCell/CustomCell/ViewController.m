//
//  ViewController.m
//  CustomCell
//
//  Created by 张栋枭 on 2018/4/9.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"

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
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customcell" forIndexPath:indexPath];
    
    NSInteger idx = [indexPath row];
    
    NSDictionary *tmpDict = self.listItem[idx];
    
    NSString *imgSuffix = [[NSString alloc] initWithFormat:@"%@.png", tmpDict[@"image"]];
    
    cell.cellImg.image = [UIImage imageNamed:imgSuffix];
    cell.cellLabel.text = tmpDict[@"name"];
    
    cell.cellLabel.adjustsFontSizeToFitWidth = TRUE;
    [cell.cellImg sizeToFit];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}

@end
