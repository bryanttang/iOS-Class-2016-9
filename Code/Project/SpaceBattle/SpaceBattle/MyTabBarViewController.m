//
//  MyTabBarViewController.m
//  SpaceBattle
//
//  Created by bryant on 6/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import "MyTabBarViewController.h"

@interface MyTabBarViewController ()

@end

@implementation MyTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton * exit = [UIButton buttonWithType:UIButtonTypeCustom];
    exit.frame = CGRectMake(self.view.frame.size.width - 90, 20, 80, 38);
    exit.layer.cornerRadius = 19;
    exit.backgroundColor = [UIColor colorWithRed:0.9 green:0.2 blue:0.2 alpha:0.6];
    exit.titleLabel.font = [UIFont systemFontOfSize:12];
    [exit setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    [exit setTitle:@"Close" forState:UIControlStateNormal];
    [exit addTarget:self action:@selector(backToPresented:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:exit];
    
}

- (void)backToPresented:(id)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
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
