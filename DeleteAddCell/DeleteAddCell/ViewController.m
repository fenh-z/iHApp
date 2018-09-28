//
//  ViewController.m
//  DeleteAddCell
//
//  Created by 张栋枭 on 2018/4/24.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *txtField;
@property (strong, nonatomic) NSMutableArray *listItems;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.editButtonItem setTitle:@"编辑"];
    
    self.txtField.hidden = TRUE;
    self.txtField.delegate = self;
    
    self.listItems = [[NSMutableArray alloc] initWithObjects:@"合肥", @"安庆", nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listItems count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"@@@@@@@");
    
    static NSString *cellID = @"cellIdentifier";
    
    BOOL b_addCell = (indexPath.row == self.listItems.count);
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    if(!b_addCell){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = self.listItems[indexPath.row];
    }else{
        self.txtField.frame = CGRectMake(40, 0, 300, cell.frame.size.height);
        self.txtField.borderStyle = UITextBorderStyleNone;
        self.txtField.placeholder = @"添加...";
        self.txtField.text = @"";
        [cell addSubview:self.txtField];
    }
    return cell;
}



- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"@@@@  indexPath.row = %ld self.listItems count = %ld", indexPath.row, [self.listItems count]);
    if(indexPath.row == [self.listItems count]){
        return UITableViewCellEditingStyleInsert;
    }else{
        return UITableViewCellEditingStyleDelete;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    
    NSLog(@"#####111  indexPaths = %@",indexPaths);
    NSLog(@"#####222  indexPath = %@",indexPath);
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
        [self.listItems removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }else if(editingStyle == UITableViewCellEditingStyleInsert){
        [self.listItems insertObject:self.txtField.text atIndex:[self.listItems count]];
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }
    
    [self.tableView reloadData];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    
    NSLog(@"begin editing ");
    
    [super setEditing:editing animated:animated];
    
    if(editing){
        self.txtField.hidden = FALSE;
    }else{
        self.txtField.hidden = TRUE;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
