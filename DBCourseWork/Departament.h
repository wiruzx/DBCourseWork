//
//  Departament.h
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/7/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Laboratory;
@class Faculty;

@interface Departament : NSManagedObject

@property (nonatomic, retain) NSString * headOfDepartament;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * specialization;
@property (nonatomic, retain) Faculty *faculty;
@property (nonatomic, retain) NSSet *laboratories;
@property (nonatomic, retain) NSSet *rooms;
@end

@interface Departament (CoreDataGeneratedAccessors)

- (void)addLaboratoriesObject:(Laboratory *)value;
- (void)removeLaboratoriesObject:(Laboratory *)value;
- (void)addLaboratories:(NSSet *)values;
- (void)removeLaboratories:(NSSet *)values;

- (void)addRoomsObject:(NSManagedObject *)value;
- (void)removeRoomsObject:(NSManagedObject *)value;
- (void)addRooms:(NSSet *)values;
- (void)removeRooms:(NSSet *)values;

@end
