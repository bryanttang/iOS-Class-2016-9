//
//  MissionDetailViewController.m
//  SpaceBattle
//
//  Created by bryant on 15/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import "MissionDetailViewController.h"

@interface MissionDetailViewController ()

@end

@implementation MissionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.tabBarController.tabBar.hidden = YES;
    _name.text = [mission objectForKey:@"name"];
    _level.text = [NSString stringWithFormat:@"Level: %@", [mission objectForKey:@"level"]];
    _desp.text = [mission objectForKey:@"description"];
}

-(void)setup:(NSDictionary*)mission_{
    mission = mission_;
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.center = CGPointMake(165, 370);
    [indicator startAnimating];
    [self.view addSubview:indicator];
    dispatch_queue_t processQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(processQueue, ^{
        //Do something
        NSURL *url = [NSURL URLWithString:[mission objectForKey:@"img"]];
        NSData *img_data = [NSData dataWithContentsOfURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            _img.image = [UIImage imageWithData:img_data];
            [indicator stopAnimating];
            [indicator removeFromSuperview];
        });
        
        
    });

}

- (IBAction)startMission:(id)sender {
    
    [self.navigationController.tabBarController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
