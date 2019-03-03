//
//  YDSymbolKeyboardView.h
//  YDKeyboard
//
//  Created by rowena on 2019/2/26.
//  Copyright © 2019年 wuyezhiguhun. All rights reserved.
//
/** 符号键盘 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YDSymbolKeyboardViewDelegate <NSObject>

@optional
- (void)symbolKeyboardViewTouchKey:(NSString *)key;
- (void)symbolKeyboardViewTouchChangeNumber;
- (void)symbolKeyboardViewTouchChangeAlphabet;
- (void)symbolKeyboardViewTouchDelete;

@end

@interface YDSymbolKeyboardView : UIView
@property (nonatomic, weak) id<YDSymbolKeyboardViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
