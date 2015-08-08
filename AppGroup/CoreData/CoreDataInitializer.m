//
//  CoreDataInitializer.m
//  MyRecipesBook
//
//  Created by Ades on 08/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//

#import "CoreDataInitializer.h"
#import "RecipeCategory.h"



@implementation CoreDataInitializer



#pragma mark -
#pragma mark Core Data Initializer Methods



+ (void)insertDefaultCoreDataValuesInContext:(NSManagedObjectContext*)context
{
    [RecipeCategory parseRecipeCategoriesList:[RecipeCategory defaultCategoriesDictionaries]
                                    onContext:context
                                      success:nil];
}


@end
