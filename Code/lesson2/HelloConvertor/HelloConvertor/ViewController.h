//
//  ViewController.h
//  HelloConvertor
//
//  Created by bryant on 26/9/2016.
//  Copyright © 2016 cpttm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate>
{
    NSString *input2;
    
    IBOutlet UIButton *convertBtn;
    
}

@property (strong, nonatomic) IBOutlet UITextField *input;
@property (strong, nonatomic) IBOutlet UILabel *result;
@property (strong) IBOutlet UILabel *input3;
@property (weak) id delegate;


@end

