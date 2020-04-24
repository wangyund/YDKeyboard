//
//  YDDeviceTypes.h
//  YDKeyboard
//
//  Created by rowena on 2019/2/26.
//  Copyright © 2019年 wuyezhiguhun. All rights reserved.
//
/** 获取设备类型 */

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN


@interface YDKeyboardDeviceTypes : NSObject

/**
 * 判断是否带有刘海
 * @return 返回是否有刘海 YES：有  NO：没有
 */
+ (BOOL)isSafeAreaInsets;

@end

NS_ASSUME_NONNULL_END
