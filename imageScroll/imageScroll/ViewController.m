//
//  ViewController.m
//  imageScroll
//
//  Created by 张栋枭 on 2018/6/24.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import "ViewController.h"
#define imageCnt 5

@interface ViewController () <UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView *scrollview;
@end



@implementation ViewController

- (UIScrollView *)scrollview{
    
    if(_scrollview == nil){
        
        _scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 130)];
        _scrollview.backgroundColor = [UIColor redColor];
        
        [self.view addSubview:_scrollview];
        
        // 取消弹簧效果
        _scrollview.bounces = NO;
        
        // 取消水平滚动条
        _scrollview.showsHorizontalScrollIndicator = NO;
        _scrollview.showsVerticalScrollIndicator = NO;
        
        // 要分页
        _scrollview.pagingEnabled = YES;
        
        // contentSize
        _scrollview.contentSize = CGSizeMake(imageCnt * _scrollview.bounds.size.width, 0);
        
        // 设置代理
        _scrollview.delegate = self;
        
    } 
    
    return _scrollview;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    for (int i = 1; i<imageCnt; i++) {
        
        NSString *imageName = [NSString stringWithFormat:@"img_%02d", i+1];
        UIImage *image = [UIImage imageNamed:imageName];
        
        CGSize size = image.size;
        
//        int sufiix = self.scrollview.bounds.size.width/size.width;
//
//        CGSize finalSize = CGSizeMake(image.size.width*sufiix, image.size.height);
        
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.scrollview.bounds];
        imageView.image = image;
        
        imageView.sizeToFit;
        
        NSLog(@"%@", image);
        
        
        [self.scrollview addSubview:imageView];
        
        
    }
    
    [self.scrollview.subviews enumerateObjectsUsingBlock:^(__kindof UIImageView *imgView, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGRect frame = imgView.frame;
        frame.origin.x = idx * frame.size.width;
        
        imgView.frame = frame;
        
    } ];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
