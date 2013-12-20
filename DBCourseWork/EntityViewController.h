//
//  EntityViewController.h
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/15/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import <Cocoa/Cocoa.h>

FOUNDATION_EXPORT NSString *const TablesNeedToBeUpdatedNotification;

#define DEFAULT_PANEL_RECT RectFromCGRect(CGRectMake(0.0, 0.0, 800.0, 600.0))

typedef NS_ENUM(NSInteger, EntityViewControllerType) {
    EntityViewControllerTypeRegular,
    EntityViewControllerTypeReadOnly
};

@interface EntityViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate>

@property (weak) IBOutlet NSTableView *tableView;

@property (weak, nonatomic) NSWindow *parentWindow;
@property (strong, nonatomic) NSManagedObjectContext *context;

@property (strong, nonatomic) NSPredicate *predicate;

@property (copy, nonatomic) void (^completionBlock)();
@property (assign, readonly) EntityViewControllerType type;

- (instancetype)initWithType:(EntityViewControllerType)type completion:(void (^)())completion;

- (IBAction)addButtonPressed:(NSButton *)sender;
- (IBAction)deleteButtonPressed:(NSButton *)sender;
- (IBAction)editButtonPressed:(NSButton *)sender;

- (void)updateTablesNotificationReceived;
- (void)sendUpdateTablesNotification;

- (void)viewDidLoad;

@end
