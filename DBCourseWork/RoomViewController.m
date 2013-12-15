//
//  RoomViewController.m
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/16/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import "RoomViewController.h"
#import "RoomInputPanel.h"
#import "Room.h"
#import "Building.h"
#import "Faculty.h"
#import "Departament.h"
#import "Laboratory.h"

@interface RoomViewController () <RoomInputPanelDelegate>

@property (strong, nonatomic) NSArray *rooms;

@end

@implementation RoomViewController

#pragma mark - Private methods

- (void)showCreateRoomPanel
{
    RoomInputPanel *inputPanel = [[RoomInputPanel alloc] init];
    inputPanel.inputDelegate = self;
    
    NSFetchRequest *buildingRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([Building class])];
    NSFetchRequest *facultyRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([Faculty class])];
    NSFetchRequest *departamentRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([Departament class])];
    NSFetchRequest *laboratoryRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([Laboratory class])];
    
    
    inputPanel.builgings = [self.context executeFetchRequest:buildingRequest error:nil];
    inputPanel.faculties = [self.context executeFetchRequest:facultyRequest error:nil];
    inputPanel.departaments = [self.context executeFetchRequest:departamentRequest error:nil];
    inputPanel.laboratories = [self.context executeFetchRequest:laboratoryRequest error:nil];
    
    
    [self.parentWindow beginSheet:inputPanel
                completionHandler:^(NSModalResponse returnCode) {
                    [self updateItems];
                }];
}

- (void)updateItems
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([Room class])];
    self.rooms = [self.context executeFetchRequest:request error:nil];
    [self.tableView reloadData];
}

#pragma mark - Actions

- (void)addButtonPressed:(NSButton *)sender
{
    [self showCreateRoomPanel];
}

#pragma mark - Room input panel delegate

- (void)roomInputPanel:(RoomInputPanel *)inputPanel
inputCompleteWithHeight:(NSNumber *)height
                length:(NSNumber *)length
                number:(NSNumber *)number
               purpose:(NSString *)purpose
                 stage:(NSNumber *)stage
                  type:(NSString *)type
                 width:(NSNumber *)width
              building:(Building *)building
           departament:(Departament *)departament
               faculty:(Faculty *)faculty
            laboratory:(Laboratory *)laboratory
{
    
    Room *newRoom = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Room class])
                                                  inManagedObjectContext:self.context];
    
    newRoom.height = height;
    newRoom.length = length;
    newRoom.number = number;
    newRoom.purpose = purpose;
    newRoom.stage = stage;
    newRoom.type = type;
    newRoom.width = width;
    
    [building addRoomsObject:newRoom];
    [departament addRoomsObject:newRoom];
    [faculty addRoomsObject:newRoom];
    [laboratory addRoomsObject:newRoom];
    
    [self.context save:nil];
    
    [self.parentWindow endSheet:inputPanel];
}

- (void)inputCanceledInRoomInputPanel:(RoomInputPanel *)inputPanel
{
    [self.parentWindow endSheet:inputPanel];
}

#pragma mark - View controller lifecycle

- (void)viewDidLoad
{
    NSTableColumn *heightColumn = [[NSTableColumn alloc] initWithIdentifier:@"Height"];
    [heightColumn.headerCell setTitle:@"Height"];
    [self.tableView addTableColumn:heightColumn];
    
    NSTableColumn *lengthColumn = [[NSTableColumn alloc] initWithIdentifier:@"Length"];
    [lengthColumn.headerCell setTitle:@"Length"];
    [self.tableView addTableColumn:lengthColumn];
    
    NSTableColumn *numberColumn = [[NSTableColumn alloc] initWithIdentifier:@"Number"];
    [numberColumn.headerCell setTitle:@"Number"];
    [self.tableView addTableColumn:numberColumn];
    
    NSTableColumn *purposeColumn = [[NSTableColumn alloc] initWithIdentifier:@"Purpose"];
    [purposeColumn.headerCell setTitle:@"Purpose"];
    [self.tableView addTableColumn:purposeColumn];
    
    NSTableColumn *stageColumn = [[NSTableColumn alloc] initWithIdentifier:@"Stage"];
    [stageColumn.headerCell setTitle:@"Stage"];
    [self.tableView addTableColumn:stageColumn];
    
    NSTableColumn *typeColumn = [[NSTableColumn alloc] initWithIdentifier:@"Type"];
    [typeColumn.headerCell setTitle:@"Type"];
    [self.tableView addTableColumn:typeColumn];
    
    NSTableColumn *widthColumn = [[NSTableColumn alloc] initWithIdentifier:@"Width"];
    [widthColumn.headerCell setTitle:@"Width"];
    [self.tableView addTableColumn:widthColumn];
    
    NSTableColumn *buildingColumn = [[NSTableColumn alloc] initWithIdentifier:@"Building"];
    [buildingColumn.headerCell setTitle:@"Building"];
    [self.tableView addTableColumn:buildingColumn];
    
    NSTableColumn *departamentColumn = [[NSTableColumn alloc] initWithIdentifier:@"Departament"];
    [departamentColumn.headerCell setTitle:@"Departament"];
    [self.tableView addTableColumn:departamentColumn];
    
    NSTableColumn *facultyColumn = [[NSTableColumn alloc] initWithIdentifier:@"Faculty"];
    [facultyColumn.headerCell setTitle:@"Faculty"];
    [self.tableView addTableColumn:facultyColumn];
    
    NSTableColumn *laboratoryColumn = [[NSTableColumn alloc] initWithIdentifier:@"Laboratory"];
    [laboratoryColumn.headerCell setTitle:@"Laboratory"];
    [self.tableView addTableColumn:laboratoryColumn];
    
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
    return self.rooms.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    Room *room = self.rooms[row];
    
    if ([tableColumn.identifier isEqualToString:@"Height"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        textField.stringValue = room.height.description;
        return textField;
        
    } else if ([tableColumn.identifier isEqualToString:@"Length"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        textField.stringValue = room.length.description;
        return textField;
        
    } else if ([tableColumn.identifier isEqualToString:@"Number"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        textField.stringValue = room.number.description;
        return textField;
        
    } else if ([tableColumn.identifier isEqualToString:@"Purpose"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        textField.stringValue = room.purpose;
        return textField;
        
    } else if ([tableColumn.identifier isEqualToString:@"Stage"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        textField.stringValue = room.stage.description;
        return textField;
        
    } else if ([tableColumn.identifier isEqualToString:@"Type"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        textField.stringValue = room.type;
        return textField;
        
    } else if ([tableColumn.identifier isEqualToString:@"Width"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        textField.stringValue = room.width.description;
        return textField;
        
    } else if ([tableColumn.identifier isEqualToString:@"Building"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        if (room.building.name) textField.stringValue = room.building.name;
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
        if (room.departament.name) textField.stringValue = room.departament.name;
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
        
        if (room.faculty.name) textField.stringValue = room.faculty.name;
        return textField;
        
    } else if ([tableColumn.identifier isEqualToString:@"Laboratory"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = tableColumn.identifier;
        }
        
        if (room.laboratory.responsablePerson) textField.stringValue = room.laboratory.responsablePerson;
        return textField;
        
    }
    
    return nil;
}

@end
