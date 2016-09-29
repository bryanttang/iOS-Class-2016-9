//
//  MissionCell.m
//  demo_20151020
//
//  Created by bryant on 20/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import "MissionCell.h"

@implementation MissionCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setupImage:(NSString *)url{
    
    
    dispatch_queue_t processQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(processQueue, ^{
        

        //Download image
        NSURL *img_url = [NSURL URLWithString:url];
        NSData *img_data = [NSData dataWithContentsOfURL:img_url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            _img.image = [UIImage imageWithData:img_data];
        });
        
        
    });
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
