//
//  PlistManager.m
//  DemoGoogleMapSDK
//
//  Created by bryant on 13/8/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import "PlistManager.h"

@implementation PlistManager

+ (NSDictionary *)readPlist:(NSString *) filename
{
    
    NSString *filepath = [self getFileFullPath:[NSString stringWithFormat:@"%@", filename]];
    NSDictionary *plist = [[NSDictionary alloc] initWithContentsOfFile:filepath];
    return plist;
}

+ (void)writePlist:(NSMutableDictionary *) plist :(NSString *) filename
{
    NSString *filepath =  [NSString stringWithFormat:@"%@", [self getFileFullPath:filename]];
    NSLog(@"%@", filepath);
    BOOL a = [plist writeToFile:filepath atomically: YES];
    
    NSLog(@"Store plist: %d", a);
}

+ (NSString *)getFileFullPath:(NSString *) filename
{
    NSError *error;
    NSString *documentPath = [self getDocumentPath];
    NSString *path = [documentPath stringByAppendingPathComponent:filename];

    
    return path;
}

+ (NSString *)getDocumentPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentPath = [paths objectAtIndex:0];
    return documentPath;
}


@end
