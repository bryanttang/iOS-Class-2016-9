//
//  ViewController.m
//  TabBarControllerDemo
//
//  Created by bryant on 6/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}


- (IBAction)clickJumpToProfile:(id)sender {
    
    self.tabBarController.selectedIndex = 1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}













@end
