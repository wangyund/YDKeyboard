//
//  YDNumberKeyboardView.h
//  YDKeyboard
//
//  Created by rowena on 2019/2/26.
//  Copyright © 2019年 wuyezhiguhun. All rights reserved.
//
/** 数字键盘 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YDNumberKeyboardViewDelegate <NSObject>

@optional
- (void)numberKeyboardViewTouchKey:(NSString *)key;
- (void)numberKeyboardViewTouchChange;
- (void)numberKeyboardViewTouchDelete;
@end

@interface YDNumberKeyboardView : UIView
@property (nonatomic, weak) id<YDNumberKeyboardViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
