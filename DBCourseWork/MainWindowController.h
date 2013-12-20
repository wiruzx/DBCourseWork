//
//  MainWindowController.h
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/15/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainWindowController : NSWindowController

@property (strong, nonatomic) NSManagedObjectContext *context;

@property (weak) IBOutlet NSTabView *tabView;

@end
