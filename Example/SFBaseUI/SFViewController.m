//
//  SFViewController.m
//  SFBaseUI
//
//  Created by jack110530 on 12/21/2020.
//  Copyright (c) 2020 jack110530. All rights reserved.
//

#import "SFViewController.h"
#import <SFBaseUI/SFBaseUI.h>

@interface SFViewController ()

@end

@implementation SFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [self testNSObject];
//    [self testUIView];
//    [self testUILabel];
    [self testUIButton];
    
    
    
    
}


// MARK: NSObject
- (void)testNSObject {
//    NSObject *obj = NSObject.sf_new;
}


// MARK: UIView
- (void)testUIView {
    UIView *view = UIView
    .make
    .frame(CGRectMake(100, 300, 100, 100))
    .backgroundColor([UIColor redColor])
    .alpha(0.5)
    .title(@"")
    .end;
    
    [self.view addSubview:view];
}

// MARK: UILabel
- (void)testUILabel {
//    UILabel *label = UILabel.begin.frame(CGRectMake(100, 300, 100, 100)).text(@"ssss").end;
//    label.backgroundColor = [UIColor redColor];
//    [self.view addSubview:label];
    
}



// MARK: UIButton
- (void)testUIButton {
    UIButton *btn = UIButton
    .makeWithType(UIButtonTypeClose)
    .backgroundColor([UIColor redColor])
    .frame(CGRectMake(100, 300, 100, 100))
    .titleForState(@"test", UIControlStateNormal)
    .titleFont([UIFont systemFontOfSize:30])
    .end;
    
    [self.view addSubview:btn];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
