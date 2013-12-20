//
//  DepartamentInputView.h
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/19/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import "InputView.h"

@interface DepartamentInputView : InputView
@property (weak) IBOutlet NSTextField *nameTextField;
@property (weak) IBOutlet NSTextField *headTextField;
@property (weak) IBOutlet NSTextField *specializationTextField;
@property (weak) IBOutlet NSComboBox *facultyComboBox;

@property (nonatomic, strong) NSArray *faculties;

@end
