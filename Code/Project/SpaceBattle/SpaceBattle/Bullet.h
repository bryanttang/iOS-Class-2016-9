//
//  Bullet.h
//  SpaceBattle
//
//  Created by bryant on 22/9/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Bullet : UIView
{
    UIImageView *bulletView;
    NSString *name;
    CGFloat speed;

}


-(void)fire;
- (instancetype)initWithFrame:(CGRect) frame;
- (void)setupABulletWithName:(NSString*) name
                       view:(NSString*) img
                      speed:(CGFloat) speed;


@end
