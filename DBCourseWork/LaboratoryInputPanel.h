//
//  LaboratoryInputPanel.h
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/16/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class LaboratoryInputPanel;
@class Departament;

@protocol LaboratoryInputPanelDelegate <NSObject>

- (void)laboratoryInputPanel:(LaboratoryInputPanel *)inputPanel
inputCompleteWithResponsable:(NSString *)responsablePerson
                 departament:(Departament *)departament;

@optional;

- (void)inputCanceledInLaboratoryInputPanel:(LaboratoryInputPanel *)inputPanel;

@end

@interface LaboratoryInputPanel : NSPanel

@property (weak, nonatomic) id <LaboratoryInputPanelDelegate> inputDelegate;

@property (strong, nonatomic) NSArray *departaments;

@end
