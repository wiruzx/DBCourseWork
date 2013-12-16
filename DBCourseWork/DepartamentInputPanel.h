//
//  DepartamentInputPanel.h
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/16/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class DepartamentInputPanel;
@class Faculty;

@protocol DepartamentInputPanelDelegate <NSObject>

- (void)departamentInputPanel:(DepartamentInputPanel *)inputPanel inputCompleteWithName:(NSString *)name head:(NSString *)head specialization:(NSString *)specialization faculty:(Faculty *)faculty;

@optional;
- (void)inputCanceledInDepartamentInputPanel:(DepartamentInputPanel *)inputPanel;

@end

@interface DepartamentInputPanel : NSPanel

@property (weak, nonatomic) id <DepartamentInputPanelDelegate> inputDelegate;

@property (strong, nonatomic) NSArray *faculties;

@end
