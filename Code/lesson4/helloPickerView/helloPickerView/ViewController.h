//
//  ViewController.h
//  helloPickerView
//
//  Created by bryant on 17/9/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray *ships;

}
@property (strong, nonatomic) IBOutlet UILabel *d_name;


@end

