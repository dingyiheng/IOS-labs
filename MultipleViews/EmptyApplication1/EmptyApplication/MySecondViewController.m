//
//  MySecondViewController.m
//  EmptyApplication
//
//  Created by Yiheng Ding on 7/3/15.
//  Copyright (c) 2015 StudentName. All rights reserved.
//

#import "MySecondViewController.h"

@interface MySecondViewController ()

@end

@implementation MySecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myLabel = [[UILabel alloc] init];
    self.myLabel.text = @"WelCome To Tab FUN";
    self.myLabel.frame = CGRectMake(0, 0, 200, 40);
    self.myLabel.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    
    [self.view addSubview:self.myLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
