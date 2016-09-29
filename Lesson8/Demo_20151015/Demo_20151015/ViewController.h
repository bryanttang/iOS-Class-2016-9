//
//  ViewController.h
//  Demo_20151015
//
//  Created by bryant on 15/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>{

    CLLocationManager *locationManager;
    
    MKPointAnnotation *pin;
}
@property (strong, nonatomic) IBOutlet MKMapView *myMap;



@end

