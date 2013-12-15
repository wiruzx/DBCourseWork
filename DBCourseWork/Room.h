//
//  Room.h
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/7/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Departament, Faculty, Laboratory, Building;

@interface Room : NSManagedObject

@property (nonatomic, retain) NSNumber * height;
@property (nonatomic, retain) NSNumber * length;
@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSString * purpose;
@property (nonatomic, retain) NSNumber * stage;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSNumber * width;
@property (nonatomic, retain) Building *building;
@property (nonatomic, retain) Departament *departament;
@property (nonatomic, retain) Faculty *faculty;
@property (nonatomic, retain) Laboratory *laboratory;

@end
