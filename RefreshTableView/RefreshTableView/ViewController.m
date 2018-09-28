//
//  ViewController.m
//  RefreshTableView
//
//  Created by 张栋枭 on 2018/4/28.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *log;
@property (strong, nonatomic) UITextView *text;

@end

@implementation ViewController

/**
 sdfsdf
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.log = [[NSMutableArray alloc] init];
    NSDate *date = [[NSDate alloc] init];
    
    [self.log addObject:date];
    
    UIRefreshControl *ur = [[UIRefreshControl alloc] init];
    ur.attributedTitle = [[NSMutableAttributedString alloc] initWithString:@"refresh....."];
    
    [ur addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
    
    self.refreshControl = ur;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.log count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-mm-dd HH:mm:ss zzz"];
    
    cell.textLabel.text = [dateFormatter stringFromDate:self.log[indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}

- (void)refreshData{
    
    if(self.refreshControl.refreshing){
        self.refreshControl.attributedTitle = [[NSMutableAttributedString alloc] initWithString:@"refreshing"];
        
        NSDate *date = [[NSDate alloc] init];
        [self.log addObject:date];
        
        [self.refreshControl endRefreshing];
        
        self.refreshControl.attributedTitle = [[NSMutableAttributedString alloc] initWithString:@"refresh....."];
        
        [self.tableView reloadData];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
