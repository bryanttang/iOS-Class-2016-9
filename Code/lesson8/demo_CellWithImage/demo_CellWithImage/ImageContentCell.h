//
//  ImageContentCell.h
//  demo_CellWithImage
//
//  Created by bryant on 15/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageContentCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *img;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *level;
@property (strong, nonatomic) IBOutlet UITextView *desp;

- (void)setupImage:(NSString*)img_url_str;
@end
