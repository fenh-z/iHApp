//
//  ViewController.m
//  ConllectionView
//
//  Created by 张栋枭 on 2018/4/6.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import "ViewController.h"
#import "EvenCollectionViewCell.h"

#define COL_NUM 2

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *events;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"events" ofType:@"plist"];
    
    self.events = [[NSArray alloc] initWithContentsOfFile:plistPath];
//    NSLog(@"events : %@", self.events);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    int cnt = [self.events count] % COL_NUM;
    
    if(cnt == 0){
        return [self.events count] / COL_NUM;
    }else{
        return [self.events count] / COL_NUM +1;
    }
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return COL_NUM;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    EvenCollectionViewCell *eventCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    NSLog(@"!@!@!@!!@!@  indexPath section %ld  indexPath row %ld indexPath.section * COL_NUM %ld", (long)indexPath.section, (long)indexPath.row, indexPath.section * COL_NUM);
    
    NSInteger idx = indexPath.section * COL_NUM + indexPath.row;
    
    NSLog(@"##### idx = %ld", idx);
    
    if([self.events count] <= idx){
        return eventCell;
    }
    
    NSDictionary *eventDict = self.events[idx];
    
    eventCell.cellImg.image = [UIImage imageNamed:eventDict[@"image"]];
    eventCell.cellLabel.text = eventDict[@"name"];
    
    return eventCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *selectedEvent = self.events[indexPath.section * COL_NUM + indexPath.row];
    
    NSLog(@"######  indexPath section %ld  indexPath row %ld indexPath.section * COL_NUM %ld", (long)indexPath.section, (long)indexPath.row, indexPath.section * COL_NUM);
    
    NSLog(@"select event name :%@", selectedEvent[@"name"]);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:selectedEvent[@"name"] message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *nameAction = [UIAlertAction actionWithTitle:selectedEvent[@"name"] style:UIAlertActionStyleDestructive handler:nil];
    
    [alertController addAction:nameAction];
    
    [self presentViewController:alertController animated:TRUE completion:nil];
    
}



@end
