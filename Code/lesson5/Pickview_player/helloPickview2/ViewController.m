//
//  ViewController.m
//  helloPickview2
//
//  Created by bryant on 23/7/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface ViewController ()
{
    BOOL play_f;
    float play_t;
    AVAudioPlayer *newPlayer;

    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ary_options = @[@"Sugar", @"B.Mars", @"Love story"];
    ary_song = @[@"song", @"song2", @"song3"];
    
    NSInteger index = [_singerPicker selectedRowInComponent:0];
    
    NSString *temp = [ary_options objectAtIndex:index];
    _head.clipsToBounds = YES;
    _head.layer.shadowColor = [[UIColor colorWithWhite:0.2 alpha:1.0] CGColor];
    _head.layer.shadowOffset = CGSizeMake(2, 2);
    _head.layer.shadowOpacity = 0.7;
    _head.layer.shadowRadius = 2;
    _head.layer.cornerRadius = 50;
    _head.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d", 1]];

    _head.layer.borderColor = [[UIColor colorWithWhite:0.9 alpha:0.5] CGColor];
    _head.layer.borderWidth = 5.0;
    
    _play.text = [NSString stringWithFormat:@"<%@>" , temp];
    play_f = false;
    
    
    play_t = 0.0;
    
    
    [self configAVAudioPlayer:@"song"];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return ary_options.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [ary_options objectAtIndex:row];

}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"");
    
    [self configAVAudioPlayer:[ary_song objectAtIndex:row]];
    
    [UIView animateWithDuration:0.1 animations:^{
        _head.alpha = 0.0;
    } completion:^(BOOL finished) {
        _play.text = [NSString stringWithFormat:@"<%@>", [ary_options objectAtIndex:row]];
        _head.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d", (int)(row+1)]];
        [UIView animateWithDuration:0.3 animations:^{
            _head.alpha = 1.0;
        } completion:^(BOOL finished) {
            
        }];
    }];
   
    
    
    [timer invalidate];
    timer = nil;
    _slider.value = 0.0;
    play_t = 0.0;
    play_f = false;
    _head.transform = CGAffineTransformIdentity;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 60.0;
}

- (UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{

    UIView* newView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, 60)];
    //newView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(40, 6, 58, 46)];
    img.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d", (int)(row+1)]];
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, 100, 40)];
    name.text = [ary_options objectAtIndex:row];
    
    [newView addSubview:img];
    [newView addSubview:name];
    
    return newView;
    
}
- (IBAction)clickStop:(id)sender {
//    [sender setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    play_f = false;
    
    //reset slider bar
    [timer invalidate];
    timer = nil;
    _slider.value = 0.0;
    play_t = 0.0;
    _head.transform = CGAffineTransformIdentity;
    
    [newPlayer stop];
    
}

- (IBAction)clickPause:(id)sender {
    
    [newPlayer pause];
    
//    [sender setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    play_f = false;
    
    //Pause slider bar
    [timer invalidate];
    timer = nil;
    
    
    
}

- (IBAction)clickPlay:(UIButton*)sender{
    
    [newPlayer play];
    
    if (play_f == false) {
        [sender setBackgroundImage:[UIImage imageNamed:@"play_a"] forState:UIControlStateNormal];
        play_f = true;
        
        if (timer == nil) {
            timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updateSlider:) userInfo:nil repeats:YES];
        }else{
            
        }
    }
}


- (void)updateSlider:(id)sender{
    if (_slider.value <1-play_t) {
        _slider.value += 1/3600.0;
        
        [UIView animateWithDuration:0.05 animations:^{
            _head.transform = CGAffineTransformRotate(_head.transform, M_1_PI/180*40);
        } completion:^(BOOL finished) {
            
        }];
        
        
    }else{
        [timer invalidate];
    }
    
}


- (void)configAVAudioPlayer:(NSString*)song{
    
    NSString *soundFilePath =
    [[NSBundle mainBundle] pathForResource: song
                                    ofType: @"mp3"];
    
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
    
    newPlayer =
    [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL
                                           error: nil];
    
    newPlayer.delegate = self;
    newPlayer.volume = 0.5;
    [newPlayer setNumberOfLoops:2];
    [newPlayer prepareToPlay];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
