//
//  MissionCell.h
//  demo_20151020
//
//  Created by bryant on 20/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MissionCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *img;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *desp;

-(void)setupImage:(NSString *)url;
@end
