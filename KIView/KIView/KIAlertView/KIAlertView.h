//
//  KIAlertView.h
//  Kitaler
//
//  Created by kitaler on 12/7/23.
//  Copyright (c) 2014年 杨烽. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KIAlertView;
typedef void(^KIAlertViewClickedButtonAtIndexBlock)         (KIAlertView *alertView, NSInteger buttonIndex);
typedef void(^KIAlertViewCancelBlock)                       (KIAlertView *alertView);
typedef void(^KIAlertViewWillPresentBlock)                  (KIAlertView *alertView);
typedef void(^KIAlertViewDidPresentBlock)                   (KIAlertView *alertView);
typedef void(^KIAlertViewWillDismissWithButtonIndexBlock)   (KIAlertView *alertView, NSInteger buttonIndex);
typedef void(^KIAlertViewDidDismissWithButtonIndexBlock)    (KIAlertView *alertView, NSInteger buttonIndex);
typedef BOOL(^KIAlertViewShouldEnableFirstOtherButtonBlock) (KIAlertView *alertView);

@interface KIAlertView : UIAlertView

@property (nonatomic, strong) id userData;

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle;
- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

- (void)setClickedButtonAtIndexBlock:(KIAlertViewClickedButtonAtIndexBlock)block;
- (void)setCancelBlock:(KIAlertViewCancelBlock)block;
- (void)setWillPresentBlock:(KIAlertViewWillPresentBlock)block;
- (void)setDidPresent:(KIAlertViewDidPresentBlock)block;
- (void)setWillDismissWithButtonIndexBlock:(KIAlertViewWillDismissWithButtonIndexBlock)block;
- (void)setDidDismissWithButtonIndexBlock:(KIAlertViewDidDismissWithButtonIndexBlock)block;
- (void)setShouldEnableFirstOtherButtonBlock:(KIAlertViewShouldEnableFirstOtherButtonBlock)block;

@end
