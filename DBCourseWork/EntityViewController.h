//
//  EntityViewController.h
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/15/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import <Cocoa/Cocoa.h>

FOUNDATION_EXPORT NSString *const TablesNeedToBeUpdatedNotification;

@interface EntityViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate>

@property (weak) IBOutlet NSTableView *tableView;

@property (weak, nonatomic) NSWindow *parentWindow;
@property (strong, nonatomic) NSManagedObjectContext *context;

- (IBAction)addButtonPressed:(NSButton *)sender;
- (IBAction)deleteButtonPressed:(NSButton *)sender;
- (IBAction)editButtonPressed:(NSButton *)sender;

- (void)updateTablesNotificationReceived;
- (void)sendUpdateTablesNotification;

@end
