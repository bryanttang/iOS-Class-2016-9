//
//  ViewController.h
//  my first app2
//
//  Created by bryant on 19/9/2016.
//  Copyright © 2016 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "calculator.h"

@interface ViewController : UIViewController
{
    calculator *cal;
}

@property (strong, nonatomic) IBOutlet UITextField *display;

@end

