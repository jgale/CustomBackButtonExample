//
//  CustonBackButton.m
//  BackButtonExample
//
//  Orignally based off of CustomNavigationBar.m created by Peter Boctor on 1/11/11.
//  Significant refactoring by Jeremy Gale on 2011-11-20 to make simpler
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


#import "CustomBackButton.h"

@implementation CustomBackButton

// Given the prpoer images and cap width, create a variable width back button
+ (UIButton *)backButtonWith:(UIImage *)backButtonImage
                   highlight:(UIImage *)backButtonHighlightImage
                       title:(NSString *)title
                leftCapWidth:(CGFloat)capWidth
{
    // Create stretchable images for the normal and highlighted states
    UIImage* buttonImage = [backButtonImage resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, capWidth, 0.0, 5.0)];
    UIImage* buttonHighlightImage = [backButtonHighlightImage resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, capWidth, 0.0, 5.0)];
    
    // Create a custom button
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // Set the title to use the same font and shadow as the standard back button
    button.titleLabel.font = [UIFont boldSystemFontOfSize:[UIFont smallSystemFontSize]];
    button.titleLabel.textColor = [UIColor whiteColor];
    button.titleLabel.shadowOffset = CGSizeMake(0,-1);
    button.titleLabel.shadowColor = [UIColor darkGrayColor];
    
    // Set the break mode to truncate at the end like the standard back button
    button.titleLabel.lineBreakMode = UILineBreakModeTailTruncation;
    
    // Inset the title on the left and right
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 6.0, 0, 3.0);
    
    // Make the button as high as the passed in image
    button.frame = CGRectMake(0, 0, 0, buttonImage.size.height);
    
    // Set the stretchable images as the background for the button
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:buttonHighlightImage forState:UIControlStateHighlighted];
    [button setBackgroundImage:buttonHighlightImage forState:UIControlStateSelected];
    
    // Measure the width of the text
    CGSize textSize = [title sizeWithFont:button.titleLabel.font];
    // Change the button's frame. The width is either the width of the new text or the max width
    
    CGFloat maxWidth = MAX_BACK_BUTTON_WIDTH;
    
    CGFloat buttonWidth = (textSize.width + (capWidth * 1.5)) > maxWidth ? maxWidth : (textSize.width + (capWidth * 1.5));
    buttonWidth = MAX(buttonWidth, buttonImage.size.width); // Button should at least be the size of the image
    
    button.frame = CGRectMake(button.frame.origin.x,
                              button.frame.origin.y,
                              buttonWidth,
                              button.frame.size.height);
    
    // Set the text on the button
    [button setTitle:title forState:UIControlStateNormal];
    
    return button;
}

@end
