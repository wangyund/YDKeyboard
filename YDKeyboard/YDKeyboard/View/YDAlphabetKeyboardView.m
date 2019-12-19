//
//  YDAlphabetKeyboardView.m
//  YDKeyboard
//
//  Created by rowena on 2019/2/26.
//  Copyright © 2019年 wuyezhiguhun. All rights reserved.
//

#import "YDAlphabetKeyboardView.h"
#import "YDKeyboardHeader.h"
#import "UIImage+YDKeyboard.h"

#define YDAlphabetKeyboardViewTag                1800


@interface YDAlphabetKeyboardView()

@property (nonatomic, strong) NSMutableArray *buttonList;
@property (nonatomic, copy) NSArray *charList;
/** 字母大小写标记 */
@property (nonatomic, assign) BOOL keyboardLowTag;

@end

@implementation YDAlphabetKeyboardView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.keyboardLowTag = NO;
        self.backgroundColor = [UIColor clearColor];
        [self addAllViews];
    }
    return self;
}


- (void)buttonTouchDown:(UIButton *)button {
    NSInteger index = button.tag - YDAlphabetKeyboardViewTag;
    switch (index) {
            //大小写切换
            case 19:
            [self alphabetKeyboardViewChangeChar:self.keyboardLowTag];
            self.keyboardLowTag = !self.keyboardLowTag;
            break;
            //删除
            case 27:
            if (self.delegate && [self.delegate respondsToSelector:@selector(alphabetKeyboardViewTouchDelete)]) {
                [self.delegate alphabetKeyboardViewTouchDelete];
            }
            break;
            //切换到数字键盘
            case 28:
            if (self.keyboardLowTag) {
                [self alphabetKeyboardViewChangeChar:self.keyboardLowTag];
                self.keyboardLowTag = NO;
            }
            if (self.delegate && [self.delegate respondsToSelector:@selector(alphabetKeyboardViewTouchChangeNumber)]) {
                [self.delegate alphabetKeyboardViewTouchChangeNumber];
            }
            break;
            //空格输入键
            case 29:
            if (self.keyboardLowTag) {
                [self alphabetKeyboardViewChangeChar:self.keyboardLowTag];
                self.keyboardLowTag = NO;
            }
            if (self.delegate && [self.delegate respondsToSelector:@selector(alphabetKeyboardViewTouchKey:)]) {
                [self.delegate alphabetKeyboardViewTouchKey:@" "];
            }
            break;
            //切换到字符键盘
            case 30:
            if (self.keyboardLowTag) {
                [self alphabetKeyboardViewChangeChar:self.keyboardLowTag];
                self.keyboardLowTag = NO;
            }
            if (self.delegate && [self.delegate respondsToSelector:@selector(alphabetKeyboardViewTouchChangeSymbol)]) {
                [self.delegate alphabetKeyboardViewTouchChangeSymbol];
            }
            break;
            
        default:
            if (self.delegate && [self.delegate respondsToSelector:@selector(alphabetKeyboardViewTouchKey:)]) {
                [self.delegate alphabetKeyboardViewTouchKey:[self.charList objectAtIndex:index]];
            }
            if (self.keyboardLowTag) {
                [self alphabetKeyboardViewChangeChar:self.keyboardLowTag];
                self.keyboardLowTag = NO;
            }
            
            break;
    }
    
}

- (void)buttonTouchUpInside:(UIButton *)button {
    
}

/** 切换字符大小写 */
- (void)alphabetKeyboardViewChangeChar:(BOOL)change {
    //小写
    if (change) {
        self.charList = kCharLowList;
    } else { //大写
        self.charList = kCharCapitalList;
    }
    for (UIButton *button in self.buttonList) {
        [button setTitle:[self.charList objectAtIndex:button.tag - YDAlphabetKeyboardViewTag] forState:UIControlStateNormal];
    }
}

/** 添加所有的View */
- (void)addAllViews {
    
    for (NSInteger i = 0; i < [kCharLowList count]; i ++) {
        UIButton *button = [[UIButton alloc] initWithFrame:[self getButtonFrameIndex:i]];
        button.tag = YDAlphabetKeyboardViewTag + i;
        [button setTitle:[kCharLowList objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonTouchDown:) forControlEvents:UIControlEventTouchDown];
        [button addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[UIImage yd_imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage yd_imageWithColor:[UIColor colorWithRed:170.0 / 255.0 green:178.0 / 255.0 blue:190.0 / 255.0 alpha:1.0]] forState:UIControlStateHighlighted];
        button.backgroundColor = [UIColor whiteColor];
        button.titleLabel.font = [UIFont systemFontOfSize:20];
        button.layer.cornerRadius = 2.0;
        button.layer.masksToBounds = YES;
        
        if (i == 19) {
            NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
            NSString *path = [currentBundle pathForResource:@"keyboard_shift_key" ofType:@"png" inDirectory:@"YDKeyboard.bundle"];
            [button setImage:[[UIImage imageWithContentsOfFile:path] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        }
        if (i == 27) {
            NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
            NSString *path = [currentBundle pathForResource:@"keyboard_delete_key" ofType:@"png" inDirectory:@"YDKeyboard.bundle"];
            [button setImage:[[UIImage imageWithContentsOfFile:path] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        }
        if (i == 19 || i == 27 || i == 28 || i == 30) {
            [button setBackgroundImage:[UIImage yd_imageWithColor:[UIColor colorWithRed:170.0 / 255.0 green:178.0 / 255.0 blue:190.0 / 255.0 alpha:1.0]] forState:UIControlStateNormal];
        }
        
        [self addSubview:button];
        [self.buttonList addObject:button];
    }
}
- (CGRect)getButtonFrameIndex:(NSInteger)index {
    CGFloat whidth = (self.bounds.size.width - 65) / 10.0;
    CGFloat height = (self.bounds.size.height - 50) / 4.0;
    CGFloat w = (self.bounds.size.width - 30 - whidth * 5) / 2.0;
    CGRect rect = CGRectMake(0, 0, whidth, height);
    if (index < 10) {
        rect = CGRectMake((whidth + 5) * (index % 10) + 10, 10, whidth, height);
    } else if (index < 19) {
        rect = CGRectMake((whidth + 5) * ((index - 10) % 9 + 0.5) + 10 , height + 20, whidth, height);
    } else if (index == 19) {
        rect = CGRectMake(10 , height * 2 + 30, whidth * 1.4, height);
    } else if (index < 27) {
        rect = CGRectMake((whidth + 5) * ((index - 20) % 7 + 0.5 ) + 15 + whidth , height * 2 + 30, whidth, height);
    } else if (index == 27) {
        rect = CGRectMake(self.bounds.size.width - 10 - whidth * 1.4 , height * 2 + 30, whidth * 1.4, height);
    } else if (index == 28) {
        rect = CGRectMake(10 , height * 3 + 40, w, height);
    }  else if (index == 29) {
        rect = CGRectMake(15 + w , height * 3 + 40, whidth * 5, height);
    } else if (index == 30) {
        rect = CGRectMake(20 + w + whidth * 5 , height * 3 + 40, w, height);
    }
    return rect;
}

#pragma mark === get 函数 ===
- (NSMutableArray *)buttonList {
    if (!_buttonList) {
        _buttonList = [NSMutableArray array];
    }
    return _buttonList;
}
- (NSArray *)charList {
    if (!_charList) {
        _charList = kCharLowList;
    }
    return _charList;
}

@end
