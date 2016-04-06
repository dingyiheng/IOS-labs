//
//  MyFirstTableViewController.m
//  EmptyApplication
//
//  Created by Yiheng Ding on 7/3/15.
//  Copyright (c) 2015 StudentName. All rights reserved.
//

#import "MyFirstTableViewController.h"
#import "AFNetworking.h"
#import "ViewController.h"

@interface MyFirstTableViewController ()
@property (strong,nonatomic) NSArray *googlePlacesArrayFromAFNetworking;
@property (strong,nonatomic) NSArray *finishedGooglePlacesArray;
@end

@implementation MyFirstTableViewController
{
    NSArray* myPeople;
    NSArray* myPeopleGender;
    NSArray* picName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeRestaurantRequests];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    myPeople = @[@"Wu Lei", @"Wan Ren", @"Ding yiheng"];
    myPeopleGender = @[@"HeHe",@"Female",@"Male"];
    picName = @[@"wu.jpg",@"wan.jpg",@"ding.jpg"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
-(void)makeRestuarantRequests
{
    NSURL *url = [NSURL URLWithString:@"https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+sydney&amp;sensor=false&amp;key=AIzaSyA3iUnS0Ft33ZXRlKUArXfQNnFRrL8fRsM"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //AFNetworking asynchronous url request
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFHTTPResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation,id responseObject){
        
        self.googlePlacesArrayFromAFNetworking = [responseObject objectForKey:@"results"];
        NSLog(@"The Array: %@",self.googlePlacesArrayFromAFNetworking);
        [self.tableView reloadData];
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Request Failed: %@, %@", error, error.userInfo);
        
    }];
    
    [operation start];
}
*/
-(void)makeRestaurantRequests
{
    NSURL *url = [NSURL URLWithString:@"https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+sydney&sensor=false&key=AIzaSyDfdpFcPFSr-0lTaxsyia84VU0VAsgEt1c"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //AFNetworking asynchronous url request
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.googlePlacesArrayFromAFNetworking = [responseObject objectForKey:@"results"];
        
        NSLog(@"The Array: %@",self.googlePlacesArrayFromAFNetworking);
        
        [self.tableView reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Request Failed: %@, %@", error, error.userInfo);
        
    }];
    
    [operation start];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.googlePlacesArrayFromAFNetworking count];
}


- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /*
    static NSString *CellIdentifier = @"PeopleCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    if (cell == nil) {
        // if you want to display the detail text label, use Uitableviewcellstylesubtitle value1 or value2
        // but not uitableviewcellstyledefault
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [myPeople objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [myPeopleGender objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[picName objectAtIndex:indexPath.row]];
    
    [cell setNeedsLayout];
    
    return cell;
     */
    
    static NSString *CellIdentifier = @"Cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
    
    NSDictionary *tempDictionary = [self.googlePlacesArrayFromAFNetworking objectAtIndex:indexPath.row];
    cell.textLabel.text = [tempDictionary objectForKey:@"name"];
    
    if ([tempDictionary objectForKey:@"rating"] != NULL) {
        cell.detailTextLabel.text= [NSString stringWithFormat:@"Rating: %@ of 5", [tempDictionary objectForKey:@"rating"]];
    }
    else{
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Not Rated"];
    }
    
    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    ViewController *detailViewController = (ViewController *)segue.destinationViewController;
    detailViewController.restaurantDetail = [self.googlePlacesArrayFromAFNetworking objectAtIndex:indexPath.row];
}
*/

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[self performSegueWithIdentifier:@"" sender:self];
    //ViewController *detailViewController = [[ViewController alloc] init];
    ViewController *detailViewController = [[ViewController alloc] init];
    detailViewController.restaurantDetail = [self.googlePlacesArrayFromAFNetworking objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}


@end
