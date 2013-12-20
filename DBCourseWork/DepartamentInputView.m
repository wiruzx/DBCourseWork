//
//  DepartamentInputView.m
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/19/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import "DepartamentInputView.h"
#import "Faculty.h"

@interface DepartamentInputView () <NSComboBoxDataSource>

@end

@implementation DepartamentInputView

#pragma mark - Combo box data source

- (NSInteger)numberOfItemsInComboBox:(NSComboBox *)aComboBox
{
    return self.faculties.count;
}

- (id)comboBox:(NSComboBox *)aComboBox objectValueForItemAtIndex:(NSInteger)index
{
    if (index < 0) return nil;
    return [self.faculties[index] name];
}

@end
