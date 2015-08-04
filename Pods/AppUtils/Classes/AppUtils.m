//
//  AppUtils.m
//
//
//  Created by Raphaël Pinto on 17/04/2015.
//
// The MIT License (MIT)
// Copyright (c) 2015 Raphael Pinto.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.



#import "AppUtils.h"



@implementation AppUtils



#pragma mark -
#pragma mark Rotation Methods



+ (CGSize)orientationDependentStatusBarSize
{
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0f)
    {
        return [UIApplication sharedApplication].statusBarFrame.size;
    }
    else
    {
        if ([[UIApplication sharedApplication]statusBarOrientation] == UIInterfaceOrientationLandscapeLeft ||
            [[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeRight)
        {
            return CGSizeMake([UIApplication sharedApplication].statusBarFrame.size.height, [UIApplication sharedApplication].statusBarFrame.size.width);
        }
        else
        {
            return [UIApplication sharedApplication].statusBarFrame.size;
        }
    }
}


+ (CGSize)orientationDependentScreenSize
{
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0f)
    {
        return [[UIScreen mainScreen] bounds].size;
    }
    else
    {
        if ([[UIApplication sharedApplication]statusBarOrientation] == UIInterfaceOrientationLandscapeLeft ||
            [[UIApplication sharedApplication]statusBarOrientation] == UIInterfaceOrientationLandscapeRight)
        {
            return CGSizeMake([[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
        }
        else
        {
            return [[UIScreen mainScreen] bounds].size;
        }
    }
}



#pragma mark -
#pragma mark View Hierarchy Methods



+ (UIViewController*)getFirstResponderViewController
{
    UIWindow* lWindow = [[UIApplication sharedApplication] keyWindow];
    
    if (lWindow.windowLevel != UIWindowLevelNormal)
    {
        NSArray* lAllWindows = [[UIApplication sharedApplication] windows];
        for(UIWindow* aWindow in lAllWindows)
        {
            if (aWindow.windowLevel == UIWindowLevelNormal)
            {
                lWindow = aWindow;
                break;
            }
        }
    }
    
    
    return [self topMostViewController:(UIViewController*)lWindow.rootViewController];
}


+ (UIViewController*)topMostViewController:(UIViewController *)_Controller
{
    if ([_Controller presentedViewController])
    {
        return [AppUtils topMostViewController:[_Controller presentedViewController]];
    }
    
    return _Controller;
}


@end
