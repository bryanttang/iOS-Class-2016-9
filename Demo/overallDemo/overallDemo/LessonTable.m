//
//  LessonTable.m
//  overallDemo
//
//  Created by bryant on 16/3/16.
//  Copyright © 2016 cpttm. All rights reserved.
//

#import "LessonTable.h"

@interface LessonTable (){

    NSArray *lessons;
    NSArray *lesson1;
    NSArray *lesson2;
    NSArray *lesson3;
    NSArray *lesson4;
    NSArray *lesson5;
    NSArray *lesson6;
    NSArray *lesson7;
    NSArray *lesson8;
    NSArray *lesson9;
    NSArray *lesson10;
}

@end

@implementation LessonTable

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    [self setupData];
    
    
}


- (void)setupData{
    lessons = @[@"Lesson1", @"Lesson2", @"Lesson3", @"Lesson4", @"Lesson5", @"Lesson6", @"Lesson7", @"Lesson8", @"Lesson9" , @"Lesson10"];
    
    lesson1 = @[@"Calculator"];
    lesson2 = @[@"Convertor"];
    lesson3 = @[@"Gesture1",@"Gesture2"];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return lessons.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return lesson1.count;
            break;
        case 1:
            return lesson2.count;
            break;
        case 2:
            return lesson3.count;
            break;
        default:
            break;
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [lessons objectAtIndex:section];
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
    header.text = [lessons objectAtIndex:section];
    header.backgroundColor = [UIColor colorWithRed:(100+ section * 10)/255.0 green:(40+ section * 10)/255.0 blue:(40+ section * 10)/255.0 alpha:1.0];
    header.textColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    return header;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"lessoncell" forIndexPath:indexPath];
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [lesson1 objectAtIndex:indexPath.row];
            break;
        case 1:
            cell.textLabel.text = [lesson2 objectAtIndex:indexPath.row];
            break;
        case 2:
            cell.textLabel.text = [lesson3 objectAtIndex:indexPath.row];
        default:
            break;
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController *vc;
    
    switch (indexPath.section) {
        case 0:
            vc = [self.storyboard instantiateViewControllerWithIdentifier:[lesson1 objectAtIndex:indexPath.row]];
            break;
        case 1:
            vc = [self.storyboard instantiateViewControllerWithIdentifier:[lesson2 objectAtIndex:indexPath.row]];
            break;
        case 2:
            vc = [self.storyboard instantiateViewControllerWithIdentifier:[lesson3 objectAtIndex:indexPath.row]];
            break;
            
        default:
            break;
    }
    
    [self.navigationController pushViewController:vc animated:YES];
    
}



//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if ([segue.identifier isEqualToString:@"C"]) {
//        <#statements#>
//    }
//}

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
