//
//  ViewController.m
//  MoveCell
//
//  Created by 张栋枭 on 2018/4/28.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) NSMutableArray *listIterm;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.editButtonItem.title = @"编辑";
    self.navigationController.title = @"单元格";
    
    self.textField.hidden = TRUE;
    self.textField.delegate = self;
    
    self.listIterm = [[NSMutableArray alloc] initWithObjects:@"合肥", @"安庆", @"蚌埠", nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listIterm count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"NS cellForRowAtIndexPath ");
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifler" forIndexPath:indexPath];
    
    NSLog(@"self.listIterm.count = %ld, indexPath.row = %ld", self.listIterm.count, indexPath.row);
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.listIterm[indexPath.row];
    
    return cell;
    
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    NSArray *indexData = [NSArray arrayWithObject:indexPath];
//
//    if(editingStyle == UITableViewCellEditingStyleInsert){
//        [self.listIterm insertObject:self.textField.text atIndex:indexPath.row];
//        [self.tableView insertRowsAtIndexPaths:indexData withRowAnimation:UITableViewRowAnimationFade];
//    }else if(editingStyle == UITableViewCellEditingStyleDelete){
//        [self.listIterm removeObjectAtIndex:indexPath.row];
//        [self.tableView deleteRowsAtIndexPaths:indexData withRowAnimation:UITableViewRowAnimationFade];
//    }
//
//    [self.tableView reloadData];
//}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
//    if(self.listIterm.count == indexPath.row){
//        return FALSE;
//    }else{
        return TRUE;
//    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    NSString *strMoveCity = self.listIterm[sourceIndexPath.row];
    
    [self.listIterm removeObjectAtIndex:sourceIndexPath.row];
    [self.listIterm insertObject:strMoveCity atIndex:destinationIndexPath.row];
    
}

//- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
//
//    [super setEditing:editing animated:animated];
//
//    if(editing){
//        self.textField.hidden = FALSE;
//    }else{
//        self.textField.hidden = TRUE;
//    }
//
//}

//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    if(indexPath.row == self.listIterm.count){
//        return UITableViewCellEditingStyleInsert;
//    }else{
//        return UITableViewCellEditingStyleNone;
//    }
//
//}






@end
