//
//  YDKeyboardView.m
//  YDKeyboard
//
//  Created by rowena on 2019/2/26.
//  Copyright © 2019年 wuyezhiguhun. All rights reserved.
//

#import "YDKeyboardView.h"
#import "YDKeyboardDeviceTypes.h"
#import "YDNumberKeyboardView.h"
#import "YDAlphabetKeyboardView.h"
#import "YDSymbolKeyboardView.h"

@interface YDKeyboardView()<YDNumberKeyboardViewDelegate, YDAlphabetKeyboardViewDelegate, YDSymbolKeyboardViewDelegate>

@property (nonatomic, strong) YDNumberKeyboardView *numnerKeyboardView;
@property (nonatomic, strong) YDAlphabetKeyboardView *alphabetKeyboardView;
@property (nonatomic, strong) YDSymbolKeyboardView *symbolKeyboardView;

@property (nonatomic, strong) UILabel *keyboardLabel;
@property (nonatomic, strong) UIButton *finishButton;
@property (nonatomic, strong) UIView *keyboardView;
@end

@implementation YDKeyboardView

/**
 * 初始化键盘
 * @pram type 初始化键盘类型
 * @pram title 键盘标题
 */
- (instancetype)initWithType:(YDKeyboardType)type title:(NSString *)title {
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    CGRect frame;
    if(UIDeviceOrientationIsLandscape(orientation)){
        frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 162);
    } else {
        if ([YDKeyboardDeviceTypes getiPhoneType] > 16) {
            frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 299);
        } else {
            frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 255);
        }
    }
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:208.0 / 255.0 green:213.0 / 255.0 blue:219.0 / 255.0 alpha:1.0];
        [self addSubview:self.keyboardLabel];
        [self addSubview:self.finishButton];
        [self addSubview:self.keyboardView];
        [self addSubview:self.numnerKeyboardView];
        [self addSubview:self.symbolKeyboardView];
        [self addSubview:self.alphabetKeyboardView];
        switch (type) {
                //数字键盘
            case YDKeyboardTypeNumber:
                [self setAllViewsHidden:0b1110];
                break;
                //字母键盘
            case YDKeyboardTypeAlphabet:
                [self setAllViewsHidden:0b1101];
                break;
                //符号键盘
            case YDKeyboardTypeSymbol:
                [self setAllViewsHidden:0b1011];
                break;
                
            default:
                break;
        }
    }
    self.keyboardLabel.text = title;
    
    return self;
}

- (void)finishButtonTouch {
    if (self.delegate && [self.delegate respondsToSelector:@selector(keyboardViewEndEditing)]) {
        [self.delegate keyboardViewEndEditing];
    }
}

#pragma mark === YDNumberKeyboardViewDelegate ===
- (void)numberKeyboardViewTouchKey:(NSString *)key {
    if (self.delegate && [self.delegate respondsToSelector:@selector(keyboardViewAddKey:)]) {
        [self.delegate keyboardViewAddKey:key];
    }
}
- (void)numberKeyboardViewTouchChange {
    [self setAllViewsHidden:0b1101];
}
- (void)numberKeyboardViewTouchDelete {
    if (self.delegate && [self.delegate respondsToSelector:@selector(keyboardViewRemoveKey)]) {
        [self.delegate keyboardViewRemoveKey];
    }
}

#pragma mark === YDAlphabetKeyboardViewDelegate ===
- (void)alphabetKeyboardViewTouchKey:(NSString *)key {
    if (self.delegate && [self.delegate respondsToSelector:@selector(keyboardViewAddKey:)]) {
        [self.delegate keyboardViewAddKey:key];
    }
}
- (void)alphabetKeyboardViewTouchChangeNumber {
    [self setAllViewsHidden:0b1110];
}
- (void)alphabetKeyboardViewTouchChangeSymbol {
    [self setAllViewsHidden:0b1011];
}
- (void)alphabetKeyboardViewTouchDelete {
    if (self.delegate && [self.delegate respondsToSelector:@selector(keyboardViewRemoveKey)]) {
        [self.delegate keyboardViewRemoveKey];
    }
}

#pragma mark === YDSymbolKeyboardViewDelegate ===
- (void)symbolKeyboardViewTouchKey:(NSString *)key {
    if (self.delegate && [self.delegate respondsToSelector:@selector(keyboardViewAddKey:)]) {
        [self.delegate keyboardViewAddKey:key];
    }
}
- (void)symbolKeyboardViewTouchChangeNumber {
    [self setAllViewsHidden:0b1110];
}
- (void)symbolKeyboardViewTouchChangeAlphabet {
    [self setAllViewsHidden:0b1101];
}
- (void)symbolKeyboardViewTouchDelete {
    if (self.delegate && [self.delegate respondsToSelector:@selector(keyboardViewRemoveKey)]) {
        [self.delegate keyboardViewRemoveKey];
    }
}

- (void)setAllViewsHidden:(NSInteger)hidden {
    self.numnerKeyboardView.hidden = hidden & 0b0001;
    self.alphabetKeyboardView.hidden = hidden & 0b0010;
    self.symbolKeyboardView.hidden = hidden & 0b0100;
}

- (CGRect)getKeyboardViewFrame {
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    if(UIDeviceOrientationIsLandscape(orientation)){
        return CGRectMake(0, 40, self.frame.size.width, 122);
    } else {
        return CGRectMake(0, 40, self.frame.size.width, 215);
    }
}
- (YDNumberKeyboardView *)numnerKeyboardView {
    if (!_numnerKeyboardView) {
        _numnerKeyboardView = [[YDNumberKeyboardView alloc] initWithFrame:[self getKeyboardViewFrame]];
        _numnerKeyboardView.delegate = self;
    }
    return _numnerKeyboardView;
}
- (YDAlphabetKeyboardView *)alphabetKeyboardView {
    if (!_alphabetKeyboardView) {
        _alphabetKeyboardView = [[YDAlphabetKeyboardView alloc] initWithFrame:[self getKeyboardViewFrame]];
        _alphabetKeyboardView.delegate = self;
    }
    return _alphabetKeyboardView;
}
- (YDSymbolKeyboardView *)symbolKeyboardView {
    if (!_symbolKeyboardView) {
        _symbolKeyboardView = [[YDSymbolKeyboardView alloc] initWithFrame:[self getKeyboardViewFrame]];
        _symbolKeyboardView.delegate = self;
    }
    return _symbolKeyboardView;
}

- (UILabel *)keyboardLabel {
    if (!_keyboardLabel) {
        _keyboardLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, self.bounds.size.width - 150, 39)];
        _keyboardLabel.backgroundColor = [UIColor clearColor];
        _keyboardLabel.textColor = [UIColor darkGrayColor];
        _keyboardLabel.text = @"允顶安全键盘";
        _keyboardLabel.font = [UIFont systemFontOfSize:15];
        _keyboardLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _keyboardLabel;
}
- (UIButton *)finishButton {
    if (!_finishButton) {
        _finishButton = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width - 65, 0, 50, 39)];
        _finishButton.backgroundColor = [UIColor clearColor];
        [_finishButton setTitle:@"完成" forState:UIControlStateNormal];
        [_finishButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        _finishButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _finishButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_finishButton addTarget:self action:@selector(finishButtonTouch) forControlEvents:UIControlEventTouchUpInside];
    }
    return _finishButton;
}
- (UIView *)keyboardView {
    if (!_keyboardView) {
        _keyboardView = [[UIView alloc] initWithFrame:CGRectMake(0, 39, self.bounds.size.width, 0.5)];
        _keyboardView.backgroundColor = [UIColor lightTextColor];
    }
    return _keyboardView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
