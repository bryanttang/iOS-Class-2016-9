//
//  ViewController.h
//  DemoPlist
//
//  Created by bryant on 20/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    
    NSMutableArray *myFriends;
    IBOutlet UITableView *list;
}
@property (strong, nonatomic) IBOutlet UITextField *inputBox;


@end

