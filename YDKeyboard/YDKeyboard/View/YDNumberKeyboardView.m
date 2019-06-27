//
//  YDNumberKeyboardView.m
//  YDKeyboard
//
//  Created by rowena on 2019/2/26.
//  Copyright © 2019年 wuyezhiguhun. All rights reserved.
//

#import "YDNumberKeyboardView.h"
#import "YDKeyboardHeader.h"
#import "UIImage+YDKeyboard.h"
#import "YDNumberKeyboardViewModel.h"

#define YDNumberKeyboardViewTag                1900

@interface YDNumberKeyboardView()

@property (nonatomic, strong) NSMutableArray *buttonList;
@property (nonatomic, strong) YDNumberKeyboardViewModel *viewModel;

@end

@implementation YDNumberKeyboardView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addAllViews];
    }
    return self;
}

- (void)buttonTouchDown:(UIButton *)button {
    NSInteger index = button.tag - YDNumberKeyboardViewTag;
    if (index == 9) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(numberKeyboardViewTouchChange)]) {
            [self.delegate numberKeyboardViewTouchChange];
        }
    } else if (index == 11) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(numberKeyboardViewTouchDelete)]) {
            [self.delegate numberKeyboardViewTouchDelete];
        }
    } else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(numberKeyboardViewTouchKey:)]) {
            [self.delegate numberKeyboardViewTouchKey:[kNumberList objectAtIndex:index]];
        }
    }
}

- (void)buttonTouchUpInside:(UIButton *)button {
    
}


/** 添加所有的View */
- (void)addAllViews {
    CGFloat whidth = (self.bounds.size.width - 30) / 3.0;
    CGFloat height = (self.bounds.size.height - 50) / 4.0;
    for (NSInteger i = 0; i < [kNumberList count]; i ++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((whidth + 5) * (i % 3) + 10, (height + 10) * floor((i / 3)) + 10, whidth, height)];
        button.tag = YDNumberKeyboardViewTag + i;
        [button setTitle:[kNumberList objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonTouchDown:) forControlEvents:UIControlEventTouchDown];
        [button addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[UIImage yd_imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage yd_imageWithColor:[UIColor colorWithRed:170.0 / 255.0 green:178.0 / 255.0 blue:190.0 / 255.0 alpha:1.0]] forState:UIControlStateHighlighted];
        button.backgroundColor = [UIColor whiteColor];
        button.titleLabel.font = [UIFont systemFontOfSize:20];
        button.layer.cornerRadius = 2.0;
        button.layer.masksToBounds = YES;
        
        if (i == [kNumberList count] - 1) {
            [button setImage:[[UIImage imageWithContentsOfFile:[[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"YDKeyboard" ofType:@"bundle"]] pathForResource:@"keyboard_num_delete_key" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
//            [button setImage:[[UIImage imageNamed:@"keyboard_num_delete_key"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        }
        if (i == 9 || i == 11) {
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage yd_imageWithColor:[UIColor colorWithRed:170.0 / 255.0 green:178.0 / 255.0 blue:190.0 / 255.0 alpha:1.0]] forState:UIControlStateNormal];
        }
        
        [self addSubview:button];
        [self.buttonList addObject:button];
    }
}


#pragma mark === get 函数 ===
- (NSMutableArray *)buttonList {
    if (!_buttonList) {
        _buttonList = [NSMutableArray array];
    }
    return _buttonList;
}


@end
