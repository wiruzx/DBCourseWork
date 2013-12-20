//
//  InputPanel.m
//  DBCourseWork
//
//  Created by Виктор Шаманов on 12/17/13.
//  Copyright (c) 2013 Victor Shamanov. All rights reserved.
//

#import "InputPanel.h"
#import "InputView.h"

@interface InputPanel ()

@property (weak, nonatomic) IBOutlet NSView *inputContainerView;
@property (strong, nonatomic) InputView *inputView;
@property (assign, nonatomic) InputMode inputMode;

- (IBAction)doneButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;

@end

@implementation InputPanel

#pragma mark - Initialization

- (instancetype)initWithInputView:(InputView *)inputView inputMode:(InputMode)inputMode delegate:(id<InputPanelDelegate>)delegate
{
    if (self = [self init]) {
        self.inputView = inputView;
        
        [self setFrame:NSRectFromCGRect(CGRectMake(0.0, 0.0, inputView.frame.size.width, inputView.frame.size.height + 56.0)) display:YES];
        
        self.inputMode = inputMode;
        self.inputDelegate = delegate;
        [self.inputContainerView addSubview:self.inputView];
        self.inputView.frame = self.inputContainerView.bounds;
    }
    return self;
}

- (id)init
{
    NSNib *nib = [[NSNib alloc] initWithNibNamed:NSStringFromClass(self.class) bundle:nil];
    NSArray *topLevelObjects;
    if ([nib instantiateWithOwner:self topLevelObjects:&topLevelObjects]) {
        for (id topLevelObject in topLevelObjects) {
            if ([topLevelObject isKindOfClass:self.class]) {
                self = topLevelObject;
                return self;
            }
        }
    }
    return nil;
}

#pragma mark - Settets

#pragma mark - Actions

- (void)doneButtonPressed:(id)sender
{
    if ([self.inputDelegate respondsToSelector:@selector(doneButtonPressedInInputPanel:inputMode:)])
        [self.inputDelegate doneButtonPressedInInputPanel:self inputMode:self.inputMode];
}

- (void)cancelButtonPressed:(id)sender
{
    if ([self.inputDelegate respondsToSelector:@selector(cancelButtonPressedInInputPanel:)])
        [self.inputDelegate cancelButtonPressedInInputPanel:self];
}

@end
