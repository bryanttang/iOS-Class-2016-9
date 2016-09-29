//
//  Ship.m
//  SpaceBattle
//
//  Created by bryant on 17/9/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import "Ship.h"

@implementation Ship

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self != nil) {
        
        //Init shipView
        
        shipView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:shipView];
        
    }
    
    return self;
    
}

- (void)setupAShipWithName:(NSString*) name
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



- (void)forward:(CGFloat)distance{
    
    [UIView animateWithDuration:0.3 animations:^{
        shipView.image = [UIImage imageNamed:_ship_f];
    }];
    
    
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.transform = CGAffineTransformTranslate(self.transform, 0, -distance) ;
                         
                     } completion:^(BOOL finished) {
                         shipView.image = [UIImage imageNamed:_ship_n];
                     }];
    

}

- (void)backward:(CGFloat)distance{

    [UIView animateWithDuration:0.3 animations:^{
        shipView.image = [UIImage imageNamed:_ship_b];
    }];
    
    
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         self.center = CGPointMake(self.center.x, self.center.y + distance);
                         
//                         self.transform = CGAffineTransformTranslate(self.transform, 0, 40) ;
                         
                     } completion:^(BOOL finished) {
                         shipView.image = [UIImage imageNamed:_ship_n];
                     }];
}

- (void)leftShift:(CGFloat)distance{
    
    [UIView animateWithDuration:0.3 animations:^{
        shipView.image = [UIImage imageNamed:_ship_l];
    }];
    
    
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.transform = CGAffineTransformTranslate(self.transform, -distance, 0) ;
                         
                     } completion:^(BOOL finished) {
                         shipView.image = [UIImage imageNamed:_ship_n];
                     }];
    
}

- (void)rightShift:(CGFloat)distance{
    
    [UIView animateWithDuration:0.3 animations:^{
        shipView.image = [UIImage imageNamed:_ship_r];
    }];
    
    
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.transform = CGAffineTransformTranslate(self.transform, distance, 0) ;
                         
                     } completion:^(BOOL finished) {
                         shipView.image = [UIImage imageNamed:_ship_n];
                     }];

}


@end
