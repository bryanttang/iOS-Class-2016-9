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
    
    cal = [calculator new];
    [cal clear];
}


- (IBAction)clicknum:(UIButton*)sender {
    
    _display.text = [_display.text stringByAppendingFormat:@"%ld", sender.tag];
    
    [cal setOperand:_display.text];
    
}

- (IBAction)clickDot:(id)sender {
    _display.text = [_display.text stringByAppendingString:@"."];
    
    [cal setOperand:_display.text];

}

//- (IBAction)clicknum1:(id)sender {
//    NSLog(@"click 1");
//    _display.text = [_display.text stringByAppendingString:@"1"];
//    
//    [cal setOperand:_display.text];
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

- (IBAction)clickOperator:(UIButton*)sender {
    
    [cal calculate];
    switch (sender.tag) {
        case 11:
            [cal setOperator:@"+"];
            break;
        case 12:
            [cal setOperator:@"-"];
            break;
        case 13:
            [cal setOperator:@"/"];
            break;
        case 14:
            [cal setOperator:@"x"];
            break;
        default:
            break;
    }
    
    _display.text = @"";
    NSLog(@"%@",[cal getResult]);
}



- (IBAction)clickEquel:(id)sender {
    
    [cal calculate];
    _display.text = [cal getResult];
    
    [cal clear];
    [cal setOperand:_display.text];
    
    NSLog(@"%@",[cal getResult]);
    
}

- (IBAction)clickClear:(id)sender {
    
    _display.text = @"";
    [cal clear];
}



- (IBAction)clickStorage1:(id)sender {
}

- (IBAction)clickStorage2:(id)sender {
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
