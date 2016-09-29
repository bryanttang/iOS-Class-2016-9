//
//  RecordCell.h
//  SpaceBattle
//
//  Created by bryant on 21/9/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *ship_img;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *desp;
@property (strong, nonatomic) IBOutlet UILabel *score;

@end
