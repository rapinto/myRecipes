//
//  Category.h
//  MyRecipesBook
//
//  Created by Ades on 02/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Recipe;

@interface RecipeCategory : NSManagedObject

@property (nonatomic, retain) NSString * icon;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *recipe;
@property (nonatomic, retain) NSNumber* isDefaultCategory;


// Core Data Main Methods
+ (RecipeCategory*)insertOrUpdateIngredientWithDictionary:(NSDictionary*)dictionary
                                                inContext:(NSManagedObjectContext*)context;
+ (RecipeCategory*)searchRecipeCategoryWithName:(NSString*)name
                                      onContext:(NSManagedObjectContext*)context;
+ (void)parseRecipeCategoriesList:(NSArray*)categoriesList
                        onContext:(NSManagedObjectContext*)context
                          success:(void (^)(NSArray* recipesCategories))success;


// Init Methods
+ (NSArray*)defaultCategoriesDictionaries;

@end

@interface RecipeCategory (CoreDataGeneratedAccessors)

- (void)addRecipeObject:(Recipe *)value;
- (void)removeRecipeObject:(Recipe *)value;
- (void)addRecipe:(NSSet *)values;
- (void)removeRecipe:(NSSet *)values;

@end
