//
//  Recipe.m
//  MyRecipesBook
//
//  Created by Ades on 02/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//

#import "Recipe.h"
#import "IngredientQuantity.h"
#import "Step.h"
#import "Tool.h"


@implementation Recipe

@dynamic cookingTime;
@dynamic definition;
@dynamic difficulty;
@dynamic name;
@dynamic picture;
@dynamic preparationTime;
@dynamic price;
@dynamic categories;
@dynamic ingredientsQuantites;
@dynamic steps;
@dynamic tools;



#pragma mark -
#pragma mark Object Life Cycle Methods



+ (Recipe*)insertOrUpdateRecipeWithDictionary:(NSDictionary*)dictionary
                                    inContext:(NSManagedObjectContext*)context
{
    if ([dictionary objectForKey:@"id"] && [[dictionary objectForKey:@"id"] isKindOfClass:[NSString class]])
    {
        Recipe* lRecipe = [Recipe searchRecipeWithId:[dictionary valueForKey:@"id"]
                                                       onContext:context];
        
        if (!lRecipe)
        {
            lRecipe = [Recipe createNewRecipeInContext:context];
        }
        
        [lRecipe updateRecipeWithDictionary:dictionary
                                        onContext:context];
        
        return lRecipe;
    }
    
    return nil;
}


+ (Recipe*)createNewRecipeInContext:(NSManagedObjectContext*)context
{
    return [NSEntityDescription insertNewObjectForEntityForName:@"Recipe"
                                         inManagedObjectContext:context];
}


+ (Recipe*)searchRecipeWithId:(NSNumber*)objectId
                    onContext:(NSManagedObjectContext*)context
{
    if (objectId)
    {
        return nil;
    }
    
    __block Recipe* lRecipe = nil;
    
    [context performBlockAndWait:^
     {
         NSError* error = nil;
         NSDictionary *subDictionary = [NSDictionary dictionaryWithObjectsAndKeys:objectId, @"id", nil];
         NSFetchRequest *fetchRequest = [[[context persistentStoreCoordinator] managedObjectModel] fetchRequestFromTemplateWithName:@"get<#Class#>ById" substitutionVariables:subDictionary];
         NSArray* array = [context executeFetchRequest:fetchRequest error:&error];
         
         if([array count] > 0)
         {
             lRecipe = [array objectAtIndex:0];
         }
     }];
    
    return lRecipe;
}


#pragma mark -
#pragma mark Data Management Methods



- (void)updateRecipeWithDictionary:(NSDictionary*)dictionary
                         onContext:(NSManagedObjectContext*)context
{
    
}
@end
