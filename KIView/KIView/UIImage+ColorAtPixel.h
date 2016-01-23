//
//  UIImage+ColorAtPixel.h
//  KIView
//
//  Created by apple on 16/1/23.
//  Copyright © 2016年 smartwalle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ColorAtPixel)

- (UIColor *)cp_colorAtPixel:(CGPoint)point;

@end
