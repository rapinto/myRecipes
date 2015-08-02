//
//  Category.h
//  MyRecipesBook
//
//  Created by Ades on 02/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Recipe, SubCategory;

@interface RecipeCategory : NSManagedObject

@property (nonatomic, retain) NSString * icon;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *recipe;
@property (nonatomic, retain) NSSet *subCategories;
@end

@interface RecipeCategory (CoreDataGeneratedAccessors)

- (void)addRecipeObject:(Recipe *)value;
- (void)removeRecipeObject:(Recipe *)value;
- (void)addRecipe:(NSSet *)values;
- (void)removeRecipe:(NSSet *)values;

- (void)addSubCategoriesObject:(SubCategory *)value;
- (void)removeSubCategoriesObject:(SubCategory *)value;
- (void)addSubCategories:(NSSet *)values;
- (void)removeSubCategories:(NSSet *)values;

@end
