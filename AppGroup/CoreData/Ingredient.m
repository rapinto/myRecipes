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



+ (Ingredient*)insertOrUpdateIngredientWithDictionary:(NSDictionary*)dictionary
                                            inContext:(NSManagedObjectContext*)context
{
    if ([dictionary objectForKey:kname] && [[dictionary objectForKey:kname] isKindOfClass:[NSString class]])
    {
        Ingredient* lIngredient = [Ingredient searchIngredientWithName:[dictionary valueForKey:kname]];
        
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
{
    if ([name length] == 0)
    {
        return nil;
    }
    
    
    
    
    return nil;
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

