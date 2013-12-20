//
//  EntityViewController.m
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/15/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import "EntityViewController.h"

NSString *const TablesNeedToBeUpdatedNotification = @"TablesNeedToBeUpdatedNotification;";

@interface EntityViewController ()
@property (weak) IBOutlet NSButton *closeButton;
@property (weak) IBOutlet NSButton *deleteButton;
@property (weak) IBOutlet NSButton *editButton;
@property (weak) IBOutlet NSButton *addButton;

@end

@implementation EntityViewController

@synthesize type = _type;

#pragma mark - Initialization

- (id)init
{
    if (self = [self initWithType:EntityViewControllerTypeRegular completion:nil]) {
        
    }
    return self;
}

- (instancetype)initWithType:(EntityViewControllerType)type completion:(void (^)())completion
{
    if (self = [self initWithNibName:@"EntityViewController" bundle:nil]) {
        _type = type;
        self.completionBlock = completion;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(updateTablesNotificationReceived)
                                                     name:TablesNeedToBeUpdatedNotification
                                                   object:nil];
        
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.closeButton.target = self; self.closeButton.action = @selector(closeButtonPressed:);
}

- (void)updateTablesNotificationReceived
{
    
}

- (void)sendUpdateTablesNotification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:TablesNeedToBeUpdatedNotification object: nil];
}

//- (IBAction)addButtonPressed:(NSButton *)sender {
//    
//}
//
//- (IBAction)deleteButtonPressed:(NSButton *)sender {
//    
//}
//
//- (IBAction)editButtonPressed:(NSButton *)sender {
//    
//}

- (IBAction)closeButtonPressed:(NSButton *)sender {
    if (self.completionBlock) self.completionBlock();
}

- (void)loadView
{
    [super loadView];
    [self viewDidLoad];
}

- (void)viewDidLoad
{
    switch (self.type) {
        case EntityViewControllerTypeRegular:
            
            break;
        case EntityViewControllerTypeReadOnly:
            [self.editButton setHidden:YES];
            [self.deleteButton setHidden:YES];
            [self.addButton setHidden:YES];
            [self.closeButton setHidden:NO];
            break;
    }
}

@end
