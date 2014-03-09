//
//  ViewController.m
//  UIAlertVIewBlocksExtensionDemo
//
//  Created by pebble8888 on 2014/03/09.
//  Copyright (c) 2014年 pebble8888. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertView+PBBlocksExtension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)buttonHandler:(UIButton*)sender
{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"title" message:@"message" handler:
    ^(UIAlertView *alertView, NSInteger buttonIndex){
        if( buttonIndex == alertView.cancelButtonIndex ){
            NSLog( @"canceled." );
        } else {
            NSLog( @"buttonIndex[%d] touched.", buttonIndex );
        }
    }
    cancelButtonTitle:@"cancel" otherButtonTitles:@"Other1",@"Other2",nil];
    [alertView show];
}

@end
