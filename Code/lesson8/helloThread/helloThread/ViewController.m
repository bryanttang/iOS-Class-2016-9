//
//  ViewController.m
//  helloThread
//
//  Created by bryant on 13/8/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.center = _img.center;
    [_img addSubview: indicator];
    [indicator startAnimating];
    
//    dispatch_queue_t processQueue_2 = dispatch_queue_create("PROCESS_QUEUE", NULL);
//    
//    dispatch_async(processQueue_2, ^{
//        
//       // Do Something
//        
//        NSURL *img_url = [NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/commons/3/37/2008-1115-003-MissionCollege.jpg"];
//        NSData *img_data = [NSData dataWithContentsOfURL:img_url];
//        _img.image = [UIImage imageWithData:img_data];
//        
//        [indicator stopAnimating];
//        indicator.hidden = YES;
//        
//    });
    
    NSURL *data_url = [NSURL URLWithString:@"http://52.6.19.49/mission_cpttm/mission.php"];
    NSData *data = [NSData dataWithContentsOfURL:data_url];
    NSError *error;
    
    NSJSONSerialization *json_data = [NSJSONSerialization JSONObjectWithData:data
                                                                     options:NSJSONReadingMutableLeaves
                                                                       error:&error];
    
    
    NSDictionary *data_dic = (NSDictionary*) json_data;
    
//    NSLog(@"%@", data_dic);
    
    NSArray *data_ary = [data_dic objectForKey:@"data"];
    
    
    NSLog(@"%@", data_ary);
    
    
    
    
    
    
    
    
    

    
    
    
    
}



















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
