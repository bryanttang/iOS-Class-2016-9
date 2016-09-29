//
//  ViewController.m
//  helloPickerView
//
//  Created by bryant on 17/9/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ships = @[@"Bryant AX", @"Tom CE", @"David SS"];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return ships.count;
    }else if (component ==1 ){
        return 2;
    }
    return 0;
    
}


//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    
//    NSString *name = [ships objectAtIndex:row];
//    
//    return name;
//
//}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 80.0;
}


- (UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UIView *content = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    
    UIImageView *ship_img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ship2_f"]];
    
    ship_img.frame = CGRectMake(40, 0, 30, 80);
    
    [content addSubview:ship_img];
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 150, 30)];
    name.text = [ships objectAtIndex:row];
    
    [content addSubview:name];
    
    return content;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    
    _d_name.text = [ships objectAtIndex:row];
    
    
}




















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
