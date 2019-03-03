//
//  YDKeyboardView.h
//  YDKeyboard
//
//  Created by rowena on 2019/2/26.
//  Copyright © 2019年 wuyezhiguhun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YDKeyboardHeader.h"

NS_ASSUME_NONNULL_BEGIN


@protocol YDKeyboardViewDelegate <NSObject>

@optional
- (void)keyboardViewAddKey:(NSString *)key;
- (void)keyboardViewRemoveKey;
- (void)keyboardViewEndEditing;

@end

@interface YDKeyboardView : UIView
@property (nonatomic, weak) id<YDKeyboardViewDelegate> delegate;
/**
 * 初始化键盘
 * @pram type 初始化键盘类型
 */
- (instancetype)initWithType:(YDKeyboardType)type;

@end

NS_ASSUME_NONNULL_END
