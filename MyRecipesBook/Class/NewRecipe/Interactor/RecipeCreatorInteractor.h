//
//  NewRecipeInteractor.h
//  MyRecipesBook
//
//  Created by Raphaël Pinto on 06/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//



#import <Foundation/Foundation.h>



@interface RecipeCreatorInteractor : NSObject



@property (strong, nonatomic) NSString* recipeTitle;
@property (strong, nonatomic) NSString* recipeDefinition;



- (void)setRecipeTitle:(NSString*)title;
- (void)setRecipeDefinition:(NSString *)recipeDefinition;


@end
