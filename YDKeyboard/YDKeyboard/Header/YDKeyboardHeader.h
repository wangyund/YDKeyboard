//
//  YDKeyboardHeader.h
//  YDKeyboard
//
//  Created by rowena on 2019/2/26.
//  Copyright © 2019年 wuyezhiguhun. All rights reserved.
//

#ifndef YDKeyboardHeader_h
#define YDKeyboardHeader_h

/** 自定义键盘类型 */
typedef NS_ENUM(NSInteger, YDKeyboardType) {
    /** 数字键盘 */
    YDKeyboardTypeNumber     = 1 ,
    /** 字母键盘 */
    YDKeyboardTypeAlphabet   = 2 ,
    /** 符号键盘 */
    YDKeyboardTypeSymbol     = 3 ,
};

#define kNumberList  @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"ABC", @"0", @""]
#define kCharLowList @[ @"q", @"w", @"e", @"r", @"t", @"y", @"u", @"i", @"o", @"p", @"a", @"s", @"d", @"f", @"g", @"h", @"j", @"k", @"l", @"", @"z", @"x", @"c", @"v", @"b", @"n", @"m", @"", @"123", @"空格", @"#+="]
#define kCharCapitalList  @[ @"Q", @"W", @"E", @"R", @"T", @"Y", @"U", @"I", @"O", @"P", @"A", @"S", @"D", @"F", @"G", @"H", @"J", @"K", @"L", @"", @"Z", @"X", @"C", @"V", @"B", @"N", @"M", @"", @"123", @"空格", @"#+="]

#define kSymbolList  @[ @"!", @"@", @"#", @"$", @"%", @"^", @"&", @"*", @"(", @")", @"'", @"\"", @"=", @"_", @":", @";", @"?", @"~", @"|", @"·", @"+", @"-", @"\\", @"/", @"[", @"]", @"{", @"}",@"", @"123", @",", @".", @"<", @">", @"€", @"£", @"¥", @"ABC"]


#endif /* YDKeyboardHeader_h */
