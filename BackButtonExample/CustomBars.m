//
//  CustomBars.m
//  BackButtonExample
//
//  Created by Jeremy Gale on 11-06-23.
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

#import "CustomBars.h"

static UIImage *portraitNavBar = nil;
static UIImage *landscapeNavBar = nil;

@implementation UINavigationBar (CustomImage) // Only called on iOS 4

- (void)drawRect:(CGRect)rect
{
    // These images are copyrighted by Instagram. They were extracted or reproduced in Peter Boctor's
    // CustomBackButton example    

    if (!portraitNavBar)
        portraitNavBar = [UIImage imageNamed:@"navigationBarBackgroundRetro.png"];

    // TODO: Uncomment and replace for  your landscape image
    //if (!landscapeNavBar)
    //    landscapeNavBar = [UIImage imageNamed:@"NavBar_L.png"];
    
    
    UIImage *image = portraitNavBar;
    //if (self.frame.size.width > self.frame.size.height)
    //    image = landscapeNavBar;
    
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

@end


@implementation UIToolbar (CustomImage) // Only called on iOS 4

- (void)drawRect:(CGRect)rect
{
    if (!portraitNavBar)
        portraitNavBar = [UIImage imageNamed:@"NavBar_P.png"];
    
    [portraitNavBar drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

@end


@implementation CustomBars

#if defined(__IPHONE_5_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_5_0
+ (void)setupNavBarStylingiOS5
{
    if ([[UINavigationBar class] respondsToSelector:@selector(appearance)])
    {
        if (!portraitNavBar)
            portraitNavBar = [UIImage imageNamed:@"navigationBarBackgroundRetro.png"];
        
        [[UINavigationBar appearance] setBackgroundImage:portraitNavBar forBarMetrics:UIBarMetricsDefault];
        [[UIToolbar appearance] setBackgroundImage:portraitNavBar forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
        
        // TODO: Uncomment and replace for  your landscape image
//        if (!landscapeNavBar)
//            landscapeNavBar = [UIImage imageNamed:@"NavBar_L.png"];
//        
//        [[UINavigationBar appearance] setBackgroundImage:landscapeNavBar forBarMetrics:UIBarMetricsLandscapePhone];
//        [[UIToolbar appearance] setBackgroundImage:landscapeNavBar forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsLandscapePhone];
    }
}
#endif

@end