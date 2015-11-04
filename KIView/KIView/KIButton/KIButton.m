//
//  KIButton.m
//  Kitalker
//
//  Created by 杨 烽 on 13-12-24.
//
//

#import "KIButton.h"
#import "UIImage+KIAdditions.h"

#define kAlphaVisibleThreshold (0.1f)

@interface KIButton ()
@property (nonatomic, assign) CGPoint   previousTouchPoint;
@property (nonatomic, assign) BOOL      previousTouchHitTestResponse;
@end

@implementation KIButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self resetHitTestCache];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if (self) {
        [self resetHitTestCache];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self resetHitTestCache];
}

- (BOOL)isAlphaVisibleAtPoint:(CGPoint)point forImage:(UIImage *)image {
    CGSize iSize = image.size;
    CGSize bSize = self.bounds.size;
    point.x *= (bSize.width != 0) ? (iSize.width / bSize.width) : 1;
    point.y *= (bSize.height != 0) ? (iSize.height / bSize.height) : 1;
    
    CGColorRef pixelColor = [[image colorAtPixel:point] CGColor];
    CGFloat alpha = CGColorGetAlpha(pixelColor);
    return alpha >= kAlphaVisibleThreshold;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL superResult = [super pointInside:point withEvent:event];
    
    if (!self.irregularly) {
        return superResult;
    }
    
    if (!superResult) {
        return superResult;
    }
    
    if (CGPointEqualToPoint(point, self.previousTouchPoint)) {
        return self.previousTouchHitTestResponse;
    } else {
        self.previousTouchPoint = point;
    }
    
    UIImage *buttonImage = [self imageForState:UIControlStateNormal];
    UIImage *buttonBackground = [self backgroundImageForState:UIControlStateNormal];
    
    BOOL response = NO;
    
    if (buttonImage == nil && buttonBackground == nil) {
        response = YES;
    }
    else if (buttonImage != nil && buttonBackground == nil) {
        response = [self isAlphaVisibleAtPoint:point forImage:buttonImage];
    }
    else if (buttonImage == nil && buttonBackground != nil) {
        response = [self isAlphaVisibleAtPoint:point forImage:buttonBackground];
    }
    else {
        if ([self isAlphaVisibleAtPoint:point forImage:buttonImage]) {
            response = YES;
        } else {
            response = [self isAlphaVisibleAtPoint:point forImage:buttonBackground];
        }
    }
    
    self.previousTouchHitTestResponse = response;
    return response;
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
    [self resetHitTestCache];
}

- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state {
    [super setBackgroundImage:image forState:state];
    [self resetHitTestCache];
}

- (void)resetHitTestCache {
    self.previousTouchPoint = CGPointMake(CGFLOAT_MIN, CGFLOAT_MIN);
    self.previousTouchHitTestResponse = NO;
}

@end
