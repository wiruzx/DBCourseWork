//
//  MainWindowController.m
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/15/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import "MainWindowController.h"
#import "BuildingViewController.h"
#import "FacultyViewController.h"
#import "DepartamentViewController.h"
#import "LaboratoryViewController.h"
#import "RoomViewController.h"

@interface MainWindowController ()

@property (strong, nonatomic) BuildingViewController *buildingViewController;
@property (strong, nonatomic) FacultyViewController *facultyViewController;
@property (strong, nonatomic) DepartamentViewController *departamentViewController;
@property (strong, nonatomic) LaboratoryViewController *laboratoryViewController;
@property (strong, nonatomic) RoomViewController *roomViewController;

@property (weak) IBOutlet NSTabView *tabView;

@end

@implementation MainWindowController

#pragma mark - Initialization

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        
    }
    return self;
}

#pragma mark - Window lifecycle

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    NSTabViewItem *buildingTabItem = self.tabView.tabViewItems[0];
    self.buildingViewController = [[BuildingViewController alloc] init];
    self.buildingViewController.parentWindow = self.window;
    self.buildingViewController.context = self.context;
    buildingTabItem.view = self.buildingViewController.view;
    
    NSTabViewItem *facultyTabItem = self.tabView.tabViewItems[1];
    self.facultyViewController = [[FacultyViewController alloc] init];
    self.facultyViewController.parentWindow = self.window;
    self.facultyViewController.context = self.context;
    facultyTabItem.view = self.facultyViewController.view;
    
    NSTabViewItem *departamentTabItem = self.tabView.tabViewItems[2];
    self.departamentViewController = [[DepartamentViewController alloc] init];
    self.departamentViewController.parentWindow = self.window;
    self.departamentViewController.context = self.context;
    departamentTabItem.view = self.departamentViewController.view;
    
    NSTabViewItem *laboratoriesTabItem = self.tabView.tabViewItems[3];
    self.laboratoryViewController = [[LaboratoryViewController alloc] init];
    self.laboratoryViewController.parentWindow = self.window;
    self.laboratoryViewController.context = self.context;
    laboratoriesTabItem.view = self.laboratoryViewController.view;
    
    NSTabViewItem *roomTabItem = self.tabView.tabViewItems[4];
    self.roomViewController = [[RoomViewController alloc] init];
    self.roomViewController.parentWindow = self.window;
    self.roomViewController.context = self.context;
    roomTabItem.view = self.roomViewController.view;

}

@end
