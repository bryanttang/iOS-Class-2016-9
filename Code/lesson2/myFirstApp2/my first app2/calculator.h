//
//  calculator.h
//  calculator
//
//  Created by bryant on 8/7/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface calculator : NSObject
{
    double M1;
    double M2;
    double M3;
    double result;
    double oprand;
    NSString *operator_;
    
    
}

- (void)clear;
- (void)setOprand:(NSString*)text;
- (void)calculate;
- (void)setOperator:(NSString*)text;
- (NSString*)getResult;


@end
