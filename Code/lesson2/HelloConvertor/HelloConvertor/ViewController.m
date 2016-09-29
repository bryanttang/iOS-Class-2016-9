//
//  ViewController.m
//  HelloConvertor
//
//  Created by bryant on 26/9/2016.
//  Copyright © 2016 cpttm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.input.delegate = self;
    
    
    [convertBtn setTitle:@"Test Btn" forState:UIControlStateNormal];
//    [convertBtn setTitle:@"Select Btn" forState:UIControlStateDisabled];

    [convertBtn addTarget:self action:@selector(clickConvert:) forControlEvents:UIControlEventTouchUpInside];
    
    
   // [self presentViewController:<#(nonnull UIViewController *)#> animated:<#(BOOL)#> completion:<#^(void)completion#>]
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    textField.textColor = [UIColor colorWithRed:220/255.0
                                          green:100/255.0
                                           blue:100/255.0
                                          alpha:1.0];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    

    [self convert];
    
    [textField resignFirstResponder];
    
    
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    textField.textColor = [UIColor blackColor];

    return YES;
    
}




- (IBAction)clickConvert:(id)sender {
    
    NSLog(@"click convert");
    
    [self convert];
    
    [self.input resignFirstResponder];
    

}


- (void)convert{
    NSString *cur =  self.input.text; //
    
    float cur_f =  cur.floatValue;    //
    
    float cur_f_mop = cur_f * 7.128;  //
    
    
    self.result.text = [NSString stringWithFormat:@"%.2f", cur_f_mop];


}














- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
