//
//  ViewController.m
//  SearchBar
//
//  Created by 张栋枭 on 2018/4/11.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UISearchBarDelegate,UISearchResultsUpdating>
@property (strong, nonatomic) NSArray *listItem;
@property (strong, nonatomic) NSMutableArray *listFilerItem;
@property (strong, nonatomic) UISearchController *searchController;

- (void)filterContentWithSearchText:(NSString *)content scope:(NSInteger)scope;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"team" ofType:@"plist"];
    self.listItem = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    [self filterContentWithSearchText:@"" scope:-1];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = FALSE;
    
    self.searchController.searchBar.scopeButtonTitles = @[@"中文",@"英文"];
    self.searchController.searchBar.delegate = self;
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    [self.searchController.searchBar sizeToFit];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listItem count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    NSInteger idx = [indexPath row];
    NSDictionary *tmpDict = self.listFilerItem[idx];
    
    cell.textLabel.text = tmpDict[@"name"];
    cell.detailTextLabel.text = tmpDict[@"image"];
    NSString *imgSuffix = [[NSString alloc] initWithFormat:@"%@.png", tmpDict[@"image"]];
    cell.imageView.image = [UIImage imageNamed:imgSuffix];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)filterContentWithSearchText:(NSString *)content scope:(NSInteger)scope{
    
    if([content length]==0){
        self.listFilerItem = [NSMutableArray arrayWithArray:self.listItem];
        return;
    }
    
    NSPredicate *searchPred;
    NSArray *tmpArray;
    
    switch (scope) {
        case 0:
            
            searchPred = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@", content];
            tmpArray = [self.listItem filteredArrayUsingPredicate:searchPred];
            self.listFilerItem = [NSMutableArray arrayWithArray:tmpArray];
            
            break;
        case 1:
            
            searchPred = [NSPredicate predicateWithFormat:@"SELF.image contains[c] %@", content];
            tmpArray = [self.listItem filteredArrayUsingPredicate:searchPred];
            self.listFilerItem = [NSMutableArray arrayWithArray:tmpArray];
            
            break;
        default:
            
            self.listFilerItem = [NSMutableArray arrayWithArray:self.listItem];
            break;
    }
    
}

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope{
    NSLog(@"sdfdsfsdf   ");
    [self updateSearchResultsForSearchController:self.searchController];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSLog(@"@@@@@@@@@@");
    NSString *searchContent = searchController.searchBar.text;
    [self filterContentWithSearchText:searchContent scope:searchController.searchBar.selectedScopeButtonIndex];
    [self.tableView reloadData];
}

@end
