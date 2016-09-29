//
//  Enemy.m
//  SpaceBattle
//
//  Created by bryant on 22/9/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import "Enemy.h"

@implementation Enemy

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self != nil) {
        
        //Init shipView
        
        shipView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:shipView];
        explode = [[UIImageView alloc] initWithFrame:self.bounds];
        explode.image = [UIImage imageNamed:@"explode"];
        explode.hidden = YES;
        explode.alpha = 0.0;

        [self addSubview:explode];
        
    }
    
    return self;
    
}

- (void)setupAEnemyWithName:(NSString*) name
                      Desp:(NSString*) desp
                    Ship_n:(NSString*) img1
                    Ship_f:(NSString*) img2
                    Ship_b:(NSString*) img3
                    Ship_l:(NSString*) img4
                    Ship_r:(NSString*) img5
{
    _name = name;
    _desp = desp;
    _ship_n = img1;
    _ship_f = img2;
    _ship_b = img3;
    _ship_l = img4;
    _ship_r = img5;
    
    shipView.image = [UIImage imageNamed:_ship_n];
    
}

- (void)move{
    state = 1;
    int leftright = rand()%20;
    if (leftright % 2 == 0) {
        [self moveLeft];
    }else{
        [self moveRight];
    }
    
    
    
}


- (void)moveLeft{
    
    int delta_y = rand()%100;
    int delta_s = rand()%150+20;
    //Left
    [UIView animateWithDuration:delta_s/20.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         self.center = CGPointMake(15, self.center.y+delta_y);
                         
                     } completion:^(BOOL finished) {
                         if (self.center.y > 568 || state == 0) {
                             
                         }else{
                             [self moveRight];
                         }
                     }];
    
}

- (void)moveRight{
    int delta_y = rand()%100;
    int delta_s = rand()%150+20;
    //Right
    [UIView animateWithDuration:delta_s/20.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         self.center = CGPointMake(320, self.center.y+delta_y);
                         
                     } completion:^(BOOL finished) {
                         
                         if (self.center.y > 568 || state == 0) {
                             
                         }else{
                             [self moveLeft];
                         }
                     }];

}

- (void)destoried{
    if (state == 0) {
        return;
    }
    state = 0;
    [self.layer removeAllAnimations];
    
    self.frame = [[self.layer presentationLayer] frame];
    
    explode.transform = CGAffineTransformMakeScale(0.4, 0.4);
    explode.hidden = NO;
    
    [UIView animateWithDuration:0.1
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         explode.alpha = 1.0;
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.1 animations:^{
                             shipView.alpha = 0.0;
                         } completion:^(BOOL finished) {
                             
                         }];
                         [UIView animateWithDuration:1.0
                                               delay:0.1
                                             options:UIViewAnimationOptionCurveEaseOut
                                          animations:^{
                                              explode.transform = CGAffineTransformMakeScale(6, 6);
                                              explode.alpha = 0.0;
                                              
                                          } completion:^(BOOL finished) {
                                              explode.hidden=YES;
                                              
                                          }];
                         
                         
                     }];
    
}




@end
