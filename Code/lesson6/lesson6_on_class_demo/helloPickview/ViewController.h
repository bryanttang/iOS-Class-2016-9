//
//  ViewController.h
//  helloPickview
//
//  Created by bryant on 22/9/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{

    NSArray *options;
    
    NSArray *myfirends;
}

@property (strong, nonatomic) IBOutlet UIPickerView *myPickerView;



@end

