//
//  NewRecipeInteractor.m
//  MyRecipesBook
//
//  Created by Raphaël Pinto on 06/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//

#import "RecipeCreatorInteractor.h"
#import "Recipe.h"



@implementation RecipeCreatorInteractor



#pragma mark -
#pragma mark Object Life Cycle Methods



- (id)init
{
    self = [super init];
    
    if (self)
    {
    }
    
    return self;
}



#pragma mark -
#pragma mark Data Management Methods



- (void)setRecipeTitle:(NSString*)title
{
    _recipeTitle = title;
}


- (void)setRecipeDefinition:(NSString*)definition
{
    _recipeDefinition = definition;
}



@end
