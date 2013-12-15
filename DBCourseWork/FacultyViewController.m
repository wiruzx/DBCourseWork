//
//  FacultyViewController.m
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/15/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import "FacultyViewController.h"
#import "FacultyInputPanel.h"
#import "Faculty.h"

@interface FacultyViewController () <FacultyInputPanelDelegate>

@property (strong, nonatomic) NSArray *faculties;

@end

@implementation FacultyViewController

#pragma mark - Private methods

- (void)showCreateFacultyPanel
{
    FacultyInputPanel *inputPanel = [[FacultyInputPanel alloc] init];
    inputPanel.inputDelegate = self;
    
    [self.parentWindow beginSheet:inputPanel
                completionHandler:^(NSModalResponse returnCode) {
                    [self updateItems];
                }];
    
    
}

- (void)updateItems
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([Faculty class])];
    self.faculties = [self.context executeFetchRequest:request error:nil];
    [self.tableView reloadData];
}

#pragma mark - Actions

- (void)addButtonPressed:(NSButton *)sender
{
    [self showCreateFacultyPanel];
}

#pragma mark - Faculty input panel delegate

- (void)facultyInputPanel:(FacultyInputPanel *)inputPanel inputCompleteWithName:(NSString *)name dean:(NSString *)dean
{
    Faculty *newFaculty = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Faculty class])
                                                        inManagedObjectContext:self.context];
    
    newFaculty.name = name;
    newFaculty.dean = dean;
    
    [self.context save:nil];
    
    [self.parentWindow endSheet:inputPanel];
}

- (void)inputCanceledInFacultyInputPanel:(FacultyInputPanel *)inputPanel
{
    [self.parentWindow endSheet:inputPanel];
}

#pragma mark - View controller lifecycle

- (void)viewDidLoad
{
    NSTableColumn *nameColumn = [[NSTableColumn alloc] initWithIdentifier:@"Name"];
    [nameColumn.headerCell setTitle:@"Name"];
    [self.tableView addTableColumn:nameColumn];

    NSTableColumn *deanColumn = [[NSTableColumn alloc] initWithIdentifier:@"Dean"];
    [deanColumn.headerCell setTitle:@"Dean"];
    [self.tableView addTableColumn:deanColumn];

    NSTableColumn *departamentsColumn = [[NSTableColumn alloc] initWithIdentifier:@"Departaments"];
    [departamentsColumn.headerCell setTitle:@"Departaments"];
    [self.tableView addTableColumn:departamentsColumn];

    NSTableColumn *roomsColumn = [[NSTableColumn alloc] initWithIdentifier:@"Rooms"];
    [roomsColumn.headerCell setTitle:@"Rooms"];
    [self.tableView addTableColumn:roomsColumn];

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
    return self.faculties.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    Faculty *faculty = self.faculties[row];
    
    if ([tableColumn.identifier isEqualToString:@"Name"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        textField.stringValue = faculty.name;
        return textField;
        
    } else if ([tableColumn.identifier isEqualToString:@"Dean"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        textField.stringValue = faculty.dean;
        return textField;
        
    } else if ([tableColumn.identifier isEqualToString:@"Departaments"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        textField.integerValue = faculty.departaments.count;
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
        
        textField.integerValue = faculty.rooms.count;
        return textField;
    }
    
    return nil;
}

@end

