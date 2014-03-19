//
//  RegisterViewController.h
//  有钱
//
//  Created by Moguilay on 14-3-3.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "BaseViewController.h"
#import "AccountDownload.h"
#import "UnderLineLabel.h"
@protocol DisMissLogInVCDelegate <NSObject>
@optional
-(void)dismissLogInVC;//
@end
@interface RegisterViewController : BaseViewController<UITextFieldDelegate,DisMissLogInVCDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UITextField *mobilTextField;
    UITextField *password;
    UITextField *repeatPassword;
    UITextField *verificationWord;
    NSTimer *timer;
    UnderLineLabel *getVerificationWordButton;
    int secondsCountDown;
    
    
    
    
    
    
    NSMutableArray *mEditFieldArray;     //存放视图中可编辑的控件
    EXKeyboardTopBar *mKeyboardBar;
    
    
      UITableView *bgScrollView;//设置整体View可以滑动
    
    
    
    AccountDownload* registEngine;// 注册下载
    MKNetworkOperation* registOP;
    
    
  
//    UILabel *testLabel ;
}



- (id)initWithTitleName:(NSString *)titleName;

@property(nonatomic, assign)id<DisMissLogInVCDelegate> dismissDelegate;
@end
