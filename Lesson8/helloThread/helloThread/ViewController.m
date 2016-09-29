//
//  ViewController.m
//  helloThread
//
//  Created by bryant tang on 5/6/15.
//  Copyright (c) 2015 CPTTM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    [NSThread detachNewThreadSelector:@selector(workDo1:) toTarget:self withObject:nil];
//    [NSThread detachNewThreadSelector:@selector(workDo2:) toTarget:self withObject:nil];
    
    dispatch_queue_t serialQueue = dispatch_queue_create("serialQueue", NULL);
    dispatch_async(serialQueue, ^{
        [self task1];
    });
    
    dispatch_queue_t conQueue2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(conQueue2, ^{
        [self task2];
    });
    
    
}

- (void)workDo1:(id)object{
    [self task1];
    
}

- (void)workDo2:(id)object{
    [self task2];
    
}




- (void)task1{
    NSLog(@"task 1 ++++");
    sleep(5);
    NSLog(@"task 1 ----");
    
}

- (void)task2{
    NSLog(@"task 2 ++++");
    sleep(3);
    NSLog(@"task 2 ----");
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
