//
//  LaboratoryViewController.m
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/16/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import "LaboratoryViewController.h"
#import "LaboratoryInputPanel.h"
#import "Departament.h"
#import "Laboratory.h"

@interface LaboratoryViewController () <LaboratoryInputPanelDelegate>

@property (strong, nonatomic) NSArray *laboratories;

@end

@implementation LaboratoryViewController

#pragma mark - Public methods

- (void)updateTables
{
    [self updateItems];
}

#pragma mark - Private methods

- (void)showCreateFacultyPanel
{
    
    LaboratoryInputPanel *inputPanel = [[LaboratoryInputPanel alloc] init];
    inputPanel.inputDelegate = self;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([Departament class])];
    
    inputPanel.departaments = [self.context executeFetchRequest:request error:nil];
    
    [self.parentWindow beginSheet:inputPanel
                completionHandler:^(NSModalResponse returnCode) {
                    [self updateItems];
                    [[NSNotificationCenter defaultCenter] postNotificationName:TablesNeedToBeUpdatedNotification object:nil];
                }];
    
}

- (void)updateItems
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([Laboratory class])];
    self.laboratories = [self.context executeFetchRequest:request error:nil];
    [self.tableView reloadData];
}

#pragma mark - Actions

- (void)addButtonPressed:(NSButton *)sender
{
    [self showCreateFacultyPanel];
}

#pragma mark - Laboratory input panel delegate

- (void)laboratoryInputPanel:(LaboratoryInputPanel *)inputPanel inputCompleteWithResponsable:(NSString *)responsablePerson departament:(Departament *)departament
{
    
    Laboratory *newLaboratory = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Laboratory class])
                                                              inManagedObjectContext:self.context];
    
    newLaboratory.responsablePerson = responsablePerson;
    
    [departament addLaboratoriesObject:newLaboratory];
    
    [self.context save:nil];
    
    [self.parentWindow endSheet:inputPanel];
}

- (void)inputCanceledInLaboratoryInputPanel:(LaboratoryInputPanel *)inputPanel
{
    [self.parentWindow endSheet:inputPanel];
}

#pragma mark - View controller lifecycle

- (void)viewDidLoad
{
    [self.tableView addTableColumn:({
        NSTableColumn *column = [[NSTableColumn alloc] initWithIdentifier:@"Responsable"];
        [column.headerCell setTitle:@"Responsable"];
        column;
    })];
    
    [self.tableView addTableColumn:({
        NSTableColumn *column = [[NSTableColumn alloc] initWithIdentifier:@"Departament"];
        [column.headerCell setTitle:@"Departament"];
        column;
    })];
    
    [self.tableView addTableColumn:({
        NSTableColumn *column = [[NSTableColumn alloc] initWithIdentifier:@"Rooms"];
        [column.headerCell setTitle:@"Rooms"];
        column;
    })];
    
    [self updateItems];
}

- (void)loadView
{
    [super loadView];
    [self viewDidLoad];
}

#pragma mark - Table view delegate & data source

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return self.laboratories.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    Laboratory *laboratory = self.laboratories[row];
    
    if ([tableColumn.identifier isEqualToString:@"Responsable"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        textField.stringValue = laboratory.responsablePerson;
        return textField;
        
    } else if ([tableColumn.identifier isEqualToString:@"Departament"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        if (laboratory.departament.name)
            textField.stringValue = laboratory.departament.name;
        return textField;
        
    } else if ([tableColumn.identifier isEqualToString:@"Rooms"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        textField.integerValue = laboratory.rooms.count;
        return textField;
        
    }
    
    return nil;
}


@end
