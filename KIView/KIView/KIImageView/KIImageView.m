//
//  KIImageView.m
//  Kitalker
//
//  Created by 杨 烽 on 13-12-24.
//
//

#import "KIImageView.h"
#import "UIImage+KIAdditions.h"

#define kAlphaVisibleThreshold (0.1f)

@interface KIImageView ()
@property (nonatomic, assign) CGPoint   previousTouchPoint;
@property (nonatomic, assign) BOOL      previousTouchHitTestResponse;
@end

@implementation KIImageView

- (id)init {
    if (self = [super init]) {
        [self resetHitTestCache];
    }
    return self;
}

- (id)initWithImage:(UIImage *)image {
    if (self = [super initWithImage:image]) {
        [self resetHitTestCache];
    }
    return self;
}

- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage {
    if (self = [super initWithImage:image highlightedImage:highlightedImage]) {
        [self resetHitTestCache];
    }
    return self;
}

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
    if (!superResult) {
        return superResult;
    }
    
    if (!self.irregularly) {
        return superResult;
    }
    
    if (CGPointEqualToPoint(point, self.previousTouchPoint)) {
        return self.previousTouchHitTestResponse;
    } else {
        self.previousTouchPoint = point;
    }
    
    UIImage *buttonImage = [self image];
    
    BOOL response = NO;
    
    if (buttonImage == nil) {
        response = YES;
    } else if (buttonImage != nil) {
        response = [self isAlphaVisibleAtPoint:point forImage:buttonImage];
    } else {
        if ([self isAlphaVisibleAtPoint:point forImage:buttonImage]) {
            response = YES;
        }
    }
    
    self.previousTouchHitTestResponse = response;
    return response;
}

- (void)setImage:(UIImage *)image {
    [super setImage:image];
    [self resetHitTestCache];
}

- (void)resetHitTestCache {
    self.previousTouchPoint = CGPointMake(CGFLOAT_MIN, CGFLOAT_MIN);
    self.previousTouchHitTestResponse = NO;
}

@end
