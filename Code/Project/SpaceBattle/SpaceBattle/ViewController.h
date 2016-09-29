//
//  ViewController.h
//  SpaceBattle
//
//  Created by bryant on 15/9/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ship.h"
#import "Enemy.h"
#import "Bullet.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
{
    //Timer
    NSTimer *enemyGenerate;
//    Enemy *e1;
//    Bullet *b1;

    //Component
    NSMutableArray *bullets;
    NSMutableArray *enemys;
    Ship *ship;
    
    //Play Board
    NSArray *ships;
    IBOutlet UIView *SettingView;
    IBOutlet UIPickerView *OptionList;
    UIImageView *bg_up;
    UIImageView *bg_down;
    UIImageView* spaceShip;
    
    //BG
    NSTimer *bg_timer;
    int bg_count;
    
    //Score
    UILabel *score_display;
    
    
    //Sound
    AVAudioPlayer *bulletSound;
    AVAudioPlayer *explodeSound;
    
    
}
@property (strong) NSDictionary * bundle;
@property (strong, nonatomic)  NSDictionary * setting;
//@property (strong, nonatomic) IBOutlet UIImageView *spaceShip;

@end

