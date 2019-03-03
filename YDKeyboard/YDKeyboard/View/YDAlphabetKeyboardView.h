//
//  YDAlphabetKeyboardView.h
//  YDKeyboard
//
//  Created by rowena on 2019/2/26.
//  Copyright © 2019年 wuyezhiguhun. All rights reserved.
//
/** 字符键盘 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YDAlphabetKeyboardViewDelegate <NSObject>

@optional
- (void)alphabetKeyboardViewTouchKey:(NSString *)key;
- (void)alphabetKeyboardViewTouchChangeNumber;
- (void)alphabetKeyboardViewTouchChangeSymbol;
- (void)alphabetKeyboardViewTouchDelete;

@end

@interface YDAlphabetKeyboardView : UIView
@property (nonatomic, weak) id<YDAlphabetKeyboardViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
