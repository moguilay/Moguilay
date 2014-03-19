//
//  UserRegisterViewController.h
//  moguilay
//
//  Created by Moguilay on 14-2-27.
//  Copyright (c) 2014年 Moguilay. All rights reserved.
//

#import "BaseViewController.h"

@interface UserRegisterViewController : BaseViewController
@property(nonatomic, strong)UILabel *mobileNumLabel;
@property(nonatomic, strong)UILabel *passwordLabel;
@property(nonatomic, strong)UITextField *mobileNumTextField;
@property(nonatomic, strong)UITextField *passwordTextField;
@property(nonatomic, strong)UIButton *loginButton;
@property(nonatomic, strong)UIButton *registerButton;

@end
