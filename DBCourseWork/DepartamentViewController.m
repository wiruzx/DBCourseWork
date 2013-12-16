//
//  DepartamentViewController.m
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/16/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import "DepartamentViewController.h"
#import "DepartamentInputPanel.h"
#import "Departament.h"
#import "Faculty.h"

@interface DepartamentViewController () <DepartamentInputPanelDelegate>

@property (strong, nonatomic) NSArray *departaments;

@end

@implementation DepartamentViewController

#pragma mark - Public methods

- (void)updateTables
{
    [self updateItems];
}

#pragma mark - Private methods

- (void)showCreateFacultyPanel
{
    DepartamentInputPanel *inputPanel = [[DepartamentInputPanel alloc] init];
    inputPanel.inputDelegate = self;
    
    NSFetchRequest *facultiesRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([Faculty class])];
    
    inputPanel.faculties = [self.context executeFetchRequest:facultiesRequest error:nil];
    
    [self.parentWindow beginSheet:inputPanel
                completionHandler:^(NSModalResponse returnCode) {
                    [self updateItems];
                    [[NSNotificationCenter defaultCenter] postNotificationName:TablesNeedToBeUpdatedNotification object:nil];
                }];
    
}

- (void)updateItems
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([Departament class])];
    self.departaments = [self.context executeFetchRequest:request error:nil];
    [self.tableView reloadData];
}

#pragma mark - Actions

- (void)addButtonPressed:(NSButton *)sender
{
    [self showCreateFacultyPanel];
}

#pragma mark - Faculty input panel delegate

//- (void)facultyInputPanel:(FacultyInputPanel *)inputPanel inputCompleteWithName:(NSString *)name dean:(NSString *)dean
//{
//    Faculty *newFaculty = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Faculty class])
//                                                        inManagedObjectContext:self.context];
//    
//    newFaculty.name = name;
//    newFaculty.dean = dean;
//    
//    [self.context save:nil];
//    
//    [self.parentWindow endSheet:inputPanel];
//}
//
//- (void)inputCanceledInFacultyInputPanel:(FacultyInputPanel *)inputPanel
//{
//    [self.parentWindow endSheet:inputPanel];
//}

- (void)departamentInputPanel:(DepartamentInputPanel *)inputPanel inputCompleteWithName:(NSString *)name head:(NSString *)head specialization:(NSString *)specialization faculty:(Faculty *)faculty
{
    
    Departament *newDepartament = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Departament class])
                                                                inManagedObjectContext:self.context];
    
    newDepartament.name = name;
    newDepartament.headOfDepartament = head;
    newDepartament.specialization = specialization;
    
    [faculty addDepartamentsObject:newDepartament];
    
    [self.context save:nil];
    
    [self.parentWindow endSheet:inputPanel];
}

- (void)inputCanceledInDepartamentInputPanel:(DepartamentInputPanel *)inputPanel
{
    [self.parentWindow endSheet:inputPanel];
}

#pragma mark - View controller lifecycle

- (void)viewDidLoad
{
    [self.tableView addTableColumn:({
        NSTableColumn *column = [[NSTableColumn alloc] initWithIdentifier:@"Name"];
        [column.headerCell setTitle:@"Name"];
        column;
    })];
    
    [self.tableView addTableColumn:({
        NSTableColumn *column = [[NSTableColumn alloc] initWithIdentifier:@"Head"];
        [column.headerCell setTitle:@"Head"];
        column;
    })];
    
    [self.tableView addTableColumn:({
        NSTableColumn *column = [[NSTableColumn alloc] initWithIdentifier:@"Specialization"];
        [column.headerCell setTitle:@"Specialization"];
        column;
    })];
    
    [self.tableView addTableColumn:({
        NSTableColumn *column = [[NSTableColumn alloc] initWithIdentifier:@"Faculty"];
        [column.headerCell setTitle:@"Faculty"];
        column;
    })];
    
    [self.tableView addTableColumn:({
        NSTableColumn *column = [[NSTableColumn alloc] initWithIdentifier:@"Laboratories"];
        [column.headerCell setTitle:@"Laboratories"];
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
    return self.departaments.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    Departament *departament = self.departaments[row];
    
    if ([tableColumn.identifier isEqualToString:@"Name"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        textField.stringValue = departament.name;
        return textField;
        
    } else if ([tableColumn.identifier isEqualToString:@"Head"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        textField.stringValue = departament.headOfDepartament;
        return textField;
        
    } else if ([tableColumn.identifier isEqualToString:@"Specialization"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        textField.stringValue = departament.specialization;
        return textField;
        
    } else if ([tableColumn.identifier isEqualToString:@"Faculty"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        textField.stringValue = departament.faculty.name;
        return textField;
        
    } else if ([tableColumn.identifier isEqualToString:@"Laboratories"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        textField.integerValue = departament.laboratories.count;
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
        
        textField.integerValue = departament.rooms.count;
        return textField;
        
    } else
    
    return nil;
}

@end
