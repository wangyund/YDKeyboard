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
    YDiPhoneTypeiPhone            = 0 ,
    YDiPhoneTypeiPhone3G          = 1 ,
    YDiPhoneTypeiPhone3GS         = 2 ,
    YDiPhoneTypeiPhone4           = 3 ,
    YDiPhoneTypeiPhone4S          = 4 ,
    YDiPhoneTypeiPhone5           = 5 ,
    YDiPhoneTypeiPhone5C          = 6 ,
    YDiPhoneTypeiPhone5S          = 7 ,
    YDiPhoneTypeiPhone6           = 8 ,
    YDiPhoneTypeiPhone6Plus       = 9 ,
    YDiPhoneTypeiPhone6s          = 10 ,
    YDiPhoneTypeiPhone6sPlus      = 11 ,
    YDiPhoneTypeiPhoneSE          = 12 ,
    YDiPhoneTypeiPhone7           = 13 ,
    YDiPhoneTypeiPhone7Plus       = 14 ,
    YDiPhoneTypeiPhone8           = 15 ,
    YDiPhoneTypeiPhone8Plus       = 16 ,
    YDiPhoneTypeiPhoneX           = 17 ,
    YDiPhoneTypeiPhoneXR          = 18 ,
    YDiPhoneTypeiPhoneXS          = 19 ,
    YDiPhoneTypeiPhoneXSMax       = 20 ,
    /** 未知的新型iPhone设备 */
    YDiPhoneTypeiPhoneNew         = 1024 ,
};

@interface YDDeviceTypes : NSObject

/** 获取iPhone设备类型 */
+ (YDiPhoneType)getiPhoneType;

@end

NS_ASSUME_NONNULL_END
