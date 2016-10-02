//
//  ViewController.m
//  HelloGesture
//
//  Created by bryant on 29/9/2016.
//  Copyright © 2016 cpttm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //Step 1
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToTap:)];
    
    tap.numberOfTapsRequired = 2;
    tap.numberOfTouchesRequired = 2;
    
    
    //Step 3
    [self.view addGestureRecognizer:tap];
    
    
    
}

//Step 2
- (void)respondsToTap:(UITapGestureRecognizer*) recognizer{
    
    NSLog(@"Tap ");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
