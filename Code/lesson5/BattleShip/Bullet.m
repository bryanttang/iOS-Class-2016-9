//
//  Bullet.m
//  SpaceBattle
//
//  Created by bryant on 22/9/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import "Bullet.h"

@implementation Bullet


- (instancetype)initWithFrame:(CGRect) frame{
    
    self = [super initWithFrame:frame];
    
    if (self != nil) {
        
        //Init shipView
        
        bulletView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:bulletView];

        
    }
    
    return self;
    
}


- (void)setupABulletWithName:(NSString*) name_
                       view:(NSString*) img
                      speed:(CGFloat) speed_
{
    name = name_;
    bulletView.image = [UIImage imageNamed:img];
    speed = speed_;
    

}


-(void)fire{
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.transform = CGAffineTransformMakeTranslation(0, -600);
                     } completion:^(BOOL finished) {
                         self.alpha = 0.0;
                         
                     }];
}
@end
