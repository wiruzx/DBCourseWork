//
//  LaboratoryInputView.h
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/20/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import "InputView.h"

@interface LaboratoryInputView : InputView

@property (weak) IBOutlet NSTextField *responsableTextField;
@property (weak) IBOutlet NSComboBox *departamentComboBox;

@property (strong, nonatomic) NSArray *departaments;

@end
