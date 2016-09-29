//
//  SelectShipViewController.m
//  SpaceBattle
//
//  Created by bryant on 17/9/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import "SelectShipViewController.h"
#import "ViewController.h"

@interface SelectShipViewController ()

@end

@implementation SelectShipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    ships = @[@{@"id":@"1",
                @"name":@"XFA-11 SERIES",
                @"desp":@"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                @"img":@"ship2",
                @"img_f":@"ship2_f",
                @"img_b":@"ship2_b",
                @"img_l":@"ship2_l",
                @"img_r":@"ship2_r"},
              
              @{@"id":@"2",
                @"name":@"MFA-11 SERIES",
                @"desp":@"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                @"img":@"ship3_b",
                @"img_f":@"ship3_f",
                @"img_b":@"ship3_b",
                @"img_l":@"ship3_l",
                @"img_r":@"ship3_r"},
              
              @{@"id":@"3",
                @"name":@"MA-AS KILLER",
                @"desp":@"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                @"img":@"ship4",
                @"img_f":@"ship4_f",
                @"img_b":@"ship4_b",
                @"img_l":@"ship4_l",
                @"img_r":@"ship4_r"}
              ];
    
    s_name.text = [[ships objectAtIndex:0] objectForKey:@"name"];
    s_desp.text = [[ships objectAtIndex:0] objectForKey:@"desp"];
    s_img1.image = [UIImage imageNamed:[[ships objectAtIndex:0] objectForKey:@"img"]];
    s_img2.image = [UIImage imageNamed:[[ships objectAtIndex:0] objectForKey:@"img_l"]];
    s_img3.image = [UIImage imageNamed:[[ships objectAtIndex:0] objectForKey:@"img_r"]];
}



- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [ships count];
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 70.0;
}

- (UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UIView *content = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 70)];
    content.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.7];
    
    //UIImageView
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[[ships objectAtIndex:row] objectForKey:@"img"]]];
    
    img.frame = CGRectMake(60, 0, 30, 30*532/225);
    [content addSubview:img];
    
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, 200, 20)];
    name.text = [[ships objectAtIndex:row] objectForKey:@"name"];
    name.textColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    name.shadowColor = [UIColor colorWithRed:0.0 green:0.9 blue:0.8 alpha:1.0];
    name.shadowOffset = CGSizeMake(1, 1);
    
    [content addSubview:name];
    
    
    UILabel *desp = [[UILabel alloc] initWithFrame:CGRectMake(120, 25, 200, 40)];
    desp.text = [[ships objectAtIndex:row] objectForKey:@"desp"];
    desp.numberOfLines = 2;
    desp.font = [UIFont systemFontOfSize:11];
    desp.textColor = [UIColor colorWithWhite:1.0 alpha:1.0];

    
    [content addSubview:desp];
    
    
    return content;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [[ships objectAtIndex:row] objectForKey:@"name"];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    s_name.text = [[ships objectAtIndex:row] objectForKey:@"name"];
    s_desp.text = [[ships objectAtIndex:row] objectForKey:@"desp"];
    s_img1.image = [UIImage imageNamed:[[ships objectAtIndex:row] objectForKey:@"img"]];
    s_img2.image = [UIImage imageNamed:[[ships objectAtIndex:row] objectForKey:@"img_l"]];
    s_img3.image = [UIImage imageNamed:[[ships objectAtIndex:row] objectForKey:@"img_r"]];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.identifier isEqualToString:@"TO_PLAY_VIEW"]) {
        NSInteger idx = [shipList selectedRowInComponent:0];
        ViewController *play = (ViewController*)segue.destinationViewController;
        play.bundle = [[ships objectAtIndex:idx] copy];
        
    }

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
