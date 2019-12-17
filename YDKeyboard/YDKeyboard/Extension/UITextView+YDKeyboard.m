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
 * @pram title 自定义软键盘标题
 */
- (void)yd_setKeyboardType:(YDKeyboardType)type title:(NSString *)title {
    YDKeyboardView *keyboaardView = [[YDKeyboardView alloc] initWithType:type title:title];
    keyboaardView.delegate = self;
    self.inputView = keyboaardView;
}

#pragma mark --- YDKeyboardViewDelegate ---
- (void)keyboardViewAddKey:(NSString *)key {
    self.text = [NSString stringWithFormat:@"%@%@",self.text,key];
    [[NSNotificationCenter defaultCenter] postNotificationName:UITextViewTextDidChangeNotification object:self];
}
- (void)keyboardViewRemoveKey {
    if ([self.text length] > 0) {
        self.text = [self.text substringToIndex:[self.text length] - 1];
        [[NSNotificationCenter defaultCenter] postNotificationName:UITextViewTextDidChangeNotification object:self];
    }
}
- (void)keyboardViewEndEditing {
    [self endEditing:YES];
}

@end
