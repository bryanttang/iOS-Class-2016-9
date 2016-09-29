//
//  Calculator.m
//  overallDemo
//
//  Created by bryant on 19/9/2016.
//  Copyright © 2016 cpttm. All rights reserved.
//

#import "Calculator.h"

@interface Calculator ()

@end

@implementation Calculator

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
