//
//  MyCell.h
//  helloThread
//
//  Created by bryant tang on 5/6/15.
//  Copyright (c) 2015 CPTTM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell
{

    UIImageView *img;
}

- (void)setupCell;
- (void)loadImgByURL:(NSString*)url;

@end
