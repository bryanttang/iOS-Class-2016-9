//
//  MissionDetailViewController.h
//  SpaceBattle
//
//  Created by bryant on 15/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MissionDetailViewController : UIViewController{
    NSDictionary *mission;
}

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *level;
@property (strong, nonatomic) IBOutlet UITextView *desp;
@property (strong, nonatomic) IBOutlet UIImageView *img;
-(void)setup:(NSDictionary*)mission;
@end
