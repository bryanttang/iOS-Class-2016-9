//
//  ViewController.m
//  helloPickview
//
//  Created by bryant on 22/9/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myPickerView.delegate = self;
    _myPickerView.dataSource = self;
    
    
    NSDictionary * person1 = @{@"name":@"peter",
                               @"age":@"18",
                               @"sex":@"male",
                               @"desp":@"asdfasd asdf asd as"};
    
    NSDictionary * person2 = @{@"name":@"Bryant",
                               @"age":@"20",
                               @"sex":@"male",
                               @"desp":@"asdfasd asdf asd as"};
    
    NSDictionary * person3 = @{@"name":@"Sue",
                               @"age":@"23",
                               @"sex":@"female",
                               @"desp":@"asdfasd asdf asd as"};
    
    
    myfirends = @[person1, person2, person3];
    
    
    
    
    
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return myfirends.count;
}

//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    NSString *title;
//    
//    title = [options objectAtIndex:row];
//    
//    
//    return title;
//}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 70;

}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UIView *content = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    
    
//    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(20, 5, 30, 30)];
//    img.image = [UIImage imageNamed:@""];
//    img.backgroundColor = [UIColor redColor];
//    [content addSubview:img];
    
    NSDictionary *person = [myfirends objectAtIndex:row];
    
    
    //NAME
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 100, 20)];
    name.text = [person objectForKey:@"name"];
    [content addSubview:name];
    
    //SEX
    UILabel *sex = [[UILabel alloc] initWithFrame:CGRectMake(20, 25, 100, 20)];
    sex.text = [person objectForKey:@"sex"];
    [content addSubview:sex];
    
    //AGE
    UILabel *age = [[UILabel alloc] initWithFrame:CGRectMake(130, 5, 50, 50)];
    age.text = [person objectForKey:@"age"];
    [content addSubview:age];
    
        
    return content;
}




















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
