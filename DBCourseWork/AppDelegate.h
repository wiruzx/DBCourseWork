//
//  AppDelegate.h
//  DBCourseWork
//
//  Created by Виктор Шаманов on 10/28/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MainWindowController;

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (strong, nonatomic) MainWindowController *mainWindowController;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;

@end
