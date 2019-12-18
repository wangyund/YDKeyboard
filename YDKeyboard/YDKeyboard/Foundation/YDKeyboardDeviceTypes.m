//
//  YDDeviceTypes.m
//  YDKeyboard
//
//  Created by rowena on 2019/2/26.
//  Copyright © 2019年 wuyezhiguhun. All rights reserved.
//

#import "YDKeyboardDeviceTypes.h"
#import "sys/utsname.h"

@implementation YDKeyboardDeviceTypes

/** 获取iPhone设备类型 */
+ (YDiPhoneType)getiPhoneType {
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone1,1"]) {
        return YDKeyboardiPhoneTypeiPhone;
    }
    
    if ([deviceString isEqualToString:@"iPhone1,2"]) {
        return YDKeyboardiPhoneTypeiPhone3G;
    }
    
    if ([deviceString isEqualToString:@"iPhone2,1"]) {
        return YDKeyboardiPhoneTypeiPhone3GS;
    }
    
    if ([deviceString isEqualToString:@"iPhone3,1"] || [deviceString isEqualToString:@"iPhone3,2"] || [deviceString isEqualToString:@"iPhone3,3"]) {
        return YDKeyboardiPhoneTypeiPhone4;
    }
    
    if ([deviceString isEqualToString:@"iPhone4,1"]) {
        return YDKeyboardiPhoneTypeiPhone4S;
    }
    
    if ([deviceString isEqualToString:@"iPhone5,1"] || [deviceString isEqualToString:@"iPhone5,2"]) {
        return YDKeyboardiPhoneTypeiPhone5;
    }
    
    if ([deviceString isEqualToString:@"iPhone5,3"] || [deviceString isEqualToString:@"iPhone5,4"]) {
        return YDKeyboardiPhoneTypeiPhone5C;
    }
    
    if ([deviceString isEqualToString:@"iPhone5,1"] || [deviceString isEqualToString:@"iPhone6,2"]) {
        return YDKeyboardiPhoneTypeiPhone5S;
    }
    
    if ([deviceString isEqualToString:@"iPhone7,2"]) {
        return YDKeyboardiPhoneTypeiPhone6;
    }
    
    if ([deviceString isEqualToString:@"iPhone7,1"]) {
        return YDKeyboardiPhoneTypeiPhone6Plus;
    }
    
    if ([deviceString isEqualToString:@"iPhone8,1"]) {
        return YDKeyboardiPhoneTypeiPhone6s;
    }
    
    if ([deviceString isEqualToString:@"iPhone8,2"]) {
        return YDKeyboardiPhoneTypeiPhone6sPlus;
    }
    
    if ([deviceString isEqualToString:@"iPhone8,4"]) {
        return YDKeyboardiPhoneTypeiPhoneSE;
    }
    
    if ([deviceString isEqualToString:@"iPhone9,1"] || [deviceString isEqualToString:@"iPhone9,3"]) {
        return YDKeyboardiPhoneTypeiPhone7;
    }
    
    if ([deviceString isEqualToString:@"iPhone9,2"] || [deviceString isEqualToString:@"iPhone9,4"]) {
        return YDKeyboardiPhoneTypeiPhone7Plus;
    }
    
    if ([deviceString isEqualToString:@"iPhone10,1"] || [deviceString isEqualToString:@"iPhone10,4"]) {
        return YDKeyboardiPhoneTypeiPhone8;
    }
    
    if ([deviceString isEqualToString:@"iPhone10,2"] || [deviceString isEqualToString:@"iPhone10,5"]) {
        return YDKeyboardiPhoneTypeiPhone8Plus;
    }
    
    if ([deviceString isEqualToString:@"iPhone10,3"] || [deviceString isEqualToString:@"iPhone10,6"]) {
        return YDKeyboardiPhoneTypeiPhoneX;
    }
    
    if ([deviceString isEqualToString:@"iPhone11,8"]) {
        return YDKeyboardiPhoneTypeiPhoneXR;
    }
    
    if ([deviceString isEqualToString:@"iPhone11,2"]) {
        return YDKeyboardiPhoneTypeiPhoneXS;
    }
    
    if ([deviceString isEqualToString:@"iPhone11,6"] || [deviceString isEqualToString:@"iPhone11,4"]) {
        return YDKeyboardiPhoneTypeiPhoneXSMax;
    }
    
    return YDKeyboardiPhoneTypeiPhoneNew;
}

@end
