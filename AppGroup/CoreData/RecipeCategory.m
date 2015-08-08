//
//  Category.m
//  MyRecipesBook
//
//  Created by Ades on 02/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//

#import "RecipeCategory.h"
#import "Recipe.h"
#import <threadedManagedContext/ThreadedContextManager.h>



@implementation RecipeCategory



@dynamic icon;
@dynamic name;
@dynamic recipe;
@dynamic isDefaultCategory;



#pragma mark -
#pragma mark Core Data Methods



+ (RecipeCategory*)insertOrUpdateIngredientWithDictionary:(NSDictionary*)dictionary
                                            inContext:(NSManagedObjectContext*)context
{
    if ([dictionary objectForKey:kname] && [[dictionary objectForKey:kname] isKindOfClass:[NSString class]])
    {
        RecipeCategory* lRecipeCategory = [RecipeCategory searchRecipeCategoryWithName:[dictionary valueForKey:kname]
                                                             onContext:context];
        
        if (!lRecipeCategory)
        {
            lRecipeCategory = [NSEntityDescription insertNewObjectForEntityForName:@"RecipeCategory"
                                                        inManagedObjectContext:context];
        }
        
        [lRecipeCategory updateRecipeCategoryWithDictionary:dictionary
                                          onContext:context];
        
        return lRecipeCategory;
    }
    
    return nil;
}


+ (RecipeCategory*)searchRecipeCategoryWithName:(NSString*)name
                              onContext:(NSManagedObjectContext*)context
{
    if ([name length] == 0)
    {
        return nil;
    }
    
    __block RecipeCategory* lRecipeCategory = nil;
    
    [context performBlockAndWait:^
     {
         NSError* error = nil;
         NSDictionary *subDictionary = [NSDictionary dictionaryWithObjectsAndKeys:name, @"name", nil];
         NSFetchRequest *fetchRequest = [[[context persistentStoreCoordinator] managedObjectModel] fetchRequestFromTemplateWithName:@"getRecipeCategoryByName" substitutionVariables:subDictionary];
         NSArray* array = [context executeFetchRequest:fetchRequest error:&error];
         
         if([array count] > 0)
         {
             lRecipeCategory = [array objectAtIndex:0];
         }
     }];
    
    return lRecipeCategory;
}


+ (void)parseRecipeCategoriesList:(NSArray*)categoriesList
                        onContext:(NSManagedObjectContext*)context
                          success:(void (^)(NSArray* recipesCategories))success
{
     ThreadedContextManager* lThreaded = [[ThreadedContextManager alloc] initWithContext:context];
    
    NSMutableArray* lParsedRecipesCategories = [NSMutableArray array];
    
    [lThreaded performBlockWaitUntilDone:^(NSManagedObjectContext *_Context)
    {
        for (id aRecipeCategoryObj in categoriesList)
        {
            if ([aRecipeCategoryObj isKindOfClass:[NSDictionary class]])
            {
                NSDictionary* lRecipeCategoryDictionary = (NSDictionary*)aRecipeCategoryObj;
                
                RecipeCategory* lRecipeCategory = [RecipeCategory insertOrUpdateIngredientWithDictionary:lRecipeCategoryDictionary
                                                             inContext:context];
                [lParsedRecipesCategories addObject:lRecipeCategory];
            }
        }
    }
                                 success:^(NSManagedObjectContext *_Context)
     {
         NSMutableArray* lReadableObjects = [NSMutableArray array];
         
         for (RecipeCategory* aRecipeCategory in lParsedRecipesCategories)
         {
             [lReadableObjects addObject:[context objectWithID:aRecipeCategory.objectID]];
         }
         
         if (success)
         {
             success(lReadableObjects);
         }
    }];
}



#pragma mark -
#pragma mark Data Management Methods



- (void)updateRecipeCategoryWithDictionary:(NSDictionary*)dictionary
                                 onContext:(NSManagedObjectContext*)context
{
    if ([dictionary objectForKey:kname] && [[dictionary objectForKey:kname] isKindOfClass:[NSString class]])
    {
        self.name = [dictionary objectForKey:kname];
    }
    
    if ([dictionary objectForKey:kDefaultCategory] && [[dictionary objectForKey:kDefaultCategory] isKindOfClass:[NSNumber class]])
    {
        BOOL lIsDefaultValue = [[dictionary objectForKey:kDefaultCategory] boolValue];
        self.isDefaultCategory = [NSNumber numberWithBool:lIsDefaultValue];
    }
    else
    {
        self.isDefaultCategory = [NSNumber numberWithBool:NO];
    }
}



#pragma mark -
#pragma mark Default Values



+ (NSArray*)defaultCategoriesDictionaries
{
    NSMutableArray* lDefaultRecipes = [NSMutableArray array];
    
    NSMutableDictionary* lEntryDic = [NSMutableDictionary dictionary];
    [lEntryDic setObject:NSLocalizedString(@"Entry", @"") forKey:kname];
    [lEntryDic setObject:[NSNumber numberWithBool:YES] forKey:kDefaultCategory];
    [lDefaultRecipes addObject:lEntryDic];
    
    NSMutableDictionary* lMainCourseDic = [NSMutableDictionary dictionary];
    [lMainCourseDic setObject:NSLocalizedString(@"MainCourse", @"") forKey:kname];
    [lMainCourseDic setObject:[NSNumber numberWithBool:YES] forKey:kDefaultCategory];
    [lDefaultRecipes addObject:lMainCourseDic];
    
    NSMutableDictionary* lDesertDic = [NSMutableDictionary dictionary];
    [lDesertDic setObject:NSLocalizedString(@"Desert", @"") forKey:kname];
    [lDesertDic setObject:[NSNumber numberWithBool:YES] forKey:kDefaultCategory];
    [lDefaultRecipes addObject:lDesertDic];
    
    NSMutableDictionary* lDrinkDic = [NSMutableDictionary dictionary];
    [lDrinkDic setObject:NSLocalizedString(@"Drink", @"") forKey:kname];
    [lDrinkDic setObject:[NSNumber numberWithBool:YES] forKey:kDefaultCategory];
    [lDefaultRecipes addObject:lDrinkDic];
    
    NSMutableDictionary* lAccompanimentDic = [NSMutableDictionary dictionary];
    [lAccompanimentDic setObject:NSLocalizedString(@"Accompaniment", @"") forKey:kname];
    [lAccompanimentDic setObject:[NSNumber numberWithBool:YES] forKey:kDefaultCategory];
    [lDefaultRecipes addObject:lAccompanimentDic];
    
    return lDefaultRecipes;
}



@end
