//
//  ViewController.m
//  YDKeyboard
//
//  Created by rowena on 2019/2/26.
//  Copyright © 2019年 wuyezhiguhun. All rights reserved.
//

#import "ViewController.h"
#import "YDKeyboard.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.textField yd_setKeyboardType:YDKeyboardTypeNumber title:@"APP安全键盘"];
    [self.textView yd_setKeyboardType:YDKeyboardTypeAlphabet title:@"允顶安全键盘"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


@end
