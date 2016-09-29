//
//  Enemy.h
//  SpaceBattle
//
//  Created by bryant on 22/9/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Enemy : UIView
{
    UIImageView *shipView;
    UIImageView *explode;
    int state;
}

@property NSString * name;
@property NSString * desp;
@property NSString * ship_n;
@property NSString * ship_f;
@property NSString * ship_b;
@property NSString * ship_l;
@property NSString * ship_r;

- (void)move;
- (void)destoried;


//- (void)forward:(CGFloat)distance;
//- (void)backward:(CGFloat)distance;
//- (void)leftShift:(CGFloat)distance;
//- (void)rightShift:(CGFloat)distance;

- (instancetype)initWithFrame:(CGRect)frame;
- (void)setupAEnemyWithName:(NSString*) name
                      Desp:(NSString*) desp
                    Ship_n:(NSString*) img1
                    Ship_f:(NSString*) img2
                    Ship_b:(NSString*) img3
                    Ship_l:(NSString*) img4
                    Ship_r:(NSString*) img5;
@end
