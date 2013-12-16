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


@end

@implementation EntityViewController

#pragma mark - Initialization

- (id)init
{
    if (self = [self initWithNibName:@"EntityViewController" bundle:nil]) {
        
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(updateTables)
                                                     name:TablesNeedToBeUpdatedNotification
                                                   object:nil];
    }
    return self;
}

- (void)updateTables
{
    
}

- (IBAction)addButtonPressed:(NSButton *)sender {
    
}


@end
