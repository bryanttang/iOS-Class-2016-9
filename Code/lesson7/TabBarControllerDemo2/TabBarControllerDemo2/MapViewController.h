//
//  MapViewController.h
//  TabBarControllerDemo2
//
//  Created by bryant on 6/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *myMap;

@end
