//
//  Recipe.h
//  MyRecipesBook
//
//  Created by Ades on 02/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class IngredientQuantity, NSManagedObject, Step, SubCategory, Tool;

@interface Recipe : NSManagedObject

@property (nonatomic, retain) NSNumber * cookingTime;
@property (nonatomic, retain) NSString * definition;
@property (nonatomic, retain) NSNumber * difficulty;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * picture;
@property (nonatomic, retain) NSNumber * preparationTime;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSSet *categories;
@property (nonatomic, retain) NSSet *ingredientsQuantites;
@property (nonatomic, retain) NSSet *steps;
@property (nonatomic, retain) SubCategory *subCategories;
@property (nonatomic, retain) NSSet *tools;
@end

@interface Recipe (CoreDataGeneratedAccessors)

- (void)addCategoriesObject:(NSManagedObject *)value;
- (void)removeCategoriesObject:(NSManagedObject *)value;
- (void)addCategories:(NSSet *)values;
- (void)removeCategories:(NSSet *)values;

- (void)addIngredientsQuantitesObject:(IngredientQuantity *)value;
- (void)removeIngredientsQuantitesObject:(IngredientQuantity *)value;
- (void)addIngredientsQuantites:(NSSet *)values;
- (void)removeIngredientsQuantites:(NSSet *)values;

- (void)addStepsObject:(Step *)value;
- (void)removeStepsObject:(Step *)value;
- (void)addSteps:(NSSet *)values;
- (void)removeSteps:(NSSet *)values;

- (void)addToolsObject:(Tool *)value;
- (void)removeToolsObject:(Tool *)value;
- (void)addTools:(NSSet *)values;
- (void)removeTools:(NSSet *)values;

@end
