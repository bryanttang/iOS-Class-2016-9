//
//  MapViewController.h
//  DemoGoogleMapSDK
//
//  Created by bryant on 13/8/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController <CLLocationManagerDelegate, UIAlertViewDelegate>
{
    CLLocationManager *locationManager;
    
    UILabel *clock;
    NSTimer *timer;
    int second;
    
    NSTimer *timer2;
    UIImageView *running_bg;
    
    int state;
    
    NSArray *missions;
    
}

@property (strong) NSDictionary *bundle;
@end
