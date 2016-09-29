//
//  Gesture2.m
//  overallDemo
//
//  Created by bryant on 19/9/2016.
//  Copyright © 2016 cpttm. All rights reserved.
//

#import "Gesture2.h"

@interface Gesture2 ()

@end

@implementation Gesture2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UISwipeGestureRecognizer *swipe_l = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToSwipe:)];
    
    swipe_l.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipe_l];
    
    UISwipeGestureRecognizer *swipe_r = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToSwipe:)];
    
    swipe_r.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe_r];
    
    
    UISwipeGestureRecognizer *swipe_f = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToSwipe:)];
    
    swipe_f.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipe_f];
    
    UISwipeGestureRecognizer *swipe_b = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToSwipe:)];
    
    swipe_b.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipe_b];

}


- (void)viewDidAppear:(BOOL)animated{
    
    ship = [[Ship alloc] initWithFrame:CGRectMake(150, 420, 120*225/523, 120)];
    [ship setupAShipWithName:@"AX8890"
                        Desp:@"asdfa sda asdasd asdasdf asd"
                      Ship_n:@"ship2_b"
                      Ship_f:@"ship2_f"
                      Ship_b:@"ship2"
                      Ship_l:@"ship2_l"
                      Ship_r:@"ship2_r"];
    
    [self.view addSubview:ship];
    
    
    UILongPressGestureRecognizer *fire = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToLongPress:)];
    fire.minimumPressDuration = 0.6;
    
    [ship addGestureRecognizer:fire];
    
    
    
    
}


- (void)respondsToLongPress:(UILongPressGestureRecognizer*)longPress{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        NSLog(@"LongPress");
        //Reload
        UIImageView *bullet = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bullet"]];
        bullet.frame = CGRectMake(ship.frame.origin.x + ship.frame.size.width/2 - 10, ship.frame.origin.y + 5, 20, 10);
        
        [self.view addSubview:bullet];
        
        
        //Fire
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            bullet.transform = CGAffineTransformMakeTranslation(0, -bullet.frame.origin.y);
        } completion:^(BOOL finished) {
            [bullet removeFromSuperview];
        }];
    }
    
    
    
}


- (void) respondsToSwipe:(UISwipeGestureRecognizer*)swipe{
    NSLog(@"Swipe");
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"Left");
        [ship leftShift:40.0];
        
    }else if (swipe.direction == UISwipeGestureRecognizerDirectionRight){
        NSLog(@"Right");
        [ship rightShift:40.0];
        
    }else if (swipe.direction == UISwipeGestureRecognizerDirectionUp){
        NSLog(@"forward");
        
        [ship forward:100.0];
        
        
    }else if (swipe.direction == UISwipeGestureRecognizerDirectionDown){
        NSLog(@"Backward");
        [ship backward:50.0];
    }
    
    
    
    
    
    
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
