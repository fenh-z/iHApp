//
//  CustomTableViewCell.h
//  CustomCell
//
//  Created by 张栋枭 on 2018/4/9.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cellImg;

@end
