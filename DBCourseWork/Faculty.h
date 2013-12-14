//
//  Faculty.h
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/7/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Departament;

@interface Faculty : NSManagedObject

@property (nonatomic, retain) NSString * dean;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *departaments;
@property (nonatomic, retain) NSSet *rooms;
@end

@interface Faculty (CoreDataGeneratedAccessors)

- (void)addDepartamentsObject:(Departament *)value;
- (void)removeDepartamentsObject:(Departament *)value;
- (void)addDepartaments:(NSSet *)values;
- (void)removeDepartaments:(NSSet *)values;

- (void)addRoomsObject:(NSManagedObject *)value;
- (void)removeRoomsObject:(NSManagedObject *)value;
- (void)addRooms:(NSSet *)values;
- (void)removeRooms:(NSSet *)values;

@end
