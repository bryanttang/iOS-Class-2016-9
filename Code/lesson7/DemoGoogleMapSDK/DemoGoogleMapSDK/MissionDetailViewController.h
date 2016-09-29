//
//  MissionDetailViewController.h
//  DemoGoogleMapSDK
//
//  Created by bryant on 13/8/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MissionDetailViewController : UIViewController
@property (strong) NSDictionary *bundle;
@property (strong, nonatomic) IBOutlet UIImageView *img;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UITextView *description_text;

@end
