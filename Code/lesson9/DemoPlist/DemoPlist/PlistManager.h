//
//  PlistManager.h
//  DemoGoogleMapSDK
//
//  Created by bryant on 13/8/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlistManager : NSObject

+ (NSDictionary *)readPlist:(NSString *) filename;
+ (void)writePlist:(NSMutableDictionary *) plist :(NSString *) filename;
@end
