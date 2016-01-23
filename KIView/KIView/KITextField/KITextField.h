//
//  KITextField.h
//  Kitalker
//
//  Created by 杨 烽 on 13-4-27.
//
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface KITextField : UITextField {
}

@property (nonatomic, assign) UIEdgeInsets  padding;

@property (nonatomic, assign) IBInspectable CGFloat paddingTop;
@property (nonatomic, assign) IBInspectable CGFloat paddingBottom;
@property (nonatomic, assign) IBInspectable CGFloat paddingLeft;
@property (nonatomic, assign) IBInspectable CGFloat paddingRight;

@end
