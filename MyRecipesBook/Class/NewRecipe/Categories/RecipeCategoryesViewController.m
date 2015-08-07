//
//  RecipeCategoryesViewController.m
//  MyRecipesBook
//
//  Created by Raphaël Pinto on 07/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//

#import "RecipeCategoryesViewController.h"

@interface RecipeCategoryesViewController ()

@end

@implementation RecipeCategoryesViewController



#pragma mark -
#pragma mark Object Life Cycle Methods



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil recipeCreatorInteractor:(RecipeCreatorInteractor*)recipeCreatorInteractor
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        _recipeCreatorInteractor = recipeCreatorInteractor;
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}




@end
