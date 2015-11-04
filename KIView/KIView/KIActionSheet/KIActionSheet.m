//
//  KIActionSheet.m
//  Kitaler
//
//  Created by kitaler on 14/7/23.
//  Copyright (c) 2014年 杨烽. All rights reserved.
//

#import "KIActionSheet.h"

@interface KIActionSheet () <UIActionSheetDelegate>

@property (nonatomic, copy) KIActionSheetClickedButtonAtIndexBlock        clickedButtonAtIndexBlock;
@property (nonatomic, copy) KIActionSheetCancelBlock                      cancelBlock;
@property (nonatomic, copy) KIActionSheetWillPresentBlock                 willPresentBlock;
@property (nonatomic, copy) KIActionSheetDidPresentBlock                  didPresentBlock;
@property (nonatomic, copy) KIActionSheetWillDismissWithButtonIndexBlock  willDismissWithButtonIndexBlock;
@property (nonatomic, copy) KIActionSheetDidDismissWithButtonIndexBlock   didDismissWithButtonIndexBlock;

@end

@implementation KIActionSheet

- (void)dealloc {
    _clickedButtonAtIndexBlock = nil;
    _cancelBlock = nil;
    _willPresentBlock = nil;
    _didPresentBlock = nil;
    _willDismissWithButtonIndexBlock = nil;
    _didDismissWithButtonIndexBlock = nil;
    _userData = nil;
}

- (id)initWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION {
    NSMutableArray *titles = nil;
    if (otherButtonTitles) {
        titles = [[NSMutableArray alloc] init];
        [titles addObject:otherButtonTitles];
        
        va_list list;
        va_start(list, otherButtonTitles);
        
        NSString *title;
        while(YES) {
            title = va_arg(list, NSString *);
            if (title == nil) {
                break;
            }
            [titles addObject:title];
        }
        va_end(list);
    }
    if (self = [super initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:nil]) {
        NSInteger cancelButtonIndex = self.cancelButtonIndex;
        for (NSString *title in titles) {
            cancelButtonIndex++;
            [self addButtonWithTitle:title];
        }
        
        if (destructiveButtonTitle) {
            cancelButtonIndex += 1;
        }
        
        if (cancelButtonTitle) {
            cancelButtonIndex += 1;
            [self addButtonWithTitle:cancelButtonTitle];
            
            [self setCancelButtonIndex:cancelButtonIndex];
        }
    }
    return self;
}

- (void)setClickedButtonAtIndexBlock:(KIActionSheetClickedButtonAtIndexBlock)block {
    _clickedButtonAtIndexBlock = [block copy];
}

- (void)setCancelBlock:(KIActionSheetCancelBlock)block {
    _cancelBlock = [block copy];
}

- (void)setWillPresentBlock:(KIActionSheetWillPresentBlock)block {
    _willPresentBlock = [block copy];
}

- (void)setDidPresentBlock:(KIActionSheetDidPresentBlock)block {
    _didPresentBlock = [block copy];
}

- (void)setWillDismissWithButtonIndexBlock:(KIActionSheetWillDismissWithButtonIndexBlock)block {
    _willDismissWithButtonIndexBlock = [block copy];
}

- (void)setDidDismissWithButtonIndexBlock:(KIActionSheetDidDismissWithButtonIndexBlock)block {
    _didDismissWithButtonIndexBlock = [block copy];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.clickedButtonAtIndexBlock != nil) {
        self.clickedButtonAtIndexBlock(self, buttonIndex);
    }
}

- (void)showInWindow {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [self showInView:window];
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet {
    if (self.cancelBlock != nil) {
        self.cancelBlock(self);
    }
}

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet {
    if (self.willPresentBlock != nil) {
        self.willPresentBlock(self);
    }
}

- (void)didPresentActionSheet:(UIActionSheet *)actionSheet {
    if (self.didPresentBlock != nil) {
        self.didPresentBlock(self);
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (self.willDismissWithButtonIndexBlock != nil) {
        self.willDismissWithButtonIndexBlock(self, buttonIndex);
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (self.didDismissWithButtonIndexBlock != nil) {
        self.didDismissWithButtonIndexBlock(self, buttonIndex);
    }
}

@end
