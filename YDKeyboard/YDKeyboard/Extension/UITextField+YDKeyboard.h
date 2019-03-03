//
//  UITextField+YDKeyboard.h
//  YDKeyboard
//
//  Created by rowena on 2019/2/26.
//  Copyright © 2019年 wuyezhiguhun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YDKeyboardHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (YDKeyboard)

/**
 * 设置自定义键盘类型
 * @pram type 自定义键盘类型
 */
- (void)setYDKeyboardType:(YDKeyboardType)type;

@end

NS_ASSUME_NONNULL_END
