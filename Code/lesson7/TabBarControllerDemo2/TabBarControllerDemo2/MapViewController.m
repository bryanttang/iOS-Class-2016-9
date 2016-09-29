//
//  MapViewController.m
//  TabBarControllerDemo2
//
//  Created by bryant on 6/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController
- (IBAction)clickToJapan:(id)sender {
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(35.707612, 139.728778);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.008, 0.005);
    MKCoordinateRegion theRegion = MKCoordinateRegionMake(coord, span);
    _myMap.region = theRegion;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(22.192344, 113.542096);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.008, 0.005);
    MKCoordinateRegion theRegion = MKCoordinateRegionMake(coord, span);
    _myMap.region = theRegion;
    
    _myMap.delegate = self;
    
    MKPointAnnotation *pin1 = [[MKPointAnnotation alloc] init];
    pin1.coordinate = CLLocationCoordinate2DMake(22.189200, 113.544274);
    pin1.title = @"新葡京";
    
    [_myMap addAnnotation:pin1];
    
    
    
}


- (MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    MKAnnotationView *customAnnotation = [[MKAnnotationView  alloc] init];
    customAnnotation.annotation =annotation;
    customAnnotation.image = [UIImage imageNamed:@"mission_icon"];
    customAnnotation.canShowCallout = YES;
    
    UIImageView *myHeadImg = [[UIImageView alloc]
                              initWithImage:[UIImage imageNamed:@"mission_img"]];
    customAnnotation.leftCalloutAccessoryView = myHeadImg;
 
    return customAnnotation;
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
