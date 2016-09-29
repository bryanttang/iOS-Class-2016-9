//
//  ViewController.m
//  DemoPlist
//
//  Created by bryant on 20/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import "ViewController.h"
#import "PlistManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self reloadList];
    
    
}
- (IBAction)ClickAdd:(id)sender {
    
    NSMutableDictionary *plist = [NSMutableDictionary dictionaryWithDictionary:[PlistManager readPlist:@"myfriends"]];
   
    NSMutableArray *data;
    if (![plist objectForKey:@"data"]) {
       data = [NSMutableArray new];
       
    }else{
       data = [plist objectForKey:@"data"];
       
    }
    [data addObject:_inputBox.text];
    
    [plist setObject:data forKey:@"data"];
    [PlistManager writePlist:plist :@"myfriends"];
    
    [self reloadList];
}

- (void)reloadList{
    NSMutableDictionary *plist = [NSMutableDictionary dictionaryWithDictionary:[PlistManager readPlist:@"myfriends"]];
    myFriends = [plist objectForKey:@"data"];
    [list reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return myFriends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myfriend"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myfriend"];
        
    }
    
    cell.textLabel.text = [myFriends objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
