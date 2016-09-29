//
//  calculator.m
//  calculator
//
//  Created by bryant on 8/7/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import "calculator.h"

@implementation calculator


- (void)clear{
    operator_ = @"";
    operand = 0.0;
    result = 0.0;
}

- (void)setOperator:(NSString*)op{
    operator_ = op;
}

- (void)setOperand:(NSString*)text{
    operand = text.doubleValue;
}

- (void)calculate{
    if ([operator_ isEqualToString:@"+"]) {
        result = result + operand;
    }else if ([operator_ isEqualToString:@"-"]) {
        result = result - operand;
    }else if ([operator_ isEqualToString:@"/"]) {
        result = result / operand;
    }else if ([operator_ isEqualToString:@"x"]) {
        result = result * operand;
    }else if ([operator_ isEqualToString:@""]){
        result = operand;
    }
    operand = 0.0;
}

- (NSString*)getResult{
    return [NSString stringWithFormat:@"%g", result];
}



@end
