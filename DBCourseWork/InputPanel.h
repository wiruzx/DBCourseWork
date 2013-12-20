//
//  InputPanel.h
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/17/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class InputPanel;
@class InputView;

typedef NS_ENUM(NSInteger, InputMode) {
    InputModeNew,
    InputModeEdit
};

@protocol InputPanelDelegate <NSObject>

- (void)doneButtonPressedInInputPanel:(InputPanel *)inputPanel inputMode:(InputMode)inputMode;
- (void)cancelButtonPressedInInputPanel:(InputPanel *)inputPanel;

@end

@interface InputPanel : NSPanel

@property (weak, nonatomic) id <InputPanelDelegate> inputDelegate;
@property (readonly) InputView *inputView;
@property (readonly) InputMode inputMode;

- (instancetype)initWithInputView:(InputView *)inputView
                        inputMode:(InputMode)inputMode
                         delegate:(id <InputPanelDelegate>)delegate;

@end
