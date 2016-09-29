//
//  ViewController.h
//  calculator
//
//  Created by bryant on 8/9/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    int store;
    float store_f;
    double store_d;

}



@property (strong, nonatomic) IBOutlet UILabel *display;

@end

