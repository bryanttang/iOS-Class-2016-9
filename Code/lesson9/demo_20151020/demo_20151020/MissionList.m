//
//  MissionList.m
//  demo_20151020
//
//  Created by bryant on 20/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import "MissionList.h"
#import "MissionCell.h"

@interface MissionList ()

@end

@implementation MissionList

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    [self downloadJSON];
    
    
}

- (void)downloadJSON{
    
    NSURL *url_json = [NSURL URLWithString:@"http://52.6.19.49/mission_cpttm/mission.php"];
    
    NSData *data_json = [NSData dataWithContentsOfURL:url_json
                                              options:NSDataReadingUncached error:nil];
    
    NSJSONSerialization *json = [NSJSONSerialization JSONObjectWithData:data_json
                                                                options:NSJSONReadingAllowFragments error:nil];
    NSDictionary * mission_data = (NSDictionary*)json;
    
    missions = [mission_data objectForKey:@"data"];
    
//    NSLog(@"%@",mission_data);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return missions.count;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MissionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mission" forIndexPath:indexPath];
    
    
    NSDictionary *mission = [missions objectAtIndex:indexPath.row];
    
    
    cell.name.text = [mission objectForKey:@"name"];
    cell.desp.text = [mission objectForKey:@"description"];
    [cell setupImage:[mission objectForKey:@"img"]];
    

    
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
