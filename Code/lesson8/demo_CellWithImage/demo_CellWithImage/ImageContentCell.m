//
//  ImageContentCell.m
//  demo_CellWithImage
//
//  Created by bryant on 15/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import "ImageContentCell.h"

@implementation ImageContentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setupImage:(NSString*)img_url_str{
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.center = CGPointMake(80, 70);
    [indicator startAnimating];
    [self addSubview:indicator];
    dispatch_queue_t processQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(processQueue, ^{
        //Do something
        NSURL *url = [NSURL URLWithString:img_url_str];
        NSData *img_data = [NSData dataWithContentsOfURL:url];
        _img.image = [UIImage imageWithData:img_data];
        
        [indicator stopAnimating];
        [indicator removeFromSuperview];
    });
}

@end
