//
//  ViewController.m
//  HelloWebView
//
//  Created by bryant tang on 5/6/15.
//  Copyright (c) 2015 CPTTM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //
    NSURL *url = [NSURL URLWithString:@"http://www.dsat.gov.mo/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_myWebView loadRequest:request];
    
    //
    
    NSString *html = @"<head><style> body{background-color:#233234;} .title{ color : #fff; font-size:3.0em; } </style></head><body><div class='title'>It' work</div></body>";
    
    [_myWebView loadHTMLString:html baseURL:nil];
    
    _link.delegate = self;

}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    NSLog(@"%@",request.URL.query);
    NSLog(@"%@", request.HTTPMethod);
    
    if ([request.URL.query containsString:@"nba"]) {
        return NO;
    }
    
    return YES;
}






- (IBAction)clickBack:(id)sender {

    [_myWebView goBack];
    [_myWebView goForward];
    [_myWebView reload];
    [_myWebView stopLoading];
    
}

- (IBAction)clickSearch:(id)sender {
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", _link.text]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_myWebView loadRequest:request];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    NSLog(@"Return");
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", textField.text]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_myWebView loadRequest:request];
    
    return YES;
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
