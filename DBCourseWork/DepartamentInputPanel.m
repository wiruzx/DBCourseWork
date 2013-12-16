//
//  DepartamentInputPanel.m
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/16/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import "DepartamentInputPanel.h"

@interface DepartamentInputPanel () <NSComboBoxDataSource>
@property (weak) IBOutlet NSTextField *nameTextField;
@property (weak) IBOutlet NSTextField *headTextField;
@property (weak) IBOutlet NSTextField *specializationTextField;
@property (weak) IBOutlet NSComboBox *facultyComboBox;

@end

@implementation DepartamentInputPanel

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
- (IBAction)returnKeyPressedInField:(id)sender {
    if (sender == self.facultyComboBox) {
        [self doneButtonPressed:sender];
    }
}

- (IBAction)cancelButtonPressed:(id)sender {
    if ([self.inputDelegate respondsToSelector:@selector(inputCanceledInDepartamentInputPanel:)])
        [self.inputDelegate inputCanceledInDepartamentInputPanel:self];
}

- (IBAction)doneButtonPressed:(id)sender {
    if ([self.inputDelegate respondsToSelector:@selector(departamentInputPanel:inputCompleteWithName:head:specialization:faculty:)])
        [self.inputDelegate departamentInputPanel:self
                            inputCompleteWithName:self.nameTextField.stringValue
                                             head:self.headTextField.stringValue
                                   specialization:self.specializationTextField.stringValue
                                          faculty:self.facultyComboBox.indexOfSelectedItem < self.faculties.count ? self.faculties[self.facultyComboBox.indexOfSelectedItem] : nil];
}

#pragma mark - Combo box data source

- (NSInteger)numberOfItemsInComboBox:(NSComboBox *)aComboBox
{
    return self.faculties.count;
}

- (id)comboBox:(NSComboBox *)aComboBox objectValueForItemAtIndex:(NSInteger)index
{
    return [self.faculties[index] name];
}

@end
