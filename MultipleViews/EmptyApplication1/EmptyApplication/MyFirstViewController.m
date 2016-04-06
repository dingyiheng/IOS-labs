//
//  MyFirstViewController.m
//  EmptyApplication
//
//  Created by Yiheng Ding on 7/3/15.
//  Copyright (c) 2015 StudentName. All rights reserved.
//

#import "MyFirstViewController.h"
#import "MyFirstTabBarController.h"

@interface MyFirstViewController (){
    UIButton* nextPageButton;
}

@property int current;

@end

@implementation MyFirstViewController
@synthesize current = _current;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem* nextPage = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleBordered target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem = nextPage;
    NSString* currentScreen = @"Current Screen is ";
    NSString* currentNum = [NSString stringWithFormat:@"%d",self.current];
    self.title = [currentScreen stringByAppendingString:currentNum];
    [self.navigationItem setTitle:self.title];
    
    
    
    nextPageButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [nextPageButton setTitle:@"Next page" forState:UIControlStateNormal];
    [nextPageButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    nextPageButton.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    [nextPageButton addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    nextPageButton.clipsToBounds = YES;
    nextPageButton.layer.cornerRadius = 50.0f;
    nextPageButton.layer.borderWidth = 20.0f;
    nextPageButton.layer.borderColor = [UIColor blueColor].CGColor;
    nextPageButton.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:nextPageButton];
    
    /*
    self.myLabel = [[UILabel alloc] init];
    self.myLabel.text = [NSString stringWithFormat:@"%d",self.current];
    self.myLabel.frame = CGRectMake(0, 0, 200, 40);
    self.myLabel.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    
    [self.view addSubview:self.myLabel];
     */
    
   
}

- (int) current{
    
    return _current;
}

- (void) setCurrent:(int)num{
    _current = num;
}

- (void)next:(id)sender {
    
    MyFirstViewController* next = [[MyFirstViewController alloc] init];
    [next setCurrent:self.current+1];
    NSString* back = @"back to ";
    NSString* temp = [NSString stringWithFormat:@"%d",self.current];
    UIBarButtonItem* backButton = [[UIBarButtonItem alloc] initWithTitle:
                                   [back stringByAppendingString:temp] style:UIBarButtonItemStyleBordered target:nil action:nil];

    self.navigationItem.backBarButtonItem = backButton;
    //self.navigationItem.backBarButtonItem.title = @"11111";
    //self.navigationItem.backBarButtonItem.title = @"back";
    [self.navigationController pushViewController:next animated:NO
     ];
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
