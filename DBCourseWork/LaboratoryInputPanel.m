//
//  LaboratoryInputPanel.m
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/16/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import "LaboratoryInputPanel.h"
#import "Laboratory.h"

@interface LaboratoryInputPanel () <NSComboBoxDataSource>

@property (weak) IBOutlet NSTextField *responsableTextField;
@property (weak) IBOutlet NSComboBox *departamentComboBox;

@end

@implementation LaboratoryInputPanel

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
//    [self doneButtonPressed:sender];
}

- (IBAction)cancelButtonPressed:(id)sender
{
    if ([self.inputDelegate respondsToSelector:@selector(inputCanceledInLaboratoryInputPanel:)])
        [self.inputDelegate inputCanceledInLaboratoryInputPanel:self];
}

- (IBAction)doneButtonPressed:(id)sender
{
    if ([self.inputDelegate respondsToSelector:@selector(laboratoryInputPanel:inputCompleteWithResponsable:departament:)])
        [self.inputDelegate laboratoryInputPanel:self
                    inputCompleteWithResponsable:self.responsableTextField.stringValue
                                     departament:self.departamentComboBox.indexOfSelectedItem < self.departaments.count ? self.departaments[self.departamentComboBox.indexOfSelectedItem] : nil];
}

#pragma mark - Combo box data source

- (NSInteger)numberOfItemsInComboBox:(NSComboBox *)aComboBox
{
    return self.departaments.count;
}

- (id)comboBox:(NSComboBox *)aComboBox objectValueForItemAtIndex:(NSInteger)index
{
    return [self.departaments[index] name];
}

@end
