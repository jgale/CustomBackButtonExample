//
//  PushedViewController.m
//  BackButtonExample
//
//  Created by Jeremy Gale on 2012-03-19.
//  Copyright (c) 2012 Force Grind Inc. All rights reserved.
//

#import "PushedViewController.h"
#import "CustomBackButton.h"

@interface PushedViewController ()

@end

@implementation PushedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
