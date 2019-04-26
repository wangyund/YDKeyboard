//
//  UITextField+YDKeyboard.m
//  YDKeyboard
//
//  Created by rowena on 2019/2/26.
//  Copyright © 2019年 wuyezhiguhun. All rights reserved.
//

#import "UITextField+YDKeyboard.h"
#import "YDKeyboardView.h"

@interface UITextField()<YDKeyboardViewDelegate>

@end

@implementation UITextField (YDKeyboard)


/**
 * 设置自定义键盘类型
 * @pram type 自定义键盘类型
 */
- (void)yd_setKeyboardType:(YDKeyboardType)type {
    YDKeyboardView *keyboaardView = [[YDKeyboardView alloc] initWithType:type];
    keyboaardView.delegate = self;
    self.inputView = keyboaardView;
}

#pragma === YDKeyboardViewDelegate ===
- (void)keyboardViewAddKey:(NSString *)key {
    self.text = [NSString stringWithFormat:@"%@%@",self.text,key];
    [[NSNotificationCenter defaultCenter] postNotificationName:UITextFieldTextDidChangeNotification object:self];
}
- (void)keyboardViewRemoveKey {
    if ([self.text length] > 0) {
        self.text = [self.text substringToIndex:[self.text length] - 1];
        [[NSNotificationCenter defaultCenter] postNotificationName:UITextFieldTextDidChangeNotification object:self];
    }
}
- (void)keyboardViewEndEditing {
    [self endEditing:YES];
}

@end
