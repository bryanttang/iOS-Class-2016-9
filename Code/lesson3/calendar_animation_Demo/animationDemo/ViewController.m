//
//  ViewController.m
//  animationDemo
//
//  Created by bryant on 9/7/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    a = [[UIView alloc] initWithFrame:self.view.frame];
    b = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"calender"]];
    
//    UIView * a = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    CGRect frame = a.frame;
    frame.size = CGSizeMake(a.frame.size.width, a.frame.size.height-120);
    a.frame = frame;
    b.frame = frame;
    
    a.backgroundColor = [UIColor redColor];
    b.backgroundColor = [UIColor blueColor];
    
    
    
    calender_db = [[NSMutableArray alloc] init];
    for (int i= 0; i<=31; i++) {
        UIImageView *date = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"calender"]];
        date.frame = frame;
        UILabel *number = [[UILabel alloc] initWithFrame:CGRectMake(40, 90, 280, 280)];
        number.text = [NSString stringWithFormat:@"%d",i+1];
        [date addSubview:number];
        number.font = [UIFont fontWithName:@"Helvetica" size:220];
        number.textColor = [UIColor redColor];
        number.textAlignment = NSTextAlignmentCenter;
        [calender_db addObject:date];
    }
    date_temp =0;
    
    [self.view addSubview:(UIView*)[calender_db objectAtIndex:date_temp]];
    
    
    
//    UIView *gestureCover = [[UIView alloc] initWithFrame:self.view.frame];
    
    
//    CGPoint original = a.center;
//    NSLog(@"%f",original.y);
    
//    [UIView animateWithDuration:0.5 animations:^{
//        a.center = CGPointMake(200, 25);
//
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
//            a.center = CGPointMake(200, 200);
//        } completion:^(BOOL finished) {
//            
//            [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//                a.center = CGPointMake(25, 200);
//            } completion:^(BOOL finished) {
//                
//                [UIView animateWithDuration:3.0 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//                    
//                    a.center = CGPointMake(25, 25);
//                    
//                } completion:^(BOOL finished) {
//                    //Nothing
//                    
//                }];
//                
//            }];
//            
//        }];
//    }];
//    
//    [UIView animateWithDuration:1.0 animations:^{
//        a.transform = CGAffineTransformMakeTranslation(200, 0);
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:1.0 animations:^{
//            a.transform = CGAffineTransformMakeTranslation(200, 200);
//        } completion:^(BOOL finished) {
//            [UIView animateWithDuration:1.0 animations:^{
//                a.transform = CGAffineTransformMakeTranslation(0, 200);
//            } completion:^(BOOL finished) {
//                [UIView animateWithDuration:1.0 animations:^{
//                    a.transform = CGAffineTransformMakeTranslation(0, 0);
//                } completion:^(BOOL finished) {
//                    
//                }];
//            }];
//        }];
//        
//    }];

//    CGAffineTransform translate = CGAffineTransformMakeTranslation(200, 0);
//    CGAffineTransform rotation = CGAffineTransformMakeRotation(M_PI/180 * -90.0); //CGAffineTransformRotate(translate, M_PI/180 * 90.0);
//    
//    
//    [UIView animateWithDuration:1.0 animations:^{
//        //a.transform = translate;
//        a.center = CGPointMake(300, a.center.y);
//        a.layer.anchorPoint = CGPointMake(1.0f, 1.0f);
//    } completion:^(BOOL finished) {
//        
//        [UIView animateWithDuration:1.0 animations:^{
//            a.transform = rotation;
//
//        } completion:^(BOOL finished) {
//            
//        }];
//    }];
    
    
    
//    [UIView animateWithDuration:1.0 animations:^{
//        a.transform = CGAffineTransformMakeRotation(M_PI/180 * -90.0);
//    } completion:^(BOOL finished) {
//        
//        [UIView animateWithDuration:1.0 animations:^{
//            a.transform = CGAffineTransformTranslate(a.transform, 100,0);
//            
//        } completion:^(BOOL finished) {
//            
//        }];
//    }];
    
//        [UIView animateWithDuration:1.0 animations:^{
//            a.transform = CGAffineTransformMakeRotation(M_PI/180 * -90.0);
//        } completion:^(BOOL finished) {
//            
//            [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
//                                a.transform = CGAffineTransformTranslate(a.transform, 100,0);
//            } completion:^(BOOL finished) {
//                
//            }];
//            
//        }];
    
    
    UISwipeGestureRecognizer *upSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToSwipe:)];
    UISwipeGestureRecognizer *downSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToSwipe:)];
    upSwipe.direction = UISwipeGestureRecognizerDirectionUp;
    downSwipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:upSwipe];
    [self.view addGestureRecognizer:downSwipe];
    
    
}

- (void) respondsToSwipe:(UISwipeGestureRecognizer * )recognizer{
    NSLog(@"asdf");
    if (recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
        int pre_date = date_temp;
        date_temp++;
        
        
        [UIView transitionFromView:(UIView*)[calender_db objectAtIndex:pre_date]
                            toView:(UIView*)[calender_db objectAtIndex:date_temp]
                          duration:1.0
                           options:UIViewAnimationOptionTransitionCurlUp |
         UIViewAnimationOptionAllowUserInteraction    |
         UIViewAnimationOptionBeginFromCurrentState
                        completion:nil];
        
    }else if (recognizer.direction == UISwipeGestureRecognizerDirectionDown){
        int pre_date = date_temp;
        date_temp--;
        
        [UIView transitionFromView:(UIView*)[calender_db objectAtIndex:pre_date]
                            toView:(UIView*)[calender_db objectAtIndex:date_temp]
                          duration:0.5
                           options:UIViewAnimationOptionTransitionCurlDown |
         UIViewAnimationOptionAllowUserInteraction    |
         UIViewAnimationOptionBeginFromCurrentState
                        completion:nil];
    }
    
}
- (void) respondsToDownSwipe:(UISwipeGestureRecognizer * )recognizer{
    
}


- (IBAction)btnclick:(id)sender {
    
    int pre_date = date_temp;
    date_temp--;
    
    [UIView transitionFromView:(UIView*)[calender_db objectAtIndex:pre_date]
                        toView:(UIView*)[calender_db objectAtIndex:date_temp]
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCurlDown |
     UIViewAnimationOptionAllowUserInteraction    |
     UIViewAnimationOptionBeginFromCurrentState
                    completion:nil];
}
- (IBAction)toRed:(id)sender {
    
    int pre_date = date_temp;
    date_temp++;

    
    [UIView transitionFromView:(UIView*)[calender_db objectAtIndex:pre_date]
                        toView:(UIView*)[calender_db objectAtIndex:date_temp]
                      duration:1.0
                       options:UIViewAnimationOptionTransitionCurlUp |
     UIViewAnimationOptionAllowUserInteraction    |
     UIViewAnimationOptionBeginFromCurrentState
                    completion:nil];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
