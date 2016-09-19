//
//  Ship.h
//  SpaceBattle
//
//  Created by bryant on 17/9/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Ship : UIView
{
    UIImageView *shipView;

}

@property NSString * name;
@property NSString * desp;
@property NSString * ship_n;
@property NSString * ship_f;
@property NSString * ship_b;
@property NSString * ship_l;
@property NSString * ship_r;

- (void)forward:(CGFloat)distance;
- (void)backward:(CGFloat)distance;
- (void)leftShift:(CGFloat)distance;
- (void)rightShift:(CGFloat)distance;

- (instancetype)initWithFrame:(CGRect)frame;
- (void)setupAShipWithName:(NSString*) name
                      Desp:(NSString*) desp
                    Ship_n:(NSString*) img1
                    Ship_f:(NSString*) img2
                    Ship_b:(NSString*) img3
                    Ship_l:(NSString*) img4
                    Ship_r:(NSString*) img5;














@end
