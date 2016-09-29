//
//  MissionTableViewController.m
//  DemoGoogleMapSDK
//
//  Created by bryant on 13/8/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import "MissionTableViewController.h"
#import "MissionListCell.h"
#import "MissionDetailViewController.h"
#import "PlistManager.h"

@interface MissionTableViewController ()

@end

@implementation MissionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadMission];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    //

}


- (void)loadMission{
    
    NSError *error;
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/cpttm/mission.php"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSJSONSerialization *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    
    NSDictionary *data_dis = (NSDictionary*)json;
    missions = [data_dis objectForKey:@"data"];
    [self.tableView reloadData];
    
    NSLog(@"%@", missions);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return missions.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MissionListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"missioncell" forIndexPath:indexPath];
    
    [cell setup];
    
    
    //####  Method 1: Directly load   #####
//    NSURL *img_url = [NSURL URLWithString:[[missions objectAtIndex:indexPath.row] objectForKey:@"img"]];
//    NSData *img_data = [NSData dataWithContentsOfURL:img_url];
//    UIImage *img = [UIImage imageWithData:img_data];
//    [cell.image setImage:img];

    //##########
    
    //########## Method 2 :Do it on other thread

    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.frame = CGRectMake(35, 15, 30, 30);
//    indicator.center = cell.image.center;
    [cell addSubview:indicator];
    [indicator startAnimating];
    
    dispatch_queue_t processQueue_2 = dispatch_queue_create("PROCESS_QUEUE", NULL);
    dispatch_async(processQueue_2, ^{
        
        NSURL *img_url = [NSURL URLWithString:[[missions objectAtIndex:indexPath.row] objectForKey:@"img"]];
        NSData *img_data = [NSData dataWithContentsOfURL:img_url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (img_data != nil) {
                UIImage *img = [UIImage imageWithData:img_data];
                [cell.image setImage:img];
                
                [indicator stopAnimating];
                indicator.hidden = YES;
                [indicator removeFromSuperview];
            }
        });
    });
    //############
    
    
    NSMutableDictionary *complete = [NSMutableDictionary dictionaryWithDictionary:[PlistManager readPlist:@"complete"]];
    
    
    
    if (complete != nil) {
        NSString *key = [[missions objectAtIndex:indexPath.row] objectForKey:@"id"];
        if ([[complete objectForKey:key] isEqualToString:@"1"]) {
            [cell.status setImage:[UIImage imageNamed:@"complete"]];
        }else{
            [cell.status setImage:[UIImage imageNamed:@"incomplete"]];
        }
    }else{
        [cell.status setImage:[UIImage imageNamed:@"incomplete"]];
    }
    
    
    
    cell.name.text = [[missions objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"missionDetail"]) {
        
        NSDictionary *mission = [missions objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        
        MissionDetailViewController *detail = (MissionDetailViewController*) segue.destinationViewController;
        detail.bundle = mission;
        
    }
}

@end
