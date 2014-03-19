//
//  PersonalCenterViewController.h
//  moguilay
//
//  Created by Moguilay on 14-2-27.
//  Copyright (c) 2014年 Moguilay. All rights reserved.
//

#import "BaseViewController.h"
#import "UMSocialShakeService.h"
#import "LogInViewController.h"
#import "RegisterViewController.h"
@interface PersonalCenterViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource,UMSocialShakeDelegate,UMSocialUIDelegate,UIActionSheetDelegate>
{
    UITableView *personalCenterTableView;
    ReButton *logOutbutton;
    UIButton *logInButton;
    
    
    
    UIButton *shareBtn;
    
    
    BOOL isUMViewAppear;

}
@end
