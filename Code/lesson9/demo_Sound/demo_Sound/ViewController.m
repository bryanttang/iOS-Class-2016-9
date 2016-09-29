//
//  ViewController.m
//  demo_Sound
//
//  Created by bryant on 19/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController (){
    AVAudioPlayer *newPlayer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self configSystemSoundPlayer];
    [self configAVAudioPlayer];
    
    
}

- (void)configSystemSoundPlayer{
    // Get the main bundle for the app
    CFBundleRef mainBundle = CFBundleGetMainBundle ();
    
    // Get the URL to the sound file to play. The file in this case
    // is "tap.aif"
    _soundFileURLRef  = CFBundleCopyResourceURL (
                                                 mainBundle,
                                                 CFSTR ("bomb_1"),
                                                 CFSTR ("wav"),
                                                 NULL
                                                 );
    
    // Create a system sound object representing the sound file
    AudioServicesCreateSystemSoundID (
                                      _soundFileURLRef,
                                      &_soundFileObject
                                      );
}

- (void)configAVAudioPlayer{
    
    NSString *soundFilePath =
    [[NSBundle mainBundle] pathForResource: @"bg_sound"
                                    ofType: @"wav"];
    
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
    
    newPlayer =
    [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL
                                           error: nil];
    
    newPlayer.delegate = self;
    newPlayer.volume = 0.5;
    [newPlayer setNumberOfLoops:2];
    [newPlayer prepareToPlay];
    
    
}

- (IBAction)playSystemSound:(id)sender {
    
    AudioServicesPlaySystemSound (self.soundFileObject);
}


- (IBAction)playSound:(id)sender {
    [newPlayer play];
    UIButton *btn = (UIButton*)sender;
    [btn setTitle:@"Play" forState:UIControlStateNormal];
}

- (IBAction)clickPause:(id)sender {
    [newPlayer pause];
    
}
- (IBAction)clickResume:(id)sender {
    [newPlayer play];
}

- (IBAction)changeVolume:(id)sender {
    UISlider *slider = (UISlider*) sender;
    newPlayer.volume = slider.value;
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    if (flag == YES) {
        NSLog(@"Finish");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
