//
//  MissionMapViewController.h
//  SpaceBattle
//
//  Created by bryant on 6/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MissionMapViewController : UIViewController <MKMapViewDelegate, UIAlertViewDelegate>
{
    NSArray *missions;
    UIImageView *player;
    CGFloat player_lat;
    CGFloat player_lon;
    UIButton *getMission_btn;
    NSDictionary *mission_s;
    
}
@property (strong, nonatomic) IBOutlet MKMapView *myMap;
@end
