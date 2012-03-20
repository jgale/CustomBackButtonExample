//
//  ViewController.m
//  BackButtonExample
//
//  Created by Jeremy Gale on 2012-03-19.
//  Copyright (c) 2012 Force Grind Inc. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
// 
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
// 
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE

#import "ViewController.h"
#import "PushedViewController.h"
#import "CustomBackButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Root VC";
    
    self.navigationController.delegate = self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)dealloc
{
    // This is required to solve strange crashes upon unloading one of these view controllers
    if (self.navigationController.viewControllers.count == 1)
        self.navigationController.delegate = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)pushViewController:(id)sender
{
    PushedViewController *vc = [[PushedViewController alloc] initWithNibName:nil bundle:nil];
    vc.title = @"Pushed VC";
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UINavigationControllerDelegate methods

// With a custom back button, we have to provide the action. We simply pop the view controller
- (IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    if([navigationController.viewControllers count ] < 2)
        return;
    
    // These images are copyrighted by Instagram. They were extracted or reproduced in Peter Boctor's
    // CustomBackButton example    
    int index = [navigationController.viewControllers indexOfObject:viewController] - 1;
    UIViewController *previousViewController = [navigationController.viewControllers objectAtIndex:index];
    NSString *backTitle = previousViewController.title;
    UIButton *backButton = [CustomBackButton backButtonWith:[UIImage imageNamed:@"navigationBarBackButton.png"]
                                                  highlight:nil // TODO: Provide a custom highlight image of same size if you want
                                                      title:backTitle
                                               leftCapWidth:14.0];
    
    [backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

@end
