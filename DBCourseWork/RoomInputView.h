//
//  RoomInputView.h
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/19/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import "InputView.h"

@interface RoomInputView : InputView
@property (weak) IBOutlet NSTextField *typeTextField;
@property (weak) IBOutlet NSTextField *stageTextField;
@property (weak) IBOutlet NSTextField *purposeTextField;
@property (weak) IBOutlet NSTextField *numberTextField;
@property (weak) IBOutlet NSTextField *heightTextField;
@property (weak) IBOutlet NSTextField *widthTextField;
@property (weak) IBOutlet NSTextField *lengthTextField;
@property (weak) IBOutlet NSComboBox *buildingComboBox;
@property (weak) IBOutlet NSComboBox *facultyComboBox;
@property (weak) IBOutlet NSComboBox *departamentComboBox;
@property (weak) IBOutlet NSComboBox *laboratoryComboBox;

@property (strong, nonatomic) NSArray *faculties;
@property (strong, nonatomic) NSArray *buildings;
@property (strong, nonatomic) NSArray *departaments;
@property (strong, nonatomic) NSArray *laboratories;

@end
