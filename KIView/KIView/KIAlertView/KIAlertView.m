//
//  KIAlertView.m
//  Kitaler
//
//  Created by kitaler on 12/7/23.
//  Copyright (c) 2014年 杨烽. All rights reserved.
//

#import "KIAlertView.h"

@interface KIAlertView () <UIAlertViewDelegate>

@property (nonatomic, copy) KIAlertViewClickedButtonAtIndexBlock          clickedButtonAtIndexBlock;
@property (nonatomic, copy) KIAlertViewCancelBlock                        cancelBlock;
@property (nonatomic, copy) KIAlertViewWillPresentBlock                   willPresentBlock;
@property (nonatomic, copy) KIAlertViewDidPresentBlock                    didPresentBlock;
@property (nonatomic, copy) KIAlertViewWillDismissWithButtonIndexBlock    willDismissWithButtonIndexBlock;
@property (nonatomic, copy) KIAlertViewDidDismissWithButtonIndexBlock     didDismissWithButtonIndexBlock;
@property (nonatomic, copy) KIAlertViewShouldEnableFirstOtherButtonBlock  shouldEnableFirstOtherButtonBlock;
@end

@implementation KIAlertView

- (void)dealloc {
    _userData = nil;
    _clickedButtonAtIndexBlock = nil;
    _cancelBlock = nil;
    _willPresentBlock = nil;
    _didPresentBlock = nil;
    _willDismissWithButtonIndexBlock = nil;
    _didDismissWithButtonIndexBlock = nil;
    _shouldEnableFirstOtherButtonBlock = nil;
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle {
    return [self initWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION {
    NSMutableArray *titles = nil;
    if(otherButtonTitles){
        titles =[[NSMutableArray alloc] init];
        [titles addObject:otherButtonTitles];
        
        va_list list;
        va_start(list, otherButtonTitles);
        
        NSString *title;
        while (YES){
            title = va_arg(list, NSString *);
            if (title == nil) {
                break;
            }
            [titles addObject:title];
        }
        va_end(list);
    }

    if (self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil]) {
        for (NSString *title in titles) {
            [self addButtonWithTitle:title];
        }
    }
    return self;
}

- (void)setClickedButtonAtIndexBlock:(KIAlertViewClickedButtonAtIndexBlock)block {
    _clickedButtonAtIndexBlock = [block copy];
}

- (void)setCancelBlock:(KIAlertViewCancelBlock)block {
    _cancelBlock = [block copy];
}

- (void)setWillPresentBlock:(KIAlertViewWillPresentBlock)block {
    _willPresentBlock = [block copy];
}

- (void)setDidPresent:(KIAlertViewDidPresentBlock)block {
    _didPresentBlock = [block copy];
}

- (void)setWillDismissWithButtonIndexBlock:(KIAlertViewWillDismissWithButtonIndexBlock)block {
    _willDismissWithButtonIndexBlock = [block copy];
}

- (void)setDidDismissWithButtonIndexBlock:(KIAlertViewDidDismissWithButtonIndexBlock)block {
    _didDismissWithButtonIndexBlock = [block copy];
}

- (void)setShouldEnableFirstOtherButtonBlock:(KIAlertViewShouldEnableFirstOtherButtonBlock)block {
    _shouldEnableFirstOtherButtonBlock = [block copy];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.clickedButtonAtIndexBlock != nil) {
        self.clickedButtonAtIndexBlock(self, buttonIndex);
    }
}

- (void)alertViewCancel:(UIAlertView *)alertView {
    if (self.cancelBlock != nil) {
        self.cancelBlock(self);
    }
}

- (void)willPresentAlertView:(UIAlertView *)alertView {
    if (self.willPresentBlock != nil) {
        self.willPresentBlock(self);
    }
}

- (void)didPresentAlertView:(UIAlertView *)alertView {
    if (self.didPresentBlock != nil) {
        self.didPresentBlock(self);
    }
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (self.willDismissWithButtonIndexBlock != nil) {
        self.willDismissWithButtonIndexBlock(self, buttonIndex);
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (self.didDismissWithButtonIndexBlock != nil) {
        self.didDismissWithButtonIndexBlock(self, buttonIndex);
    }
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView {
    if (self.shouldEnableFirstOtherButtonBlock != nil) {
        return self.shouldEnableFirstOtherButtonBlock(self);
    }
    return YES;
}

@end
