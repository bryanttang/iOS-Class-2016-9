//
//  MyTableViewController.m
//  helloNavigationController
//
//  Created by bryant tang on 4/29/15.
//  Copyright (c) 2015 CPTTM. All rights reserved.
//

#import "MyTableViewController.h"
#import "DetailViewController.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    db = [NSMutableArray new];
    [db addObject:@"James"];
    [db addObject:@"peter"];
    [db addObject:@"Jessie"];
    

    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSInteger row = [[self.tableView indexPathForSelectedRow] row];
    
    row = [self returnRow:row];
    
    
    if ([segue.identifier isEqualToString:@"toview"]) {
        DetailViewController *detail = (DetailViewController*)segue.destinationViewController;
        detail.info = [db objectAtIndex:row];
    }
    

}

-(NSInteger) returnRow:(NSInteger)row{
    return row;
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
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [db count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell ;
    if ([indexPath row] == 0) {
         cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    }
    if ([indexPath row] == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"myCell2" forIndexPath:indexPath];
    }
    if ([indexPath row] == 2) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"myCell3" forIndexPath:indexPath];
    }
   
    
    cell.textLabel.text = [db objectAtIndex:[indexPath row]];
    
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
