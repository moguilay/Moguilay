//
//  ReButton.m
//  有钱
//
//  Created by Moguilay on 14-3-6.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "ReButton.h"

@implementation ReButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        registerButton.frame = CGRectMake(20, 450 - 90, 280, 80);
//        //        registerButton.backgroundColor = [UIColor blueColor];
//        //        [registerButton setTitle:@"注册新用户" forState:UIControlStateNormal];
//        [registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [registerButton addTarget:self action:@selector(registerClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:registerButton];
//        
//        [registerButton.layer setMasksToBounds:YES];
//        [registerButton.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
//        [registerButton.layer setBorderWidth:1.0]; //边框宽度
//        [registerButton.layer setBorderColor:colorref];//边框颜色
//        registerButton.backgroundColor = [UIColor redColor];
//        
//        [registerButton setTitle:@"注册新用户" forState:UIControlStateNormal];
//        [registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        registerButton.titleLabel.font = [UIFont systemFontOfSize: 20];
        
    
        
        
        
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)titleString andTitleColor:(UIColor *)color andTitleFont:(UIFont *)font{

    self = [super initWithFrame:frame];
    if (self) {
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });
        self.frame = frame;
        [self setTitle:titleString forState:UIControlStateNormal];

        [self.layer setMasksToBounds:YES];
        [self.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
        [self.layer setBorderWidth:1.0]; //边框宽度
        [self.layer setBorderColor:colorref];//边框颜色
        [self setTitleColor:color forState:UIControlStateNormal];
        self.titleLabel.font = font;
  
        
    }
    return self;


}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
