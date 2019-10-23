//
//  RatioView.m
//  FanYing
//
//  Created by 袁玉灵 on 2018/8/26.
//  Copyright © 2018年 袁玉灵. All rights reserved.
//

#import "RatioView.h"
@interface RatioView()
/**<#注释#> */
@property (nonatomic,strong) NSArray *arr;
@end

@implementation RatioView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame: frame];
    if (self) {
        _arr = @[@"full",@"3:4",@"1:1",@"圆"];
        self.full = [self createButtonWithTitle:_arr[0]];
        self.chang = [self createButtonWithTitle:_arr[1]];
        self.fang = [self createButtonWithTitle:_arr[2]];
        self.yuan = [self createButtonWithTitle:_arr[3]];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
    
    CGFloat space = 10;
    CGFloat width = 60;
    CGFloat height = 40;
    self.full.frame = CGRectMake(space, space, width, height);
    self.chang.frame = CGRectMake(CGRectGetMaxX(self.full.frame)+space, space, width, height);
    self.fang.frame = CGRectMake(CGRectGetMaxX(self.chang.frame)+space, space, width, height);
    self.yuan.frame = CGRectMake(CGRectGetMaxX(self.fang.frame)+space, space, width, height);
}
-(UIButton *)createButtonWithTitle:(NSString *)title{
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    //[button setBackgroundColor:[UIColor greenColor]];
    [button setTintColor:[UIColor whiteColor]];
    [self addSubview:button];
    return button;
}
@end
