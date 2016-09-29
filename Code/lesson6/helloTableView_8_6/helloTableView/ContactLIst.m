//
//  ContactLIst.m
//  helloTableView
//
//  Created by bryant on 6/8/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import "ContactLIst.h"
#import "headImageCell.h"
#import "DetailViewController.h"


@interface ContactLIst ()

@end

@implementation ContactLIst

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary* person1 = @{@"name":@"bryant afas asdfasdjflakjsdhflajkdshflasd",
                             @"age":@"25",
                             @"sex":@"male"};
    
    NSDictionary* person2 = @{@"name":@"jessie",
                             @"age":@"23",
                             @"sex":@"female"};
    
    
    NSDictionary* person3 = @{@"name":@"james",
                             @"age":@"25",
                             @"sex":@"male"};
    
    myfirends = @[person1, person2, person3];
    
    
    NSDictionary* person4 = @{@"name":@"david",
                              @"age":@"25",
                              @"sex":@"male"};
    
    badList = @[person4];
    
    
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        
        DetailViewController *detailVC = (DetailViewController*) segue.destinationViewController;
        
        NSInteger section = [self.tableView indexPathForSelectedRow].section;
        
        
        NSDictionary *person;
        if (section == 0) {
            NSInteger row = [self.tableView indexPathForSelectedRow].row;
            
            person = [myfirends objectAtIndex:row];
            
        }
        
        detailVC.bundle = person;
        
    }

}















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0 ){
        return myfirends.count;
    }
    if (section == 1) {
        return badList.count;
    }
    
    return 3;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    if (section == 0 ){
        return @"My friends";
    }
    if (section == 1) {
        return @"Bad List";
    }
    
    return @"";


}





- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    header.backgroundColor = [UIColor redColor];
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 40.0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;

    NSString *identifier = @"";
    if (section == 0 ){
        identifier=@"mycell";
    }
    if (section == 1) {
        identifier = @"mycell";
    }

    headImageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    
    if (cell == nil) {
        cell = [[headImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
    }
        
    NSDictionary *person;
    if (section == 0 ){
        person =[myfirends objectAtIndex:row];
    }
    if (section == 1) {
        person = [badList objectAtIndex:row];
    }
    
    if ([cell isKindOfClass:[headImageCell class]]) {
        cell.headImage.image = [UIImage imageNamed:[person objectForKey:@"name"]];

        cell.name.text = [person objectForKey:@"name"];
        cell.name.numberOfLines = 0;
        [cell.name sizeToFit];
        
        cell.age.text = [person objectForKey:@"age"];
    }else{
        cell.textLabel.text =[person objectForKey:@"name"];
        cell.detailTextLabel.text = [person objectForKey:@"age"];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
