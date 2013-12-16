//
//  FacultyInputPanel.m
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/15/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import "FacultyInputPanel.h"

@interface FacultyInputPanel ()

@property (weak) IBOutlet NSTextField *nameTextField;

@property (weak) IBOutlet NSTextField *deanTextField;

@end

@implementation FacultyInputPanel

#pragma mark - Initialization

- (id)init
{
    NSNib *nib = [[NSNib alloc] initWithNibNamed:NSStringFromClass(self.class) bundle:nil];
    NSArray *topLevelObjects;
    if ([nib instantiateWithOwner:self topLevelObjects:&topLevelObjects]) {
        for (id topLevelObject in topLevelObjects) {
            if ([topLevelObject isKindOfClass:self.class]) {
                self = topLevelObject;
                return self;
            }
        }
    }
    
    return nil;
}

#pragma mark - Actions

- (IBAction)returnKeyPressedInField:(id)sender
{
    if (sender == self.deanTextField) [self doneButtonPressed:sender];
}

- (IBAction)cancelButtonPressed:(id)sender {
    if ([self.inputDelegate respondsToSelector:@selector(inputCanceledInFacultyInputPanel:)])
        [self.inputDelegate inputCanceledInFacultyInputPanel:self];
}

- (IBAction)doneButtonPressed:(id)sender {
    if ([self.inputDelegate respondsToSelector:@selector(facultyInputPanel:inputCompleteWithName:dean:)])
        [self.inputDelegate facultyInputPanel:self
                        inputCompleteWithName:self.nameTextField.stringValue
                                         dean:self.deanTextField.stringValue];
}

@end
