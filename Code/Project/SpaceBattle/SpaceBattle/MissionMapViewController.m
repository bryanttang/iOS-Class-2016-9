//
//  MissionMapViewController.m
//  SpaceBattle
//
//  Created by bryant on 6/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import "MissionMapViewController.h"
#import <MapKit/MapKit.h>
#import "MissionDetailViewController.h"

@interface MissionMapViewController ()

@end

@implementation MissionMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    // Do any additional setup after loading the view.
    
    _myMap.delegate = self;
    
    
    MKCoordinateRegion theRegion = _myMap.region;
    
    theRegion.center.latitude = 22.192344;
    theRegion.center.longitude = 113.542096;
    
    theRegion.span.longitudeDelta *= 0.0001;
    theRegion.span.latitudeDelta *= 0.0001;
    
    _myMap.region = theRegion;

    player_lat = 22.192344;
    player_lon = 113.542096;
    CGPoint player_point = [_myMap convertCoordinate:CLLocationCoordinate2DMake(22.192344, 113.542096) toPointToView:self.view];
    player = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    player.image = [UIImage imageNamed:@"target"];
    player.center = player_point;
    
    [_myMap addSubview:player];
    
    getMission_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    getMission_btn.frame = CGRectMake((self.view.frame.size.width - 60)/2, self.view.frame.size.height - 140 , 60, 60);
    [getMission_btn setBackgroundColor:[UIColor colorWithRed:0.9 green:0.2 blue:0.2 alpha:1]];
    [getMission_btn setTitle:@"GET" forState:UIControlStateNormal];
    getMission_btn.layer.cornerRadius = 10;
    
    [getMission_btn addTarget:self action:@selector(getMissions:) forControlEvents:UIControlEventTouchUpInside];
    [_myMap addSubview:getMission_btn];
    
//    MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc] init];
//    myAnnotation.coordinate = CLLocationCoordinate2DMake(22.192344, 113.542096);
//    myAnnotation.title = @"player";
//    
//    [_myMap addAnnotation:myAnnotation];
    
    

}


- (void)getMissions:(id)sender{
    NSURL *url =[NSURL URLWithString:@"http://52.6.19.49/mission_cpttm/mission.php"];  //52.6.19.49/mission_cpttm/mission.php
    NSError *e = [NSError new];
    NSData *json_data = [NSData dataWithContentsOfURL:url];
    NSJSONSerialization *jsonSerialization = [NSJSONSerialization JSONObjectWithData:json_data options:NSJSONReadingAllowFragments error:nil];
    
    NSDictionary *data = (NSDictionary*)jsonSerialization;
    NSLog(@"%@", data);
    missions = [data objectForKey:@"data"];
    
}

- (void)viewWillAppear:(BOOL)animated{
    //Setup Data
//    NSDictionary *mission1 = @{@"name":@"MISSION 1",
//                               @"desp":@"adsfasdf asdf",
//                               @"lat":@"22.197380",
//                               @"lon":@"113.540881"};
//    
//    NSDictionary *mission2 = @{@"name":@"MISSION 2",
//                               @"desp":@"adsfasdf asdf",
//                               @"lat":@"22.200570",
//                               @"lon":@"113.547820"};
//
//    NSDictionary *mission3 = @{@"name":@"MISSION 3",
//                               @"desp":@"adsfasdf asdf",
//                               @"lat":@"22.195101",
//                               @"lon":@"113.544585"};
//    
//    missions = @[mission1, mission2, mission3];

    [self getMissions:nil];
    
    //Add Mission in Map
    for (NSDictionary *mission in missions) {
        
        NSString *name = [mission objectForKey:@"name"];
        CGFloat lat = ((NSString*)[mission objectForKey:@"destination_lat"]).floatValue;
        CGFloat lon = ((NSString*)[mission objectForKey:@"destination_lon"]).floatValue;
        
        MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc] init];
        myAnnotation.coordinate = CLLocationCoordinate2DMake(lat, lon);
        myAnnotation.title = name;

        [_myMap addAnnotation:myAnnotation];
        
    }
   
}


- (MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    MKAnnotationView *customView;
    if ([[annotation title] containsString:@"MISSION"]) {
        customView = [[MKAnnotationView alloc] init];
        customView.annotation = annotation;
        customView.image = [UIImage imageNamed:@"mission_icon"];
        customView.canShowCallout = YES;
        customView.draggable = YES;
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
        [rightButton addTarget:self action:@selector(goToMission:) forControlEvents:UIControlEventTouchUpInside];
        rightButton.tag = [missions indexOfObjectPassingTest:^BOOL(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([[obj objectForKey:@"name"] containsString:[annotation title]] ) {
                return YES;
            }
            return NO;
        }];
        customView.rightCalloutAccessoryView = rightButton;
        
        UIImageView *myHeadImg = [[UIImageView alloc]
                                  initWithImage:[UIImage imageNamed:@"mission_img"]];
        customView.leftCalloutAccessoryView = myHeadImg;
        
    }
    if ([[annotation title] containsString:@"player"]) {
        customView = [[MKAnnotationView alloc] init];
        customView.annotation = annotation;
        customView.image = [UIImage imageNamed:@"ship_icon"];
        customView.canShowCallout = YES;
        customView.draggable = YES;
    }
    
    
    return customView;

}

- (void)goToMission:(UIButton*)sender{
    CGFloat lat = ((NSString*)[[missions objectAtIndex:sender.tag] objectForKey:@"destination_lat"]).floatValue;
    CGFloat lon = ((NSString*)[[missions objectAtIndex:sender.tag] objectForKey:@"destination_lon"]).floatValue;
    CGPoint player_point = [_myMap convertCoordinate:CLLocationCoordinate2DMake(lat, lon) toPointToView:self.view];
    player_lat = lat;
    player_lon = lon;
    
    mission_s = [missions objectAtIndex:sender.tag];
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        player.center = player_point;
    } completion:^(BOOL finished) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Do you want?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"YES", nil];
        alert.delegate = self;
        [alert show];
    }];
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    CGPoint player_point = [_myMap convertCoordinate:CLLocationCoordinate2DMake(player_lat, player_lon) toPointToView:self.view];
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        player.center = player_point;
    } completion:^(BOOL finished) {
      
    }];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        MissionDetailViewController *detail = (MissionDetailViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"mission_detail"];
       
        [detail setup:mission_s];
        [self.navigationController pushViewController:detail animated:YES];
    }
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
