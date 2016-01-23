//
//  KITextField.m
//  Kitalker
//
//  Created by 杨 烽 on 13-4-27.
//
//

#import "KITextField.h"

@implementation KITextField

- (void)setPadding:(UIEdgeInsets)padding {
    _paddingTop = padding.top;
    _paddingBottom = padding.bottom;
    _paddingLeft = padding.left;
    _paddingRight = padding.right;
    [self setNeedsLayout];
}

- (UIEdgeInsets)padding  {
    return UIEdgeInsetsMake(_paddingTop, _paddingLeft, _paddingLeft, _paddingRight);
}

- (void)setPaddingTop:(CGFloat)paddingTop {
    _paddingTop = paddingTop;
    [self setNeedsLayout];
}

- (void)setPaddingBottom:(CGFloat)paddingBottom {
    _paddingBottom = paddingBottom;
    [self setNeedsLayout];
}

- (void)setPaddingLeft:(CGFloat)paddingLeft {
    _paddingLeft = paddingLeft;
    [self setNeedsLayout];
}

- (void)setPaddingRight:(CGFloat)paddingRight {
    _paddingRight = paddingRight;
    [self setNeedsLayout];
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    CGRect leftRect = [self leftViewRectForBounds:bounds];
    CGRect rightRect = [self rightViewRectForBounds:bounds];
    CGRect clearRect = [self clearButtonRectForBounds:bounds];
    
    CGFloat clearWidth = self.clearButtonMode==UITextFieldViewModeNever?0:CGRectGetWidth(clearRect);
    
    if (self.isFirstResponder) {
        clearWidth = self.clearButtonMode==UITextFieldViewModeUnlessEditing?0:CGRectGetWidth(clearRect);
    }
    
    return CGRectMake(self.paddingLeft+leftRect.size.width,
                      self.paddingTop,
                      bounds.size.width-self.paddingLeft-self.paddingRight-rightRect.size.width-clearWidth,
                      bounds.size.height-self.paddingTop-self.paddingBottom);
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    CGRect leftRect = [self leftViewRectForBounds:bounds];
    CGRect rightRect = [self rightViewRectForBounds:bounds];
    
    return CGRectMake(self.paddingLeft+leftRect.size.width,
                      self.paddingTop,
                      bounds.size.width-self.paddingLeft-self.paddingRight-rightRect.size.width,
                      bounds.size.height-self.paddingTop-self.paddingBottom);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}

@end
