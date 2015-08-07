//
//  RecipeCreatorTitleViewController.h
//  MyRecipesBook
//
//  Created by Ades on 02/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//

#import <UIKit/UIKit.h>



@class RecipeCreatorInteractor;



@interface RecipeCreatorTitleViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>



@property (nonatomic) BOOL isLoaded;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *recipeTitleTextfield;
@property (strong, nonatomic) IBOutlet UITextView *recipeDescriptiontextView;
@property (strong, nonatomic) UIView* firstResponderView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *tableViewBottomContraint;
@property (strong, nonatomic) RecipeCreatorInteractor* recipeCreatorInteractor;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *rightBarButtonItem;


@end
