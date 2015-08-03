//
//  NewRecipeViewController.h
//  MyRecipesBook
//
//  Created by Ades on 02/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewRecipeViewController : UIViewController



@property (strong, nonatomic) IBOutlet UITextField *recipeTitleTextfield;
@property (strong, nonatomic) IBOutlet UISlider *difficultySlider;
@property (strong, nonatomic) IBOutlet UILabel *dificultyLabel;



@end
