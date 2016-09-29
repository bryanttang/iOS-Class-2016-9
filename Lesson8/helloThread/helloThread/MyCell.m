//
//  MyCell.m
//  helloThread
//
//  Created by bryant tang on 5/6/15.
//  Copyright (c) 2015 CPTTM. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupCell{
    img = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 60)];
    [self addSubview:img];
    
    
}

- (void)loadImgByURL:(NSString*)url{
    
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    
    img.image = [UIImage imageWithData:imgData];


}












@end
