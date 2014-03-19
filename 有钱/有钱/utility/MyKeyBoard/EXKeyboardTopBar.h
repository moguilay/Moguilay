//
//  EXKeyboardTopBar.h
//  Tucao
//
//  Created by 王 玉龙 on 13-7-19.
//  Copyright (c) 2013年 ZodaicSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

#define D_NOTIFI_KEYBOARD_CHANGE "keyboardChanged"

@interface EXKeyboardTopBar : NSObject
{
    UIToolbar       *view;                       //工具条
    NSArray         *textFields;                 //输入框数组
    BOOL            allowShowPreAndNext;         //是否显示上一项、下一项
    BOOL            isInNavigationController;    //是否在导航视图中
    UIBarButtonItem *prevButtonItem;             //上一项按钮
    UIBarButtonItem *nextButtonItem;             //下一项按钮
    UIBarButtonItem *hiddenButtonItem;           //隐藏按钮
    UIBarButtonItem *spaceButtonItem;            //空白按钮
    UITextField     *currentTextField;           //当前输入框
    
    BOOL mIsKeyboardShow;
}
@property(nonatomic,retain) UIToolbar *view;

-(id)init;
-(void)setAllowShowPreAndNext:(BOOL)isShow;
-(void)setIsInNavigationController:(BOOL)isbool;
-(void)setTextFieldsArray:(NSArray *)array;

-(void)showPrevious;

-(void)showNext;

-(void)showBar:(UITextField *)textField;

-(void)hiddenKeyBoard;
- (void)removeNotification;

@end
