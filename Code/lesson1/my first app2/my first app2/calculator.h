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
    
    
}
- (double) add:(double)opand1 :(double)opand2;
- (double) sub:(double)opand1 :(double)opand2;
- (double) cross:(double)opand1 :(double)opand2;
- (double) div:(double)opand1 :(double)opand2;


@end
