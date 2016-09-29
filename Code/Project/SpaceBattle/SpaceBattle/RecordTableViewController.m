//
//  RecordTableViewController.m
//  SpaceBattle
//
//  Created by bryant on 21/9/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import "RecordTableViewController.h"
#import "RecordCell.h"

@interface RecordTableViewController ()

@end

@implementation RecordTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSDictionary *rec1 = @{@"id":@"1", @"player":@"Bryant", @"ship":@"ship2", @"score":@"10000", @"date":@"2015-9-21"};
    NSDictionary *rec2 = @{@"id":@"2", @"player":@"Jessie", @"ship":@"ship3", @"score":@"5600", @"date":@"2015-9-22"};
    NSDictionary *rec3 = @{@"id":@"3", @"player":@"Thomas", @"ship":@"ship4", @"score":@"4300", @"date":@"2015-9-20"};
    NSDictionary *rec4 = @{@"id":@"4", @"player":@"Teresa", @"ship":@"ship2", @"score":@"2000", @"date":@"2015-8-18"};
    
    records = [[NSMutableArray alloc] initWithArray:@[rec1, rec2, rec3, rec4]];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"space_bg"]];
    self.tableView.separatorColor = [UIColor colorWithWhite:0.8 alpha:0.4];
    
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated{
    
    if (_bundle != nil) {
        NSDictionary *ship = [_bundle objectForKey:@"ship"];
        [records addObject:@{@"id":@"n",
                             @"player": [ship objectForKey:@"name"],
                             @"ship": [ship objectForKey:@"img"],
                             @"score": [_bundle objectForKey:@"score"],
                             @"date":@"2015-9-21"}];
        [self.tableView reloadData];
    }
    
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
    return records.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"record_cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.5];
    cell.name.text = [[records objectAtIndex:indexPath.row] objectForKey:@"player"];
    cell.ship_img.image = [UIImage imageNamed:[[records objectAtIndex:indexPath.row] objectForKey:@"ship"]];
    cell.score.text = [[records objectAtIndex:indexPath.row] objectForKey:@"score"];
    cell.date.text = [[records objectAtIndex:indexPath.row] objectForKey:@"date"];
    
    
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
