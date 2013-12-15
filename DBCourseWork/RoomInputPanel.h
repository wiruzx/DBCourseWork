//
//  RoomInputPanel.h
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/16/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class RoomInputPanel;
@class Departament;
@class Faculty;
@class Laboratory;
@class Building;

@protocol RoomInputPanelDelegate <NSObject>

- (void)roomInputPanel:(RoomInputPanel *)inputPanel
inputCompleteWithHeight:(NSNumber *)height
                length:(NSNumber *)length
                number:(NSNumber *)number
               purpose:(NSString *)purpose
                 stage:(NSNumber *)stage
                  type:(NSString *)type
                 width:(NSNumber *)width
              building:(Building *)building
           departament:(Departament *)departament
               faculty:(Faculty *)faculty
            laboratory:(Laboratory *)laboratory;

@optional;

- (void)inputCanceledInRoomInputPanel:(RoomInputPanel *)inputPanel;

@end

@interface RoomInputPanel : NSPanel

@property (weak, nonatomic) id <RoomInputPanelDelegate> inputDelegate;

@property (strong, nonatomic) NSArray *builgings;
@property (strong, nonatomic) NSArray *departaments;
@property (strong, nonatomic) NSArray *faculties;
@property (strong, nonatomic) NSArray *laboratories;

@end
