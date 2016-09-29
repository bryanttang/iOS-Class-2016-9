//
//  ViewController.h
//  HelloMap
//
//  Created by bryant tang on 4/29/15.
//  Copyright (c) 2015 CPTTM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    MKPointAnnotation *ironMan;
}
@property (strong, nonatomic) IBOutlet MKMapView *myMap;


@end

