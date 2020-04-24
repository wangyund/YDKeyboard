//
//  YDDeviceTypes.m
//  YDKeyboard
//
//  Created by rowena on 2019/2/26.
//  Copyright © 2019年 wuyezhiguhun. All rights reserved.
//

#import "YDKeyboardDeviceTypes.h"
#import <UIKit/UIKit.h>

@implementation YDKeyboardDeviceTypes

/**
 * 判断是否带有刘海
 * @return 返回是否有刘海 YES：有  NO：没有
 */
+ (BOOL)isSafeAreaInsets {
    if (@available(iOS 11.0, *)) {
        if ([[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0) {
            return YES;
        }
        return NO;
    } else {
        return NO;
    }
}

@end
