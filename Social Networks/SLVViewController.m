//
//  SLVViewController.m
//  Social Networks
//
//  Created by Ostap R on 14.08.14.
//  Copyright (c) 2014 SoftServe Lv-120. All rights reserved.
//

#import "SLVViewController.h"
#import "SLVDBManager.h"


@interface SLVTableViewController ()

@property(nonatomic) NSArray * arrOfServices;

@end

@implementation SLVTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
//#pragma mark - UITableView Configuration
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [[[SLVDBManager sharedManager] getServices] count];
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
//    
//    
//    NSString *serviceName = ((Services *)self.arrOfServices[indexPath.row]).type ;
//    cell.textLabel.text =serviceName;
//    
//    return cell;
//}
//
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    
////    pinItem * item=self.managedObjs[indexPath.row];
////    NSDictionary *dic =[[NSDictionary alloc] initWithObjectsAndKeys:item, @"managedObj", nil];
////    
////    [[NSNotificationCenter defaultCenter] postNotificationName:@"navigation"
////                                                        object:self
////                                                      userInfo:dic];
//}




@end
