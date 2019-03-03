//
//  UIImage+YDKeyboard.h
//  YDKeyboard
//
//  Created by rowena on 2019/2/28.
//  Copyright © 2019年 wuyezhiguhun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YDKeyboard)

/**
 * 颜色转图片
 * @pram color 待转换颜色
 * @return 返回转换后的图片
 */
+ (UIImage *)yd_imageWithColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
