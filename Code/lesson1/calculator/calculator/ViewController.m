//
//  ViewController.m
//  calculator
//
//  Created by bryant on 8/9/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.asd

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clickOne:(id)sender {
    //Do something
    
    //display's title = 1
    
    _display.text = @"1"   ;    //NSString
    
    
}

- (IBAction)clickTwo:(id)sender {
    
    _display.text = @"2"   ;    //NSString
}

- (IBAction)clickThree:(id)sender {
    
    _display.text = @"3"   ;    //NSString
}

- (IBAction)clickAdd:(id)sender {

    //Save num
    store = store + _display.text.intValue;
    
    NSLog(@"%d", store);
    
    _display.text = @"0";
    
}

- (IBAction)clickEqual:(id)sender {
    
    store = store + _display.text.intValue;
    
    _display.text = [NSString stringWithFormat:@"%d", store] ;

    store = 0;
    
}





















@end
