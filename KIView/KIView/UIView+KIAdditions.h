//
//  UIView+KIView.h
//  Kitalker
//
//  Created by 杨 烽 on 12-7-6.
//  Copyright (c) 2012年 杨 烽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define KIViewWithTarget(target, tag) ((id)[target viewWithTag:tag])

@interface UIView (KIAdditions)

@property (nonatomic, assign) id userInfo;

@property (nonatomic, assign) IBInspectable BOOL masksToBounds;

// 设置圆角
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

// 设置边框颜色 和 边框宽度
@property (nonatomic, strong) IBInspectable UIColor *borderColor;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

// 设置外阴影
@property (nonatomic, strong) IBInspectable UIColor *shadowColor;
@property (nonatomic, assign) IBInspectable CGFloat shadowOpacity;
@property (nonatomic, assign) IBInspectable CGSize  shadowOffset;
@property (nonatomic, assign) IBInspectable CGFloat shadowRadius;

/*快照*/
- (UIImage *)snapshot;

/*清除背景颜色*/
- (void)clearBackgroundColor;

/*设置背景图片*/
- (void)setBackgroundImage:(UIImage *)image;

/*设置View层顺序*/
- (void)setIndex:(NSInteger)index;

/*设置为最顶层View*/
- (void)bringToFront;

/*设置为最底层View*/
- (void)sendToBack;

- (void)registEndEditing;

- (void)setBorderColor:(UIColor *)color width:(CGFloat)width cornerRadius:(CGFloat)radius;

- (void)setBorderColor:(UIColor *)color width:(CGFloat)width;

/*设置外阴影*/
- (void)setShadowColor:(UIColor *)color opacity:(CGFloat)opacity offset:(CGSize)offset blurRadius:(CGFloat)blurRadius;

- (UITapGestureRecognizer *)addTapGestureWithTarget:(id)target selector:(SEL)selector;

- (UIViewController *)viewController;

- (void)showWaitingView:(void(^)(UIActivityIndicatorView *waitView))block;
- (void)hideWaitingView:(void(^)(UIActivityIndicatorView *waitView))block;
- (BOOL)isWaiting;

@end
