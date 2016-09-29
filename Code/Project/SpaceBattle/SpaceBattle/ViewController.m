//
//  ViewController.m
//  SpaceBattle
//
//  Created by bryant on 15/9/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import "ViewController.h"
#import "Enemy.h"
#import "RecordTableViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self setupData];
    bullets = [NSMutableArray new];
    
    [self setupBg];
    [self setupSound];
    [self setupScore];
    [self setupTouchEvent];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [self setupComponent];
    [self setupFunctionLayout];
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    
    enemyGenerate = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(enemyGenerate:) userInfo:nil repeats:YES];
    
}

-(void)setupSound{
    NSString *path = [NSString stringWithFormat:@"%@/bullet_3.wav", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    NSError *e;
    bulletSound = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:&e];

    NSString *path2 = [NSString stringWithFormat:@"%@/bomb_1.wav", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl2 = [NSURL fileURLWithPath:path2];
    NSError *e2;
    explodeSound = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl2 error:&e2];
    
    
//    NSURL *audioFileLocationURL = [[NSBundle mainBundle] URLForResource:@"bullet_1" withExtension:@"wav"];
//    NSError *error;
//    bulletSound = [[AVAudioPlayer alloc] initWithContentsOfURL:audioFileLocationURL error:&error];
}

- (void)setupScore{
    CALayer *bg_score = [CALayer layer];
    bg_score.frame =CGRectMake(self.view.frame.size.width -160, 30, 190, 40);
    bg_score.backgroundColor = [[UIColor colorWithWhite:0.6 alpha:0.7] CGColor];
    bg_score.cornerRadius = 20;
    [self.view.layer addSublayer:bg_score];
    
    UILabel *score_l = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width -150, 30, 180, 40)];
    score_l.text = @"Score:";
    score_l.textColor = [UIColor colorWithRed:0 green:0.9 blue:0 alpha:1.0];
    [self.view addSubview:score_l];
    
    score_display = [[UILabel alloc] initWithFrame:CGRectMake(70, 5, 100, 30)];
    score_display.text = @"00000";
    score_display.textColor = [UIColor colorWithRed:0 green:0.9 blue:0 alpha:1.0];
    [score_l addSubview:score_display];
}

- (void)setupTouchEvent{

    UISwipeGestureRecognizer *swipe_l = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToSwipe:)];
    
    swipe_l.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipe_l];
    
    UISwipeGestureRecognizer *swipe_r = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToSwipe:)];
    
    swipe_r.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe_r];
    
    
    UISwipeGestureRecognizer *swipe_f = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToSwipe:)];
    
    swipe_f.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipe_f];
    
    UISwipeGestureRecognizer *swipe_b = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToSwipe:)];
    
    swipe_b.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipe_b];
}

- (void)bulletMove:(NSTimer*)timer{
    Enemy* e1 = (Enemy*)timer.userInfo;
    
    CGRect ef = [[e1.layer presentationLayer] frame];
    [bullets enumerateObjectsUsingBlock:^(Bullet *b, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGRect bf = [[b.layer presentationLayer] frame];
        //NSLog(@"%g, %g", bf.origin.x, bf.origin.y);
    
        if (CGRectContainsPoint(ef, CGPointMake(bf.origin.x, bf.origin.y)) ||
            CGRectContainsPoint(ef, CGPointMake(bf.origin.x+30, bf.origin.y)) ){
            //NSLog(@"explode");
            [self playExplodeSound];
            
            [e1 destoried];
            
            [timer invalidate];
            
            int score_cur = score_display.text.intValue;
            score_display.text = [NSString stringWithFormat:@"%04d", score_cur + 20];
            [enemys removeObject:e1];
        }
        
    }];
}

