//
//  ContactList.m
//  helloPickview
//
//  Created by bryant on 22/9/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import "ContactList.h"

@interface ContactList ()

@end

@implementation ContactList

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSDictionary * person1 = @{@"name":@"peter",
                               @"age":@"18",
                               @"sex":@"male",
                               @"desp":@"asdfasd asdf asd as"};
    
    NSDictionary * person2 = @{@"name":@"Bryant",
                               @"age":@"20",
                               @"sex":@"male",
                               @"desp":@"asdfasd asdf asd as"};
    
    NSDictionary * person3 = @{@"name":@"Sue",
                               @"age":@"23",
                               @"sex":@"female",
                               @"desp":@"asdfasd asdf asd as"};
    
    
    myfriends = @[person1, person2, person3];

    
    NSDictionary * person4 = @{@"name":@"Tom",
                               @"age":@"18",
                               @"sex":@"male",
                               @"desp":@"asdfasd asdf asd as"};
    
    NSDictionary * person5 = @{@"name":@"Jessie",
                               @"age":@"20",
                               @"sex":@"female",
                               @"desp":@"asdfasd asdf asd as"};
    

    myRelative = @[person4, person5];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    sectionView.backgroundColor = [UIColor colorWithWhite:0.4 alpha:1.0];
    
    
    
    
    return sectionView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return myfriends.count;
        
    }else if (section == 1){
        
        return myRelative.count;
        
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    tableView.separatorColor = [UIColor blueColor];
    
    
    
    NSInteger section = indexPath.section;
    
    NSInteger row = indexPath.row;
    
    NSString *identifier = @"mycell";
    
    
    NSDictionary *person;
    if (section == 0) {
        
        person = [myfriends objectAtIndex:row];
        
    }else if (section == 1){
        
        person = [myRelative objectAtIndex:row];
        
    }
    
    
    
    if ([[person objectForKey:@"name"] isEqualToString:@"peter"]) {
        identifier = @"mybestfriend";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text = [person objectForKey:@"name"];
   
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    NSDictionary *person = [myfriends objectAtIndex:row];

    
    
    NSLog(@"%@", [person objectForKey:@"name"]);
    
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
