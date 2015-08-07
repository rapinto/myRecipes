//
//  HomeViewController.m
//  MyRecipesBook
//
//  Created by Raphaël Pinto on 03/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//

#import "HomeViewController.h"
#import "RecipeCreatorTitleViewController.h"



@interface HomeViewController ()

@end

@implementation HomeViewController



#pragma mark -
#pragma mark Object Life Cycle Methods



- (id)init
{
    self = [super init];
    
    if (self)
    {
        [self setup];
    }
    
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        [self setup];
    }
    
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self setup];
    }
    
    return self;
}



#pragma mark -
#pragma mark Data Management Methods



- (void)setup
{
    UINavigationController* lMenuNavController = [[UINavigationController alloc] init];
    
    
    RecipeCreatorTitleViewController* lDetail = [[RecipeCreatorTitleViewController alloc] initWithNibName:@"RecipeCreatorTitleViewController" bundle:nil];
    UINavigationController* lDetailNavController = [[UINavigationController alloc] initWithRootViewController:lDetail];
    
    
    self.viewControllers = [NSArray arrayWithObjects:lMenuNavController, lDetailNavController, nil];
    self.delegate = self;
}



#pragma mark - Split view

/*- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]] && ([(DetailViewController *)[(UINavigationController *)secondaryViewController topViewController] detailItem] == nil)) {
        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return YES;
    } else {
        return NO;
    }
}*/

@end
