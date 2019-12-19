//
//  YDSymbolKeyboardView.m
//  YDKeyboard
//
//  Created by rowena on 2019/2/26.
//  Copyright © 2019年 wuyezhiguhun. All rights reserved.
//

#import "YDSymbolKeyboardView.h"
#import "YDKeyboardHeader.h"
#import "UIImage+YDKeyboard.h"

#define YDSymbolKeyboardViewTag                1700


@interface YDSymbolKeyboardView()

@property (nonatomic, strong) NSMutableArray *buttonList;
@property (nonatomic, copy) NSArray *charList;

@end
@implementation YDSymbolKeyboardView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addAllViews];
    }
    return self;
}

- (void)buttonTouchDown:(UIButton *)button {
    NSInteger index = button.tag - YDSymbolKeyboardViewTag;
    switch (index) {
            //删除
            case 28:
            if (self.delegate && [self.delegate respondsToSelector:@selector(symbolKeyboardViewTouchDelete)]) {
                [self.delegate symbolKeyboardViewTouchDelete];
            }
            break;
            //切换到数字键盘
            case 29:
            if (self.delegate && [self.delegate respondsToSelector:@selector(symbolKeyboardViewTouchChangeNumber)]) {
                [self.delegate symbolKeyboardViewTouchChangeNumber];
            }
            break;
          
            //切换到字母键盘
            case 37:
            if (self.delegate && [self.delegate respondsToSelector:@selector(symbolKeyboardViewTouchChangeAlphabet)]) {
                [self.delegate symbolKeyboardViewTouchChangeAlphabet];
            }
            break;
            
        default:
            if (self.delegate && [self.delegate respondsToSelector:@selector(symbolKeyboardViewTouchKey:)]) {
                [self.delegate symbolKeyboardViewTouchKey:[kSymbolList objectAtIndex:index]];
            }
            break;
    }
    
}

- (void)buttonTouchUpInside:(UIButton *)button {
    
}


/** 添加所有的View */
- (void)addAllViews {
    
    for (NSInteger i = 0; i < [kSymbolList count]; i ++) {
        UIButton *button = [[UIButton alloc] initWithFrame:[self getButtonFrameIndex:i]];
        button.tag = YDSymbolKeyboardViewTag + i;
        [button setTitle:[kSymbolList objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonTouchDown:) forControlEvents:UIControlEventTouchDown];
        [button addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[UIImage yd_imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage yd_imageWithColor:[UIColor colorWithRed:170.0 / 255.0 green:178.0 / 255.0 blue:190.0 / 255.0 alpha:1.0]] forState:UIControlStateHighlighted];
        button.backgroundColor = [UIColor whiteColor];
        button.titleLabel.font = [UIFont systemFontOfSize:18];
        button.layer.cornerRadius = 2.0;
        button.layer.masksToBounds = YES;
        

        if (i == 28) {
            NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
            NSString *path = [currentBundle pathForResource:@"keyboard_delete_key" ofType:@"png" inDirectory:@"YDKeyboard.bundle"];
            [button setImage:[[UIImage imageWithContentsOfFile:path] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        }
        if (i == 28 || i == 29 || i == 37) {
            [button setBackgroundImage:[UIImage yd_imageWithColor:[UIColor colorWithRed:170.0 / 255.0 green:178.0 / 255.0 blue:190.0 / 255.0 alpha:1.0]] forState:UIControlStateNormal];
        }
        
        [self addSubview:button];
        [self.buttonList addObject:button];
    }
}
- (CGRect)getButtonFrameIndex:(NSInteger)index {
    CGFloat whidth = (self.bounds.size.width - 65) / 10.0;
    CGFloat height = (self.bounds.size.height - 50) / 4.0;
    CGRect rect = CGRectMake(0, 0, whidth, height);
    if (index < 20) {
        rect = CGRectMake((whidth + 5) * (index % 10) + 10,(height + 10) * floor((index / 10)) + 10, whidth, height);
    } else if (index < 28) {
        rect = CGRectMake((whidth + 5) * ((index - 20) % 9 + 0.5) + 10 , height * 2 + 30, whidth, height);
    } else if (index == 28) {
        rect = CGRectMake(self.bounds.size.width - 10 - whidth * 1.4 , height * 2 + 30, whidth * 1.4, height);
    } else if (index == 29) {
        rect = CGRectMake(10 , height * 3 + 40, whidth * 1.4, height);
    }  else if (index < 37) {
        rect = CGRectMake((whidth + 5) * ((index - 30) % 7 + 0.5 ) + 15 + whidth , height * 3 + 40, whidth, height);
    } else if (index == 37) {
        rect = CGRectMake(self.bounds.size.width - 10 - whidth * 1.4 , height * 3 + 40, whidth * 1.4, height);
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
@end
