//
//  MapViewController.m
//  DemoGoogleMapSDK
//
//  Created by bryant on 13/8/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import "MapViewController.h"
#import "PlistManager.h"

@import GoogleMaps;

@interface MapViewController ()

@end

@implementation MapViewController{
    GMSMapView *mapView_;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    state = 0;
    
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    locationManager.distanceFilter = 50;
    
    [locationManager startUpdatingLocation];
    
    
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:22.191986
                                                            longitude:113.542140
                                                                 zoom:14];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    mapView_.settings.consumesGesturesInView = NO; // UserInteract
    self.view = mapView_;
    
    
    [self loadMission];
    
    if (_bundle != nil) {
        UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
        close.frame = CGRectMake(20, 20, 40, 40);
        [close setTitle:@"X" forState:UIControlStateNormal];
        [close setBackgroundColor:[UIColor colorWithRed:1 green:0.2 blue:0.2 alpha:0.7]];
        close.clipsToBounds = YES;
        close.layer.cornerRadius = 20;
        [close addTarget:self action:@selector(clickClose:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:close];
        
    }
    
    clock = [[UILabel alloc] initWithFrame:CGRectMake(110, 20, 150, 80)];
    clock.text = @"00:00";
    clock.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
    clock.textColor = [UIColor colorWithRed:0.9 green:0.2 blue:0.2 alpha:0.9];
    clock.textAlignment = NSTextAlignmentCenter;
    clock.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:50];
    clock.clipsToBounds = YES;
    clock.layer.cornerRadius = 10;
    [self.view addSubview:clock];
    
    UIView *cover = [[UIView alloc] initWithFrame:CGRectMake(0, 480, 400, 300)];
    cover.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.9];
    [self.view addSubview:cover];
    
    running_bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"running_bg"]];
    running_bg.frame = CGRectMake(150, 490, 50, 50);
    [self.view addSubview:running_bg];
    
    UIImageView *running_runner = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"running_runner"]];
    running_runner.frame = CGRectMake(150, 490, 50, 50);
    [self.view addSubview:running_runner];
    
    
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    startBtn.frame = CGRectMake(110, 550, 140, 50);
    [startBtn setTitle:@"Start Mission" forState:UIControlStateNormal];
    [startBtn setBackgroundColor:[UIColor colorWithRed:1 green:0.9 blue:0.2 alpha:0.7]];
    startBtn.clipsToBounds = YES;
    startBtn.layer.cornerRadius = 25;
    [startBtn addTarget:self action:@selector(clickStartMission:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:startBtn];

    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(260, 550, 50, 50);
    [cancelBtn setTitle:@"X" forState:UIControlStateNormal];
    [cancelBtn setBackgroundColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.7]];
    cancelBtn.clipsToBounds = YES;
    cancelBtn.layer.cornerRadius = 25;
    [cancelBtn addTarget:self action:@selector(clickCancelMission:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:cancelBtn];
    

//    // Creates a marker in the center of the map.
//    GMSMarker *marker = [[GMSMarker alloc] init];
//    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
//    marker.title = @"Sydney";
//    marker.snippet = @"Australia";
//    marker.map = mapView_;
//    
//    
//    GMSMutablePath *path = [GMSMutablePath path];
//    [path addCoordinate:CLLocationCoordinate2DMake(-33.90, 151.00)];
//    [path addCoordinate:CLLocationCoordinate2DMake(-33.90, 151.40)];
//    [path addCoordinate:CLLocationCoordinate2DMake(-33.70, 151.40)];
//    [path addCoordinate:CLLocationCoordinate2DMake(-33.70, 151.00)];
//    [path addCoordinate:CLLocationCoordinate2DMake(-33.90, 151.00)];
//    
//    GMSPolyline *rectangle = [GMSPolyline polylineWithPath:path];
//    rectangle.map = mapView_;
//    
//    
//    mapView_.settings.consumesGesturesInView = NO;
//    
//    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToLongPress:)];
//    
//    [mapView_ addGestureRecognizer:longPress];
    
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"%@", _bundle);
}


- (void) clickClose:(id)sender{
    NSLog(@"Close");
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];

}


- (void) clickCancelMission:(id)sender{
    UIAlertView *stopAlert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Mission Cancel" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    [stopAlert show];
}


