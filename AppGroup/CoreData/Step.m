//
//  Step.m
//  MyRecipesBook
//
//  Created by Ades on 02/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//

#import "Step.h"


@implementation Step

@dynamic definition;
@dynamic number;
@dynamic time;
@dynamic recipe;



#pragma mark -
#pragma mark Object Life Cycle Methods



+ (Step*)insertOrUpdateStepWithDictionary:(NSDictionary*)dictionary
                                inContext:(NSManagedObjectContext*)context
{
    if ([dictionary objectForKey:@"id"] && [[dictionary objectForKey:@"id"] isKindOfClass:[NSString class]])
    {
        Step* lStep = [Step searchStepWithId:[dictionary valueForKey:@"id"]
                                                             onContext:context];
        
        if (!lStep)
        {
            lStep = [NSEntityDescription insertNewObjectForEntityForName:@"Step"
                                                        inManagedObjectContext:context];
        }
        
        [lStep updateStepWithDictionary:dictionary
                                          onContext:context];
    
        return lStep;
    }
    
    return nil;
}


+ (Step*)searchStepWithId:(NSNumber*)objectId
                              onContext:(NSManagedObjectContext*)context
{
    if (objectId)
    {
        return nil;
    }
    
    __block Step* lStep = nil;
    
    [context performBlockAndWait:^
     {
         NSError* error = nil;
         NSDictionary *subDictionary = [NSDictionary dictionaryWithObjectsAndKeys:objectId, @"id", nil];
         NSFetchRequest *fetchRequest = [[[context persistentStoreCoordinator] managedObjectModel] fetchRequestFromTemplateWithName:@"getStepById" substitutionVariables:subDictionary];
         NSArray* array = [context executeFetchRequest:fetchRequest error:&error];
         
         if([array count] > 0)
         {
             lStep = [array objectAtIndex:0];
         }
     }];
    
    return lStep;
}


#pragma mark -
#pragma mark Data Management Methods



- (void)updateStepWithDictionary:(NSDictionary*)dictionary
                             onContext:(NSManagedObjectContext*)context
{
    
}
@end
