//
//  Ingredient.m
//  MyRecipesBook
//
//  Created by Ades on 02/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//

#import "Ingredient.h"
#import "IngredientQuantity.h"


@implementation Ingredient

@dynamic name;
@dynamic picture;
@dynamic recipes;
@dynamic recipesQuantities;



#pragma mark -
#pragma mark Object Life Cycle Methods



+ (Ingredient*)insertOrUpdateIngredientWithDictionary:(NSDictionary*)dictionary
                                            inContext:(NSManagedObjectContext*)context
{
    if ([dictionary objectForKey:kname] && [[dictionary objectForKey:kname] isKindOfClass:[NSString class]])
    {
        Ingredient* lIngredient = [Ingredient searchIngredientWithName:[dictionary valueForKey:kname]
                                                             onContext:context];
        
        if (!lIngredient)
        {
            lIngredient = [NSEntityDescription insertNewObjectForEntityForName:@"Ingredient"
                                                        inManagedObjectContext:context];
        }
        
        [lIngredient updateIngredientWithDictionary:dictionary
                                          onContext:context];
    
        return lIngredient;
    }
    
    return nil;
}


+ (Ingredient*)searchIngredientWithName:(NSString*)name
                              onContext:(NSManagedObjectContext*)context
{
    if ([name length] == 0)
    {
        return nil;
    }
    
    __block Ingredient* lComment = nil;
    
    [context performBlockAndWait:^
     {
         NSError* error = nil;
         NSDictionary *subDictionary = [NSDictionary dictionaryWithObjectsAndKeys:name, @"name", nil];
         NSFetchRequest *fetchRequest = [[[context persistentStoreCoordinator] managedObjectModel] fetchRequestFromTemplateWithName:@"getIngredientByName" substitutionVariables:subDictionary];
         NSArray* array = [context executeFetchRequest:fetchRequest error:&error];
         
         if([array count] > 0)
         {
             lComment = [array objectAtIndex:0];
         }
     }];
    
    return lComment;
}


#pragma mark -
#pragma mark Data Management Methods



- (void)updateIngredientWithDictionary:(NSDictionary*)dictionary
                             onContext:(NSManagedObjectContext*)context
{
    if ([dictionary objectForKey:kname] && [[dictionary objectForKey:kname] isKindOfClass:[NSString class]])
    {
        self.name = [dictionary objectForKey:kname];
    }
    
    
    if ([dictionary objectForKey:kpicture] && [[dictionary objectForKey:kpicture] isKindOfClass:[NSString class]])
    {
        self.picture = [dictionary objectForKey:kpicture];
    }
}


@end

