//
//  YDDeviceTypes.m
//  YDKeyboard
//
//  Created by rowena on 2019/2/26.
//  Copyright © 2019年 wuyezhiguhun. All rights reserved.
//

#import "YDDeviceTypes.h"
#import "sys/utsname.h"

@implementation YDDeviceTypes

/** 获取iPhone设备类型 */
+ (YDiPhoneType)getiPhoneType {
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone1,1"]) {
        return YDiPhoneTypeiPhone;
    }
    
    if ([deviceString isEqualToString:@"iPhone1,2"]) {
        return YDiPhoneTypeiPhone3G;
    }
    
    if ([deviceString isEqualToString:@"iPhone2,1"]) {
        return YDiPhoneTypeiPhone3GS;
    }
    
    if ([deviceString isEqualToString:@"iPhone3,1"] || [deviceString isEqualToString:@"iPhone3,2"] || [deviceString isEqualToString:@"iPhone3,3"]) {
        return YDiPhoneTypeiPhone4;
    }
    
    if ([deviceString isEqualToString:@"iPhone4,1"]) {
        return YDiPhoneTypeiPhone4S;
    }
    
    if ([deviceString isEqualToString:@"iPhone5,1"] || [deviceString isEqualToString:@"iPhone5,2"]) {
        return YDiPhoneTypeiPhone5;
    }
    
    if ([deviceString isEqualToString:@"iPhone5,3"] || [deviceString isEqualToString:@"iPhone5,4"]) {
        return YDiPhoneTypeiPhone5C;
    }
    
    if ([deviceString isEqualToString:@"iPhone5,1"] || [deviceString isEqualToString:@"iPhone6,2"]) {
        return YDiPhoneTypeiPhone5S;
    }
    
    if ([deviceString isEqualToString:@"iPhone7,2"]) {
        return YDiPhoneTypeiPhone6;
    }
    
    if ([deviceString isEqualToString:@"iPhone7,1"]) {
        return YDiPhoneTypeiPhone6Plus;
    }
    
    if ([deviceString isEqualToString:@"iPhone8,1"]) {
        return YDiPhoneTypeiPhone6s;
    }
    
    if ([deviceString isEqualToString:@"iPhone8,2"]) {
        return YDiPhoneTypeiPhone6sPlus;
    }
    
    if ([deviceString isEqualToString:@"iPhone8,4"]) {
        return YDiPhoneTypeiPhoneSE;
    }
    
    if ([deviceString isEqualToString:@"iPhone9,1"] || [deviceString isEqualToString:@"iPhone9,3"]) {
        return YDiPhoneTypeiPhone7;
    }
    
    if ([deviceString isEqualToString:@"iPhone9,2"] || [deviceString isEqualToString:@"iPhone9,4"]) {
        return YDiPhoneTypeiPhone7Plus;
    }
    
    if ([deviceString isEqualToString:@"iPhone10,1"] || [deviceString isEqualToString:@"iPhone10,4"]) {
        return YDiPhoneTypeiPhone8;
    }
    
    if ([deviceString isEqualToString:@"iPhone10,2"] || [deviceString isEqualToString:@"iPhone10,5"]) {
        return YDiPhoneTypeiPhone8Plus;
    }
    
    if ([deviceString isEqualToString:@"iPhone10,3"] || [deviceString isEqualToString:@"iPhone10,6"]) {
        return YDiPhoneTypeiPhoneX;
    }
    
    if ([deviceString isEqualToString:@"iPhone11,8"]) {
        return YDiPhoneTypeiPhoneXR;
    }
    
    if ([deviceString isEqualToString:@"iPhone11,2"]) {
        return YDiPhoneTypeiPhoneXS;
    }
    
    if ([deviceString isEqualToString:@"iPhone11,6"] || [deviceString isEqualToString:@"iPhone11,4"]) {
        return YDiPhoneTypeiPhoneXSMax;
    }
    
    return YDiPhoneTypeiPhoneNew;
}

@end
