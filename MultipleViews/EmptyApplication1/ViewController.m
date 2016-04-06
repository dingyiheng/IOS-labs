//
//  ViewController.m
//  EmptyApplication
//
//  Created by Yiheng Ding on 7/13/15.
//  Copyright (c) 2015 StudentName. All rights reserved.
//

#import "ViewController.h"
//#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "MyFirstTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationItem setTitle:@"details"];
    self.restaurantNameLabel.text = [self.restaurantDetail objectForKey:@"name"];
    [self.restaurantImageView setImageWithURL:[NSURL URLWithString:[self.restaurantDetail objectForKey:@"icon"]]];
    self.restaurantAddressView.text = [self.restaurantDetail objectForKey:@"formatted_address"];
    
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
