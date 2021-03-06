//
//  ViewController.m
//  try_20150719_audioView
//
//  Created by Yiheng Ding on 7/19/15.
//  Copyright (c) 2015 Yiheng Ding. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    float screenWidth;
    float screenHeight;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    screenWidth = [UIScreen mainScreen].bounds.size.width;
    screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    
    
    AudioFactory *af = [[AudioFactory alloc]init];
    AudioView *av = [af createViewWithSettings];
    av.center = CGPointMake(screenWidth/2  , screenHeight/2);
    [self.view addSubview:av];
    
    [av startRecording];
    
    NSLog(@"%@",av.getOutput);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