- (void)enemyGenerate:(id)sender{
    
    Enemy * e1 = [[Enemy alloc] initWithFrame:CGRectMake(50, 40, 35, 35)];
    [e1 setupAEnemyWithName:@"X12"
                       Desp:@"asdf"
                     Ship_n:@"enemy1"
                     Ship_f:@""
                     Ship_b:@""
                     Ship_l:@""
                     Ship_r:@""];
    [enemys addObject:e1];
    
    [self.view addSubview:e1];
    
    [e1 move];
    
    [NSTimer scheduledTimerWithTimeInterval:0.04 target:self selector:@selector(bulletMove:) userInfo:e1 repeats:YES];

}


- (void)setupFunctionLayout{

    UIButton *fire = [UIButton buttonWithType:UIButtonTypeCustom];
    fire.frame = CGRectMake(10, self.view.frame.size.height - 80, 60, 60);
    fire.backgroundColor = [UIColor colorWithRed:0.9 green:0.2 blue:0.2 alpha:0.8];
    fire.layer.cornerRadius = 25;
    fire.clipsToBounds = YES;
    [fire setImage:[UIImage imageNamed:@"target"] forState:UIControlStateNormal];
    [fire addTarget:self action:@selector(fire:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fire];
    
    UIButton *end = [UIButton buttonWithType:UIButtonTypeCustom];
    end.frame = CGRectMake(self.view.frame.size.width - 70, self.view.frame.size.height - 80, 60, 60);
    end.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.2 alpha:0.8];
    end.layer.cornerRadius = 25;
    end.clipsToBounds = YES;
    [end setTitle:@"Stop" forState:UIControlStateNormal];
    end.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondonsedBlod" size:14];
    [end addTarget:self action:@selector(endGame:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:end];
    
}


- (void)setupComponent{
    
    [self setupShip];
    [self setupEnemy];

}



- (void)setupShip{
    if (ship == nil) {
        ship = [[Ship alloc] initWithFrame:CGRectMake(self.view.frame.size.width /2 - 20, self.view.frame.size.height - 130, 120*225/523, 120)];
        [ship setupAShipWithName:[_bundle objectForKey:@"name"]
                            Desp:[_bundle objectForKey:@"desp"]
                          Ship_n:[_bundle objectForKey:@"img"]
                          Ship_f:[_bundle objectForKey:@"img_f"]
                          Ship_b:[_bundle objectForKey:@"img_b"]
                          Ship_l:[_bundle objectForKey:@"img_l"]
                          Ship_r:[_bundle objectForKey:@"img_r"]];
        
        [self.view addSubview:ship];

    }
}

- (void)setupEnemy{
    [enemys enumerateObjectsUsingBlock:^(Enemy *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    enemys = [NSMutableArray new];
    
//    e1 = [[Enemy alloc] initWithFrame:CGRectMake(50, 40, 35, 35)];
//    [e1 setupAEnemyWithName:@"X12"
//                       Desp:@"asdf"
//                     Ship_n:@"enemy1"
//                     Ship_f:@""
//                     Ship_b:@""
//                     Ship_l:@""
//                     Ship_r:@""];
//    [self.view addSubview:e1];
//    
//    [e1 move];

}

#pragma mark - sound
- (void)playBulletSound{
    [bulletSound stop];
    [bulletSound play];
}

- (void)playExplodeSound{
    [explodeSound stop];
    [explodeSound play];
}

#pragma mark - Functions
- (void)fire:(id)sender{
//    [e1 destoried];
    
    //play sound
    [self playBulletSound];
    
    Bullet *b1 = [[Bullet alloc] initWithFrame:CGRectMake(ship.frame.origin.x + ship.frame.size.width/2-18 , ship.frame.origin.y, 37, 30)];
    [bullets addObject:b1];
    [b1 setupABulletWithName:@"N12" view:@"bullet" speed:10];
    [self.view addSubview:b1];
    [b1 fire];
    
}

- (void)endGame:(id)sender{

    //
    RecordTableViewController *record = [self.storyboard instantiateViewControllerWithIdentifier:@"RecordViewController"];
    record.bundle = @{@"score":score_display.text, @"ship":self.bundle};
    [self presentViewController:record animated:YES completion:^{
        
    }];
    
}

//- (void)setupData{
//    
//    ships = @[@{@"id":@"1",
//                @"name":@"XFA-11 SERIES",
//                @"desp":@"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
//                @"img":@"ship2",
//                @"img_f":@"ship2_f",
//                @"img_b":@"ship2_b",
//                @"img_l":@"ship2_l",
//                @"img_r":@"ship2_r"},
//              
//              @{@"id":@"2",
//                @"name":@"MFA-11 SERIES",
//                @"desp":@"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
//                @"img":@"ship3_b",
//                @"img_f":@"ship3_f",
//                @"img_b":@"ship3_b",
//                @"img_l":@"ship3_l",
//                @"img_r":@"ship3_r"},
//              
//              @{@"id":@"3",
//                @"name":@"MA-AS KILLER",
//                @"desp":@"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
//                @"img":@"ship4",
//                @"img_f":@"ship4_f",
//                @"img_b":@"ship4_b",
//                @"img_l":@"ship4_l",
//                @"img_r":@"ship4_r"}
//              ];
//}


- (void) setupBg{
    
    
    bg_up = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"space_bg"]];
    bg_up.frame = CGRectMake(0, -self.view.frame.size.height , self.view.frame.size.height * 1320/1495 , self.view.frame.size.height) ;
    bg_up.tag = 1;
    [self.view addSubview:bg_up];
    
    bg_down = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"space_bg"]];
    bg_down.frame = CGRectMake(0, 0 , self.view.frame.size.height * 1320/1495 , self.view.frame.size.height) ;
    [self.view addSubview:bg_down];
    bg_down.tag = 0;
    
    bg_timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveBg:) userInfo:nil repeats:YES];

}


