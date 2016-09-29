//
//  ViewController.h
//  helloPickview2
//
//  Created by bryant on 23/7/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <AudioToolbox/AudioToolbox.h>
#include <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, AVAudioPlayerDelegate>
{
    NSArray *ary_options;
    NSArray *ary_song;
    NSTimer *timer;
}
@property (strong, nonatomic) IBOutlet UIPickerView *singerPicker;
@property (strong, nonatomic) IBOutlet UILabel *play;
@property (strong, nonatomic) IBOutlet UIImageView *head;
@property (strong, nonatomic) IBOutlet UISlider *slider;


@property (readwrite)	CFURLRef		soundFileURLRef;
@property (readonly)	SystemSoundID	soundFileObject;

@end

