//
//  NetworkDataViewController.m
//  Demo_20151015
//
//  Created by bryant on 15/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import "NetworkDataViewController.h"

@interface NetworkDataViewController ()

@end

@implementation NetworkDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)getStringFromURL:(id)sender {
    
//    NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
    NSError *e;
//    NSString *html = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&e];
//    
//    _stringData.text = html;
    NSURL *url = [NSURL URLWithString:@"http://52.6.19.49/mission_cpttm/mission.php"];
    NSData *data =[NSData dataWithContentsOfURL:url];
    
    NSJSONSerialization *JSONSerialization = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&e];
    
    NSDictionary *missions_data = (NSDictionary*)JSONSerialization;
    NSArray *missions = [missions_data objectForKey:@"data"];
    
    
    _stringData.text = [[missions objectAtIndex:0] objectForKey:@"name"];
    
    
}

- (IBAction)getImageFromURL:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"http://blogs-images.forbes.com/olliebarder/files/2015/07/gundam_licensed_new.jpg"];
    NSData *img_data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [UIImage imageWithData:img_data];
    
    _networkImage.image = img;

    
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
