//
//  KITextView.h
//  Kitalker
//
//  Created by 杨 烽 on 13-12-24.
//
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface KITextView : UITextView

@property (nonatomic, copy)   IBInspectable NSString  *placeholder;
@property (nonatomic, strong) IBInspectable UIColor   *placeholderColor;

@end
