//
//  Ingredient.h
//  MyRecipesBook
//
//  Created by Ades on 02/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class IngredientQuantity;

@interface Ingredient : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * picture;
@property (nonatomic, retain) NSManagedObject *recipes;
@property (nonatomic, retain) NSSet *recipesQuantities;
@end

@interface Ingredient (CoreDataGeneratedAccessors)

- (void)addRecipesQuantitiesObject:(IngredientQuantity *)value;
- (void)removeRecipesQuantitiesObject:(IngredientQuantity *)value;
- (void)addRecipesQuantities:(NSSet *)values;
- (void)removeRecipesQuantities:(NSSet *)values;

@end
