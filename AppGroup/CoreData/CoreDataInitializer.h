//
//  CoreDataInitializer.h
//  MyRecipesBook
//
//  Created by Ades on 08/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//



#import <Foundation/Foundation.h>



@interface CoreDataInitializer : NSObject



+ (void)insertDefaultCoreDataValuesInContext:(NSManagedObjectContext*)context;



@end
