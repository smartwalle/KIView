//
//  KIActionSheet.h
//  Kitaler
//
//  Created by kitaler on 14/7/23.
//  Copyright (c) 2014年 杨烽. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KIActionSheet;
typedef void(^KIActionSheetClickedButtonAtIndexBlock)       (KIActionSheet *actionSheet, NSInteger buttonIndex);
typedef void(^KIActionSheetCancelBlock)                     (KIActionSheet *actionSheet);
typedef void(^KIActionSheetWillPresentBlock)                (KIActionSheet *actionSheet);
typedef void(^KIActionSheetDidPresentBlock)                 (KIActionSheet *actionSheet);
typedef void(^KIActionSheetWillDismissWithButtonIndexBlock) (KIActionSheet *actionSheet, NSInteger buttonIndex);
typedef void(^KIActionSheetDidDismissWithButtonIndexBlock)  (KIActionSheet *actionSheet, NSInteger buttonIndex);

@interface KIActionSheet : UIActionSheet

@property (nonatomic, strong) id userData;

- (id)initWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

- (void)setClickedButtonAtIndexBlock:(KIActionSheetClickedButtonAtIndexBlock)block;
- (void)setCancelBlock:(KIActionSheetCancelBlock)block;
- (void)setWillPresentBlock:(KIActionSheetWillPresentBlock)block;
- (void)setDidPresentBlock:(KIActionSheetDidPresentBlock)block;
- (void)setWillDismissWithButtonIndexBlock:(KIActionSheetWillDismissWithButtonIndexBlock)block;
- (void)setDidDismissWithButtonIndexBlock:(KIActionSheetDidDismissWithButtonIndexBlock)block;

- (void)showInWindow;

@end
