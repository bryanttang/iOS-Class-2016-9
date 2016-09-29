//
//  Calculator.h
//  overallDemo
//
//  Created by bryant on 19/9/2016.
//  Copyright © 2016 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Calculator : UIViewController

{
    int store;
    float store_f;
    double store_d;
    
}



@property (strong, nonatomic) IBOutlet UILabel *display;

@end
