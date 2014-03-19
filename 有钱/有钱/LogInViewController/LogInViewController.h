//
//  LogInViewController.h
//  有钱
//
//  Created by Moguilay on 14-3-3.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "BaseViewController.h"
#import "RegisterViewController.h"
#import "AccountDownload.h"

//@protocol DismissLogInVCDelegeate <NSObject>
//@optional
//-(void)dismissLogInVCThenToRegisterVC;//
//@end



@interface LogInViewController : BaseViewController<UITextFieldDelegate, DisMissLogInVCDelegate>
{

    UITextField *mobilTextField ;//手机号码
    UITextField *password;//密码
    
    
    
    NSMutableArray *mEditFieldArray;     //存放视图中可编辑的控件
    EXKeyboardTopBar *mKeyboardBar;
    
    
    NSString *passwordMD5;
    
    
    AccountDownload* logInEngine;// 登录网络引擎
    MKNetworkOperation* logInOP;
}

//-(void)isAutoLogin;
//@property(nonatomic, assign)id<DismissLogInVCDelegeate> dismissDelegate;
@end
