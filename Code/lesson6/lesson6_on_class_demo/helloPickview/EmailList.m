//
//  EmailList.m
//  helloPickview
//
//  Created by bryant on 24/9/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import "EmailList.h"
#import "MyEmailCell.h"
#import "DetailViewController.h"


@interface EmailList ()

@end

@implementation EmailList

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *email1 = @{@"name":@"bryant",
                             @"img":@"bryant",
                             @"detail":@"asdfasdf asdads;lkja;dsfasdfajs;dflkja"};
    
    NSDictionary *email2 = @{@"name":@"James",
                             @"img":@"james",
                             @"detail":@"asdfasdf asdads;lkja;dsfasdfajs;dflkja"};
    
    NSDictionary *email3 = @{@"name":@"Jessie",
                             @"img":@"jessie",
                             @"detail":@"asdfasdf asdads;lkja;dsfasdfajs;dflkja asdfasdfasdfasd fasdadsfasdfasdads"};
    
    email = @[email1, email2, email3];
    
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSInteger row = [self.tableView indexPathForSelectedRow].row;
    NSDictionary *item = [email objectAtIndex:row];
    
    DetailViewController *detail =  (DetailViewController*)segue.destinationViewController;
    detail.bundle = item;
    

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
    return email.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyEmailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"emailcell" forIndexPath:indexPath];
    
    NSDictionary *item = [email objectAtIndex:indexPath.row];
    
    
    cell.name.text = [item objectForKey:@"name"];
    cell.img.image = [UIImage imageNamed:[item objectForKey:@"img"]];
                      
    cell.desp.text = [item objectForKey:@"detail"];

    
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
