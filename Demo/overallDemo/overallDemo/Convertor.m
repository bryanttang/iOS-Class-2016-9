//
//  Convertor.m
//  overallDemo
//
//  Created by bryant on 19/9/2016.
//  Copyright © 2016 cpttm. All rights reserved.
//

#import "Convertor.h"

@interface Convertor ()

@end

@implementation Convertor

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self convertUSDToMOP];
    
    return YES;
}

- (void)convertUSDToMOP{
    //hide the keyboard
    [self.input resignFirstResponder];
    
    //Return converting result to label
    CGFloat usd = [self.input.text floatValue];
    CGFloat mop = usd * 7.98746;
    
    self.result.text = [NSString stringWithFormat:@"MOP = %f", mop];
}

- (IBAction)clickConvertor:(id)sender{
    [self convertUSDToMOP];
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