- (void)addOption{
    
    
    
}


- (void)moveBg:(id)sender{
    if (bg_count == self.view.frame.size.height-1) {
        if (bg_up.tag == 1) {
            bg_down.frame = CGRectMake(0, -self.view.frame.size.height , self.view.frame.size.height * 1320/1495 , self.view.frame.size.height) ;
            bg_down.tag = 1;
            bg_up.tag = 0;
        }else if (bg_down.tag == 1) {
            bg_up.frame = CGRectMake(0, -self.view.frame.size.height , self.view.frame.size.height * 1320/1495 , self.view.frame.size.height) ;
            bg_down.tag = 0;
            bg_up.tag = 1;
            
        }
        
        bg_count = 0;
        
    }
    
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        CGRect frame1 = bg_up.frame;
        frame1.origin = CGPointMake(frame1.origin.x, frame1.origin.y+1);
        bg_up.frame = frame1;
        
        CGRect frame2 = bg_down.frame;
        frame2.origin = CGPointMake(frame2.origin.x, frame2.origin.y+1);
        bg_down.frame = frame2;
        
    } completion:^(BOOL finished) {
        bg_count ++;
    }];
}


- (void)respondsToLongPress:(UILongPressGestureRecognizer*)longPress{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        NSLog(@"LongPress");
        //Reload
        UIImageView *bullet = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bullet"]];
        bullet.frame = CGRectMake(spaceShip.frame.origin.x + spaceShip.frame.size.width/2 - 10, spaceShip.frame.origin.y + 5, 20, 10);
        
        [self.view addSubview:bullet];
        
        
        //Fire
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            bullet.transform = CGAffineTransformMakeTranslation(0, -bullet.frame.origin.y);
        } completion:^(BOOL finished) {
            [bullet removeFromSuperview];
        }];
    }
    
    
    
}


- (void) respondsToSwipe:(UISwipeGestureRecognizer*)swipe{
    NSLog(@"Swipe");
    NSInteger index = ((NSString*)[_setting objectForKey:@"ship"]).integerValue ;
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        [ship leftShift:40];
        
    }else if (swipe.direction == UISwipeGestureRecognizerDirectionRight){
        [ship rightShift:40];

    }else if (swipe.direction == UISwipeGestureRecognizerDirectionUp){
        [ship forward:50.0];

    }else if (swipe.direction == UISwipeGestureRecognizerDirectionDown){
        [ship backward:50.0];
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
