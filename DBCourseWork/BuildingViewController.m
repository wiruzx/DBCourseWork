//
//  BuildingViewController.m
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/15/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import "BuildingViewController.h"
#import "BuildingInputPanel.h"
#import "Building.h"

@interface BuildingViewController () <BuildingInputPanelDelegate>

@property (strong, nonatomic) NSArray *buildings;

@end

@implementation BuildingViewController

#pragma mark - Private Methods

- (void)createBuilding
{
    BuildingInputPanel *inputPanel = [[BuildingInputPanel alloc] init];
    inputPanel.inputDelegate = self;
    
    [self.parentWindow beginSheet:inputPanel completionHandler:^(NSModalResponse returnCode) {
        [self updateItems];
    }];
}

- (void)updateItems
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([Building class])];
    self.buildings = [self.context executeFetchRequest:request error:nil];
    [self.tableView reloadData];
}

#pragma mark - Building input panel delegate

- (void)buildingInputPanel:(BuildingInputPanel *)inputPanel inputCompleteWithName:(NSString *)name
{
    Building *newBuilding = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Building class])
                                                          inManagedObjectContext:self.context];
    newBuilding.name = name;
    [self.context save:nil];
    
    [self.parentWindow endSheet:inputPanel];
}

- (void)inputCanceledInBuildingInputPanel:(BuildingInputPanel *)inptuPanel
{
    [self.parentWindow endSheet:inptuPanel];
}

#pragma mark - Actions

- (IBAction)addButtonPressed:(NSButton *)sender {
    [self createBuilding];
}

#pragma mark - View controller lifecycle

- (void)loadView
{
    [super loadView];
    [self viewDidLoad];
}

- (void)viewDidLoad
{
    NSTableColumn *nameColumn = [[NSTableColumn alloc] initWithIdentifier:@"Name"];
    [nameColumn.headerCell setTitle:@"Name"];
    [self.tableView addTableColumn:nameColumn];
    
    NSTableColumn *roomsColumn = [[NSTableColumn alloc] initWithIdentifier:@"Rooms"];
    [roomsColumn.headerCell setTitle:@"Rooms"];
    [self.tableView addTableColumn:roomsColumn];
    
    [self updateItems];
}

#pragma mark - Table view delegate & data source

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return self.buildings.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    static NSString *const NameIdentifier = @"NameCell";
    static NSString *const RoomsIdentifier = @"RoomsCell";
    
    Building *building = self.buildings[row];
    
    if ([tableColumn.identifier isEqualToString:@"Name"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:NameIdentifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = NameIdentifier;
        }
        
        textField.stringValue = building.name;
        return textField;
        
    } else if ([tableColumn.identifier isEqualToString:@"Rooms"]) {
        
        NSTextField *textField = [tableView makeViewWithIdentifier:RoomsIdentifier owner:self];
        
        if (!textField) {
            textField = [[NSTextField alloc] init];
            [textField setEditable:NO];
            [textField setBordered:NO];
            [textField setDrawsBackground:NO];
            textField.identifier = RoomsIdentifier;
        }
        
        textField.integerValue = building.rooms.count;
        return textField;
        
    }
    
    return nil;
}

@end
