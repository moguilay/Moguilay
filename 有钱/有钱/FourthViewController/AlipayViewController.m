//
//  AlipayViewController.m
//  有钱
//
//  Created by Moguilay on 14-3-13.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "AlipayViewController.h"

@interface AlipayViewController ()

@end

@implementation AlipayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        self.title = @"支付宝账号";
        
        
        //        password = [[UITextField alloc]initWithFrame:CGRectMake(10, 300, 300, 80)];
        password = [[UITextField alloc]initWithFrame:CGRectMake(30, 100, 263, 54)];
        password.backgroundColor = [UIColor whiteColor];
        password.placeholder = @"姓名";
        
      
        password.font = [UIFont fontWithName:@"helvetica" size:20.0];
        password.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
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
        rePassword.placeholder = @"支付宝账号";
        //        password.text = @"njklvdfnvjkld";
        rePassword.font = [UIFont fontWithName:@"helvetica" size:20.0];
        rePassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;

        rePassword.clearButtonMode = UITextFieldViewModeWhileEditing;
        rePassword.borderStyle = UITextBorderStyleRoundedRect;
        [rePassword setKeyboardType:UIKeyboardTypeEmailAddress];
        rePassword.returnKeyType = UIReturnKeyGo;
        rePassword.delegate = self;
        rePassword.clearsOnBeginEditing = YES;
        [self.view addSubview:rePassword];
        
        
        //判断是否已经有用户姓名和支付宝账号
        if (![[GlobleFunction getUserZhiFuBaoAccount] isEqualToString:@""]) {
        password.placeholder = [GlobleFunction getUserZhiFuBaoAccount];
            
            rePassword.placeholder = [GlobleFunction getUserName];
            
        }
        
        
        
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
        
               
        
        
        
        // Custom initialization
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
//    UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:nil];
//    
//    self.navigationItem.rightBarButtonItem = done;
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
    //保存
    if ([password.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入姓名"];
        return;
    }
    if ([rePassword.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"支付宝账号"];
        return;
    }
    if ([GlobleFunction isMobileNumber:rePassword.text] || [GlobleFunction isStandardMail:rePassword.text]) {
         [SVProgressHUD showSuccessWithStatus:@"保存成功"];
     
        
    }else{
    
           [SVProgressHUD showErrorWithStatus:@"请输入正确地支付宝账号"];
        return;
    }
    
    
    
    
   

    
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
