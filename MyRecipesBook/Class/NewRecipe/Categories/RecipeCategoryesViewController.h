//
//  RecipeCategoryesViewController.h
//  MyRecipesBook
//
//  Created by Raphaël Pinto on 07/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//



#import <UIKit/UIKit.h>



@class RecipeCreatorInteractor;



@interface RecipeCategoryesViewController : UIViewController



@property (strong, nonatomic) RecipeCreatorInteractor* recipeCreatorInteractor;
@property (strong, nonatomic) IBOutlet UITableView *tableView;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil recipeCreatorInteractor:(RecipeCreatorInteractor*)recipeCreatorInteractor;



@end
