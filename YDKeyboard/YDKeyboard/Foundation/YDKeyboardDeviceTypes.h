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

typedef NS_ENUM(NSInteger, YDiPhoneType) {
    /** 苹果手机 一代 */
    YDKeyboardiPhoneTypeiPhone            = 0 ,
    YDKeyboardiPhoneTypeiPhone3G          = 1 ,
    YDKeyboardiPhoneTypeiPhone3GS         = 2 ,
    YDKeyboardiPhoneTypeiPhone4           = 3 ,
    YDKeyboardiPhoneTypeiPhone4S          = 4 ,
    YDKeyboardiPhoneTypeiPhone5           = 5 ,
    YDKeyboardiPhoneTypeiPhone5C          = 6 ,
    YDKeyboardiPhoneTypeiPhone5S          = 7 ,
    YDKeyboardiPhoneTypeiPhone6           = 8 ,
    YDKeyboardiPhoneTypeiPhone6Plus       = 9 ,
    YDKeyboardiPhoneTypeiPhone6s          = 10 ,
    YDKeyboardiPhoneTypeiPhone6sPlus      = 11 ,
    YDKeyboardiPhoneTypeiPhoneSE          = 12 ,
    YDKeyboardiPhoneTypeiPhone7           = 13 ,
    YDKeyboardiPhoneTypeiPhone7Plus       = 14 ,
    YDKeyboardiPhoneTypeiPhone8           = 15 ,
    YDKeyboardiPhoneTypeiPhone8Plus       = 16 ,
    YDKeyboardiPhoneTypeiPhoneX           = 17 ,
    YDKeyboardiPhoneTypeiPhoneXR          = 18 ,
    YDKeyboardiPhoneTypeiPhoneXS          = 19 ,
    YDKeyboardiPhoneTypeiPhoneXSMax       = 20 ,
    /** 未知的新型iPhone设备 */
    YDKeyboardiPhoneTypeiPhoneNew         = 1024 ,
};

@interface YDKeyboardDeviceTypes : NSObject

/** 获取iPhone设备类型 */
+ (YDiPhoneType)getiPhoneType;

@end

NS_ASSUME_NONNULL_END
