//
//  BuildingInputPanel.m
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/15/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import "BuildingInputPanel.h"

@interface BuildingInputPanel ()

@property (weak) IBOutlet NSTextField *nameTextField;

@end

@implementation BuildingInputPanel

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
- (IBAction)returnButtonPressedInTextField:(id)sender {
    [self doneButtonPressed:sender];
}

- (IBAction)cancelButtonPressed:(id)sender {
    if ([self.inputDelegate respondsToSelector:@selector(inputCanceledInBuildingInputPanel:)])
        [self.inputDelegate inputCanceledInBuildingInputPanel:self];
}

- (IBAction)doneButtonPressed:(id)sender {
    if ([self.inputDelegate respondsToSelector:@selector(buildingInputPanel:inputCompleteWithName:)])
        [self.inputDelegate buildingInputPanel:self inputCompleteWithName:self.nameTextField.stringValue];
}

@end
