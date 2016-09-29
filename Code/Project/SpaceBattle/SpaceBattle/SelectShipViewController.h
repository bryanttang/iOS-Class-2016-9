//
//  SelectShipViewController.h
//  SpaceBattle
//
//  Created by bryant on 17/9/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectShipViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

{
    NSArray *ships;
    
    IBOutlet UILabel *s_name;
    IBOutlet UILabel *s_desp;
    IBOutlet UIImageView *s_img1;
    IBOutlet UIImageView *s_img2;
    IBOutlet UIImageView *s_img3;
    IBOutlet UIPickerView *shipList;
}

@end