- (void) clickStartMission:(id)sender{
    if (timer == nil) {
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateClock:) userInfo:nil repeats:YES];
        second = 0;
    }
    
    if (timer2 == nil) {
        timer2 = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updateRunner:) userInfo:nil repeats:YES];
        running_bg.transform = CGAffineTransformIdentity;
    }
    
    
}

- (void)updateRunner:(id)sender{
    [UIView animateWithDuration:0.05 animations:^{
        running_bg.transform = CGAffineTransformRotate(running_bg.transform, M_1_PI/180*40);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)updateClock:(id)sender{
    second++;
    
    int minute_part = second/60;
    int second_part = second - (second/60) *60;
    clock.text = [NSString stringWithFormat:@"%02d:%02d",minute_part, second_part];
    
    
}

- (void) loadMission{
    
    NSError *error;
    NSURL *url = [NSURL URLWithString:@"http://52.6.19.49/mission_cpttm/mission.php"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSJSONSerialization *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    
    
    NSDictionary *data_dis = (NSDictionary*)json;
    missions = [data_dis objectForKey:@"data"];
    
    [missions enumerateObjectsUsingBlock:^(NSDictionary *mission, NSUInteger idx, BOOL *stop) {
        
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake([[mission objectForKey:@"destination_lat"] doubleValue], [[mission objectForKey:@"destination_lon"] doubleValue]);
        marker.title = [mission objectForKey:@"name"];
        marker.snippet = [NSString stringWithFormat:@"Level: %@", [mission objectForKey:@"level"]];
        marker.icon = [GMSMarker markerImageWithColor:[UIColor orangeColor]];
        marker.map = mapView_;
        
        
        NSMutableDictionary *complete = [NSMutableDictionary dictionaryWithDictionary:[PlistManager readPlist:@"complete"]];
        if (complete != nil) {
            NSString *key = [mission objectForKey:@"id"];
            if ([[complete objectForKey:key] isEqualToString:@"1"]) {
               marker.icon = [GMSMarker markerImageWithColor:[UIColor blueColor]];
            }else{
               marker.icon = [GMSMarker markerImageWithColor:[UIColor orangeColor]];
            }
        }else{
            marker.icon = [GMSMarker markerImageWithColor:[UIColor orangeColor]];
        }

 
    }];
    
    
}

- (void) respondsToLongPress:(UILongPressGestureRecognizer*) recoginzer{
    
    if (recoginzer.state == UIGestureRecognizerStateBegan) {
        CGPoint finger_point = [recoginzer locationInView:mapView_];
        CLLocationCoordinate2D finger_coord = [mapView_.projection coordinateForPoint: finger_point];
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = finger_coord;   //CLLocationCoordinate2DMake(-33.86, 151.20);
        marker.title = @"Me";
        marker.snippet = @"Hey!";
        marker.map = mapView_;
        
    }
}



- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{

    CLLocation* location = [locations lastObject];
    CLLocationCoordinate2D coord = location.coordinate;
    mapView_.camera = [GMSCameraPosition cameraWithLatitude: coord.latitude
                                                  longitude: coord.longitude
                                                       zoom:14];
    
    
    
    if (_bundle != nil) {
        
        CGFloat mlat = [[_bundle objectForKey:@"destination_lat"] doubleValue];
        CGFloat mlon = [[_bundle objectForKey:@"destination_lon"] doubleValue];
        
        if ( sqrt((pow((coord.latitude - mlat) , 2) + pow((coord.longitude - mlon),2))) <= 0.00001 ) {
            UIAlertView *alet = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Mission Complete" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alet show];
            
            [timer invalidate];
            timer = nil;
            [timer2 invalidate];
            timer2 = nil;
            
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
            
            
            NSMutableDictionary *complete = [NSMutableDictionary dictionaryWithDictionary:[PlistManager readPlist:@"complete"]];
            if (complete != nil) {
                
            }else{
                complete = [NSMutableDictionary new];
                
            }
            [complete setObject:@"1" forKey:[_bundle objectForKey:@"id"]];
            [PlistManager writePlist:complete :@"complete"];
        }
        
    }
    
    
}

- (void)resetMission{
    [timer invalidate];
    timer = nil;
    [timer2 invalidate];
    timer2 = nil;
    running_bg.transform = CGAffineTransformIdentity;
    second = 0;
    clock.text = @"00:00";
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex ==1) {
        [self resetMission];
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
