//
//  ViewController.h
//  EmptyApplication
//
//  Created by Yiheng Ding on 7/13/15.
//  Copyright (c) 2015 StudentName. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface ViewController : UIViewController

@property (strong,nonatomic) NSDictionary *restaurantDetail;

@property (strong,nonatomic) IBOutlet UILabel *restaurantNameLabel;
@property (strong,nonatomic) IBOutlet UIImageView *restaurantImageView;
@property (strong,nonatomic) IBOutlet UITextView *restaurantAddressView;

@end
