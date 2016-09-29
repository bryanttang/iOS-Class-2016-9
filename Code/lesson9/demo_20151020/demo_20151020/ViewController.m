//
//  ViewController.m
//  demo_20151020
//
//  Created by bryant on 20/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self countUp];
    
    float screen_height = self.view.frame.size.height;
    NSLog(@"%f", screen_height);
}

- (void)countUp{
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(addCount:) userInfo:nil repeats:true];

    
}

- (void)addCount:(id)sender{
    
    int count_num = _counter.text.intValue;
    count_num++;
    
    _counter.text = [NSString stringWithFormat:@"%d", count_num];
    
    
    
    //Stop when count to 10
    //    timer stop
    
    
}
- (IBAction)restart:(id)sender {

    if (timer == nil) {
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(addCount:) userInfo:nil repeats:true];
    }
//    [timer fire];

}
- (IBAction)clickstop:(id)sender {
    [timer invalidate];
    timer = nil;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
