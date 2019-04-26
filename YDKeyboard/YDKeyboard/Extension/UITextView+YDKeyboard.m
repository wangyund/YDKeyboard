//
//  UITextView+YDKeyboard.m
//  YDKeyboard
//
//  Created by rowena on 2019/2/26.
//  Copyright © 2019年 wuyezhiguhun. All rights reserved.
//

#import "UITextView+YDKeyboard.h"
#import "YDKeyboardView.h"

@interface UITextView()<YDKeyboardViewDelegate>

@end

@implementation UITextView (YDKeyboard)

/**
 * 设置自定义键盘类型
 * @pram type 自定义键盘类型
 */
- (void)yd_setKeyboardType:(YDKeyboardType)type {
    YDKeyboardView *keyboaardView = [[YDKeyboardView alloc] initWithType:type];
    keyboaardView.delegate = self;
    self.inputView = keyboaardView;
}

#pragma mark --- YDKeyboardViewDelegate ---
- (void)keyboardViewAddKey:(NSString *)key {
    
}
- (void)keyboardViewRemoveKey {
    
}
- (void)keyboardViewEndEditing {
    [self endEditing:YES];
}

@end
