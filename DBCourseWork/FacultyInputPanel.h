//
//  FacultyInputPanel.h
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/15/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class FacultyInputPanel;

@protocol FacultyInputPanelDelegate <NSObject>

- (void)facultyInputPanel:(FacultyInputPanel *)inputPanel inputCompleteWithName:(NSString *)name dean:(NSString *)dean;

@optional;

- (void)inputCanceledInFacultyInputPanel:(FacultyInputPanel *)inputPanel;

@end

@interface FacultyInputPanel : NSPanel

@property (weak, nonatomic) id <FacultyInputPanelDelegate> inputDelegate;

@end
