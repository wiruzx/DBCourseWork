//
//  Laboratory.h
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/7/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Departament;

@interface Laboratory : NSManagedObject

@property (nonatomic, retain) NSString * responsablePerson;
@property (nonatomic, retain) Departament *departament;
@property (nonatomic, retain) NSSet *rooms;
@end

@interface Laboratory (CoreDataGeneratedAccessors)

- (void)addRoomsObject:(NSManagedObject *)value;
- (void)removeRoomsObject:(NSManagedObject *)value;
- (void)addRooms:(NSSet *)values;
- (void)removeRooms:(NSSet *)values;

@end
