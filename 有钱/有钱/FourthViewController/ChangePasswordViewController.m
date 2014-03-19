//
//  ChangePasswordViewController.m
//  有钱
//
//  Created by Moguilay on 14-3-13.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"密码修改";
        // Custom initialization
    
        
    
        
        
        //        password = [[UITextField alloc]initWithFrame:CGRectMake(10, 300, 300, 80)];
        password = [[UITextField alloc]initWithFrame:CGRectMake(30, 100, 263, 54)];
        password.backgroundColor = [UIColor whiteColor];
        password.placeholder = @"输入您的密码";
        //        password.text = @"njklvdfnvjkld";
        password.font = [UIFont fontWithName:@"helvetica" size:20.0];
        password.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        password.secureTextEntry = YES;
        password.clearButtonMode = UITextFieldViewModeWhileEditing;
        password.borderStyle = UITextBorderStyleRoundedRect;
        [password setKeyboardType:UIKeyboardTypeEmailAddress];
        password.returnKeyType = UIReturnKeyNext;
        password.delegate = self;
        password.clearsOnBeginEditing = YES;
        
        [self.view addSubview:password];
        
        
        //        password = [[UITextField alloc]initWithFrame:CGRectMake(10, 300, 300, 80)];
        rePassword = [[UITextField alloc]initWithFrame:CGRectMake(30, 180, 263, 54)];
        rePassword.backgroundColor = [UIColor whiteColor];
        rePassword.placeholder = @"确认您的密码";
        //        password.text = @"njklvdfnvjkld";
        rePassword.font = [UIFont fontWithName:@"helvetica" size:20.0];
        rePassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        rePassword.secureTextEntry = YES;
        rePassword.clearButtonMode = UITextFieldViewModeWhileEditing;
        rePassword.borderStyle = UITextBorderStyleRoundedRect;
        [rePassword setKeyboardType:UIKeyboardTypeEmailAddress];
        rePassword.returnKeyType = UIReturnKeyGo;
        rePassword.delegate = self;
        rePassword.clearsOnBeginEditing = YES;
        [self.view addSubview:rePassword];
        
        
      
        
        
        
        UIButton *redButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        redButton.backgroundColor = [UIColor redColor];
        redButton.frame = CGRectMake(120, 300, 80, 80);
        redButton.layer.borderWidth = 1;
        redButton.layer.borderColor = [UIColor redColor].CGColor;
        redButton.layer.cornerRadius = 40;
        redButton.layer.masksToBounds = YES;
        [redButton setTitle:@"确认" forState:UIControlStateNormal];
        [redButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
        [self.view addSubview:redButton];
        [redButton addTarget:self action:@selector(sureButton) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        //自定义键盘添加完成等按钮
        mEditFieldArray = [NSMutableArray arrayWithObjects:password,rePassword,nil];
        mKeyboardBar = [[EXKeyboardTopBar alloc]init];
        [mKeyboardBar  setAllowShowPreAndNext:YES];
        [mKeyboardBar setIsInNavigationController:NO];
        [mKeyboardBar setTextFieldsArray:mEditFieldArray];
        [self.view addSubview:mKeyboardBar.view];
        [self.view bringSubviewToFront:mKeyboardBar.view];
        
        
    }
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [password resignFirstResponder];
    [rePassword resignFirstResponder];
    [mKeyboardBar hiddenKeyBoard];
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [mKeyboardBar showBar:textField];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    
    
    if([password isFirstResponder]){
        
        [rePassword becomeFirstResponder];
        
    }else{
        
        [self sureButton];
    }
    
    return YES;
}
-(void)sureButton{
    //密码设置判断
    if ([password.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    if (password.text.length < 6) {
        [SVProgressHUD showErrorWithStatus:@"密码不能少于6位"];
        return;
    }
    
    
    if ([rePassword.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入确认密码"];
        return;
    }
    if (![rePassword.text isEqualToString:password.text]) {
        [SVProgressHUD showErrorWithStatus:@"俩次输入密码不一致"];
        return;
    }
    
    
    
    [SVProgressHUD showSuccessWithStatus:@"修改成功"];

    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
