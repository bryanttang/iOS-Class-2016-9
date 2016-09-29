//
//  ViewController.m
//  my first app2
//
//  Created by bryant on 19/9/2016.
//  Copyright © 2016 cpttm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    calculator *cal = [[calculator alloc] init];
    
    [cal clear];
    
    

}

- (IBAction)clickNum1:(id)sender {
    
    //Do something
   
    self.display.text = @"1";
    
    //[self.display setText:@"1"];
    
//    [UIView animateWithDuration:1.0
//                          delay:0.0
//                        options:UIViewAnimationOptionCurveEaseIn
//                     animations:^{
//                         //do something
//                     } completion:^(BOOL finished) {
//                         
//                     }];
    
}

//- (IBAction)clicknum1:(id)sender {
//    NSLog(@"click 1");
//    _display.text = @"1";
//    [cal setOperand:@"1"];
//    
//}
//
//- (IBAction)clicknum2:(id)sender {
//    NSLog(@"click 2");
//    _display.text = @"2";
//    [cal setOperand:@"2"];
//}
//
//- (IBAction)clicknum3:(id)sender {
//    NSLog(@"click 3");
//    _display.text = @"3";
//    [cal setOperand:@"3"];
//}
//
//- (IBAction)clickAdd:(id)sender {
//    
//    [cal calculate];
//    [cal setOperator:@"+"];
//    
//}
//
//- (IBAction)clickEquel:(id)sender {
//    
//    [cal calculate];
//    _display.text = [cal getResult];
//    
//}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
