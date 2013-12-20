//
//  LaboratoryInputView.m
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/20/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import "LaboratoryInputView.h"
#import "Departament.h"

@interface LaboratoryInputView () <NSComboBoxDataSource>

@end

@implementation LaboratoryInputView

#pragma mark - Combo box data source

- (NSInteger)numberOfItemsInComboBox:(NSComboBox *)aComboBox
{
    return self.departaments.count;
}

- (id)comboBox:(NSComboBox *)aComboBox objectValueForItemAtIndex:(NSInteger)index
{
    if (index < 0) return nil;
    
    return [self.departaments[index] name];
    
}

@end
