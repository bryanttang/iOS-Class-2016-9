//
//  MissionDetailViewController.m
//  DemoGoogleMapSDK
//
//  Created by bryant on 13/8/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import "MissionDetailViewController.h"
#import "MapViewController.h"

@interface MissionDetailViewController ()

@end

@implementation MissionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _name.text = [_bundle objectForKey:@"name"];
    _description_text.text = [_bundle objectForKey:@"description"];
    
    _img.clipsToBounds = YES;
    _img.layer.cornerRadius = 10;
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.frame = CGRectMake(50, 100, 30, 30);
    [self.view addSubview:indicator];
    [indicator startAnimating];
    
    dispatch_queue_t processQueue_2 = dispatch_queue_create("PROCESS_QUEUE", NULL);
    dispatch_async(processQueue_2, ^{
        
        NSURL *img_url = [NSURL URLWithString:[_bundle objectForKey:@"img"]];
        NSData *img_data = [NSData dataWithContentsOfURL:img_url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (img_data != nil) {
                UIImage *img = [UIImage imageWithData:img_data];
                [_img setImage:img];
                
                [indicator stopAnimating];
                indicator.hidden = YES;
                [indicator removeFromSuperview];
            }
        });
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"startmission"]) {
        MapViewController *mapCV = (MapViewController*) segue.destinationViewController;
        mapCV.bundle = _bundle;
        
    }
}

- (IBAction)clickStart:(id)sender {
    
    
//    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
//    } completion:^(BOOL finished) {
//        
//    }];

//    self.tabBarController.selectedIndex = 1;
//    MapViewController *mapCV = (MapViewController*) self.tabBarController.selectedViewController;
//    mapCV.bundle = @{@"abc":@"ddd"};
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
