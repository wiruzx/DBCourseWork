//
//  RoomInputPanel.m
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/16/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import "RoomInputPanel.h"
#import "Laboratory.h"
#import "Departament.h"
#import "Faculty.h"
#import "Room.h"

@interface RoomInputPanel () <NSComboBoxDataSource>

@property (weak) IBOutlet NSTextField *heightTextField;
@property (weak) IBOutlet NSTextField *lenghtTextField;
@property (weak) IBOutlet NSTextField *numberTextField;
@property (weak) IBOutlet NSTextField *purposeTextField;
@property (weak) IBOutlet NSTextField *stageTextField;
@property (weak) IBOutlet NSTextField *typeTextField;
@property (weak) IBOutlet NSTextField *widthTextField;
@property (weak) IBOutlet NSComboBox *buildingComboBox;
@property (weak) IBOutlet NSComboBox *departamentComboBox;
@property (weak) IBOutlet NSComboBox *facultyComboBox;
@property (weak) IBOutlet NSComboBox *laboratoryComboBox;

@end

@implementation RoomInputPanel

- (id)init
{
    NSNib *nib = [[NSNib alloc] initWithNibNamed:NSStringFromClass(self.class) bundle:nil];
    NSArray *topLevelObjects;
    if ([nib instantiateWithOwner:self topLevelObjects:&topLevelObjects]) {
        for (id topLevelObject in topLevelObjects) {
            if ([topLevelObject isKindOfClass:self.class]) {
                self = topLevelObject;
                
                self.buildingComboBox.usesDataSource = YES;
                self.buildingComboBox.dataSource = self;
                
                self.departamentComboBox.usesDataSource = YES;
                self.departamentComboBox.dataSource = self;
                
                self.facultyComboBox.usesDataSource = YES;
                self.facultyComboBox.dataSource = self;
                
                self.laboratoryComboBox.usesDataSource = YES;
                self.laboratoryComboBox.dataSource = self;
                
                return self;
            }
        }
    }
    
    return nil;
}

#pragma mark - Actions

- (IBAction)cancelButtonPressed:(id)sender {
    if ([self.inputDelegate respondsToSelector:@selector(inputCanceledInRoomInputPanel:)])
        [self.inputDelegate inputCanceledInRoomInputPanel:self];
}

- (IBAction)doneButtonPressed:(id)sender {
    if ([self.inputDelegate respondsToSelector:@selector(roomInputPanel:inputCompleteWithHeight:length:number:purpose:stage:type:width:building:departament:faculty:laboratory:)])
        [self.inputDelegate roomInputPanel:self
                   inputCompleteWithHeight:@(self.heightTextField.doubleValue)
                                    length:@(self.lenghtTextField.doubleValue)
                                    number:@(self.numberTextField.integerValue)
                                   purpose:self.purposeTextField.stringValue
                                     stage:@(self.stageTextField.integerValue)
                                      type:self.typeTextField.stringValue
                                     width:@(self.widthTextField.doubleValue)
                                  building:self.buildingComboBox.indexOfSelectedItem < self.builgings.count && self.builgings.lastObject ? self.builgings[self.buildingComboBox.indexOfSelectedItem] : nil
                               departament:self.departamentComboBox.indexOfSelectedItem < self.departaments.count && self.departaments.lastObject ? self.departaments[self.departamentComboBox.indexOfSelectedItem] : nil
                                   faculty:self.facultyComboBox.indexOfSelectedItem < self.faculties.count && self.faculties.lastObject ? self.faculties[self.facultyComboBox.indexOfSelectedItem] : nil
                                laboratory:self.laboratoryComboBox.indexOfSelectedItem < self.laboratories.count && self.laboratories.lastObject ? self.laboratories[self.laboratoryComboBox.indexOfSelectedItem] : nil];
}

#pragma mark - combo box data source

- (NSInteger)numberOfItemsInComboBox:(NSComboBox *)aComboBox
{
    if (aComboBox == self.buildingComboBox) {
        return self.builgings.count;
    } else if (aComboBox == self.departamentComboBox) {
        return self.departaments.count;
    } else if (aComboBox == self.facultyComboBox) {
        return self.faculties.count;
    } else if (aComboBox == self.laboratoryComboBox) {
        return self.laboratories.count;
    }
    
    return 0;
}

- (id)comboBox:(NSComboBox *)aComboBox objectValueForItemAtIndex:(NSInteger)index
{
    if (aComboBox == self.buildingComboBox) {
        return [self.builgings[index] name];
    } else if (aComboBox == self.departamentComboBox) {
        return [self.departaments[index] name];
    } else if (aComboBox == self.facultyComboBox) {
        return [self.faculties[index] name];
    } else if (aComboBox == self.laboratoryComboBox) {
        return [self.laboratories[index] responsablePerson];
    }
    
    return nil;
}

@end