//
//  Step.h
//  MyRecipesBook
//
//  Created by Ades on 02/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSManagedObject;

@interface Step : NSManagedObject

@property (nonatomic, retain) NSString * definition;
@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSNumber * time;
@property (nonatomic, retain) NSManagedObject *recipe;

@end
