//
//  RecipeCategoryesViewController.h
//  MyRecipesBook
//
//  Created by Raphaël Pinto on 07/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//



#import <UIKit/UIKit.h>



@class RecipeCreatorInteractor;


 
@interface RecipeCategoryesViewController : UIViewController <UITextFieldDelegate>



@property (nonatomic) BOOL isLoaded;
@property (strong, nonatomic) RecipeCreatorInteractor* recipeCreatorInteractor;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *rightBarButtonItem;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewBottomConstraint;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil recipeCreatorInteractor:(RecipeCreatorInteractor*)recipeCreatorInteractor;



@end
