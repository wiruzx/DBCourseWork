//
//  BuildingInputPanel.h
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/15/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class BuildingInputPanel;

@protocol BuildingInputPanelDelegate <NSObject>

- (void)buildingInputPanel:(BuildingInputPanel *)inputPanel inputCompleteWithName:(NSString *)name;

@optional;
- (void)inputCanceledInBuildingInputPanel:(BuildingInputPanel *)inptuPanel;

@end

@interface BuildingInputPanel : NSPanel

@property (weak, nonatomic) id <BuildingInputPanelDelegate> inputDelegate;

@end
