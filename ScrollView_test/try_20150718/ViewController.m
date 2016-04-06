//
//  ViewController.m
//  try_20150718
//
//  Created by Yiheng Ding on 7/18/15.
//  Copyright (c) 2015 Yiheng Ding. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIScrollView* scrollView;
    UIImageView* imageView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MK.jpg"]];
    NSLog(@"%f",imageView.frame.size.width);
    [scrollView addSubview:imageView];
    scrollView.contentSize = imageView.frame.size;
    scrollView.delegate = self;
    scrollView.maximumZoomScale = 2000.0f;
    scrollView.minimumZoomScale = 0.01f;
    
    
    [self.view addSubview:scrollView];

}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"you are scrolling me!");
}

- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView{
    NSLog(@"you are zooming!");
    return imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
