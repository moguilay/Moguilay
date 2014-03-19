//
//  LogInViewController.m
//  有钱
//
//  Created by Moguilay on 14-3-3.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "LogInViewController.h"
//#import "SVProgressHUD.h"
#import "UnderLineLabel.h"
#import "FindPasswordViewController.h"
@interface LogInViewController ()

@end

@implementation LogInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
//        NSLog(@"%@",[DBUserMessage SelectDataFromUserMessageList]);
        self.view.backgroundColor = [UIColor whiteColor];
        self.title = @"登录";
        [self setViewTitle:@"登录"];
        //设置Title
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(140, 10, 100, 60)];
        titleLabel.textColor = [UIColor darkGrayColor];
        titleLabel.text = @"账号";
        titleLabel.font = [UIFont boldSystemFontOfSize:20.0f];
        [self.view addSubview:titleLabel];

        
        
        //手机号 和  密码
//        mobilTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 300, 300, 80)];
        mobilTextField = [[UITextField alloc]initWithFrame:CGRectMake(30, 100 - 40, 263, 54)];
        mobilTextField.backgroundColor = [UIColor whiteColor];
        mobilTextField.placeholder = @"输入您的手机号码";
        mobilTextField.borderStyle = UITextBorderStyleRoundedRect;
        [mobilTextField setKeyboardType:UIKeyboardTypeNumberPad];
        mobilTextField.font = [UIFont fontWithName:@"helvetica" size:20.0];
        mobilTextField.clearButtonMode = UITextFieldViewModeWhileEditing;//一键删除
        mobilTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对其的方式
        mobilTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        mobilTextField.returnKeyType = UIReturnKeyNext;
        [self.view addSubview:mobilTextField];
//        [mobilTextField becomeFirstResponder];//键盘第一响应
//        mobilTextField.clearsOnBeginEditing = YES;//重新重新输入时候清空
        mobilTextField.delegate = self;
        
        
        
        
        
        
//        password = [[UITextField alloc]initWithFrame:CGRectMake(10, 300, 300, 80)];
        password = [[UITextField alloc]initWithFrame:CGRectMake(30, 160 - 40, 263, 54)];
        password.backgroundColor = [UIColor whiteColor];
        password.placeholder = @"输入您的密码";
//        password.text = @"njklvdfnvjkld";
        password.font = [UIFont fontWithName:@"helvetica" size:20.0];
        password.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        password.secureTextEntry = YES;
        password.clearButtonMode = UITextFieldViewModeWhileEditing;
        password.borderStyle = UITextBorderStyleRoundedRect;
        [password setKeyboardType:UIKeyboardTypeEmailAddress];
        password.returnKeyType = UIReturnKeyGo;
        password.delegate = self;
        password.clearsOnBeginEditing = YES;
      
        [self.view addSubview:password];
        
        
   
//        
        if ([GlobleFunction isUserLoginOnce]) {
            mobilTextField.text = [GlobleFunction getUserMobileNumber];
            password.text = [GlobleFunction getUserPassword];
            
        }
        
        
        
        NSString *forgetStr = @"忘记密码";
        UnderLineLabel *forgetLabel = [[UnderLineLabel alloc] initWithFrame:CGRectMake(100, 190 - 60, 200, 40)];
        [forgetLabel setBackgroundColor:[UIColor clearColor]];
        [forgetLabel setTextColor:[UIColor darkGrayColor]];
        forgetLabel.shouldUnderline = YES;
        [forgetLabel setText:forgetStr andCenter:CGPointMake(250, 200)];
        [forgetLabel addTarget:self action:@selector(registerClick1:)];
        [forgetLabel setHighlightedColor:[UIColor clearColor]];
        [self.view addSubview:forgetLabel];
        

        UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        loginButton.backgroundColor = [UIColor clearColor];
        loginButton.frame = CGRectMake(260, 15, 60, 50);
        [loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [loginButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        loginButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [loginButton addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:loginButton];
        
        
        
        
        
        //注册按钮
         ReButton *registerButton = [[ReButton  alloc]initWithFrame:CGRectMake(25, 220, 275, 50) andTitle:@"免费注册" andTitleColor:[UIColor whiteColor] andTitleFont:[UIFont systemFontOfSize: 20]];
        registerButton.backgroundColor = [UIColor redColor];
        registerButton.tag = 10001;
        [self.view addSubview:registerButton];
         [registerButton addTarget:self action:@selector(registerClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
        
        
        //自定义键盘添加完成等按钮
        mEditFieldArray = [NSMutableArray arrayWithObjects:mobilTextField,password, nil];
        mKeyboardBar = [[EXKeyboardTopBar alloc]init];
        [mKeyboardBar  setAllowShowPreAndNext:YES];
        [mKeyboardBar setIsInNavigationController:NO];
        [mKeyboardBar setTextFieldsArray:mEditFieldArray];
        [self.view addSubview:mKeyboardBar.view];
        
        
       
        
        
        
        
        
        //网络部分   用户登录网络监测
        logInEngine = [[AccountDownload alloc]initWithHostName:SERVICE_BASE_ADDRESS];
        //在数据库获得用户信息
        

       

    }
    return self;
}

//网络部分   监测用户名密码
-(void)getDataFromNet{
    
    passwordMD5 = [MyMD5 md5:password.text];
    
    //给服务器提供数据
    logInOP = [logInEngine userLogInWithPuBrePath:@"" andVersion:CURRENT_VERSION andPhoneNum:mobilTextField.text andAccount:mobilTextField.text andPassWord:passwordMD5 andIP:[GlobleFunction getIPAddress] andIDFA:[GlobleFunction getIDFA]];

    
    
    //防止警告
//    __unsafe_unretained LogInViewController *dataMode = self;
//    
//    __unsafe_unretained NSString *passwordMD5Data = passwordMD5;
//    __unsafe_unretained NSString *passwordData = password.text;
    [logInOP addCompletionHandler:^(MKNetworkOperation *operation) {
        NSDictionary* JSON=[operation responseJSON];
//        NSLog(@"_____-------------%@", JSON);
        NSDictionary* statusDic = [JSON objectForKey:@"status"];
        NSDictionary *dataDic = [JSON objectForKey:@"data"];
        NSString *code = [statusDic objectForKey:@"code"];
        //获取注册返回信息状态码
        if ([code isEqual:@"0"]) {
            //登录成功
//            //登录成功后获取用户信息插入本地数据库中
          
            NSString *uid = [dataDic objectForKey:@"uid"];
            NSString *phone = [dataDic objectForKey:@"phone"];
            NSString *credit = [dataDic objectForKey:@"credit"];
            NSString *alipay = [dataDic objectForKey:@"alipay"];
            NSString *alipayName = [dataDic objectForKey:@"alipayName"];
            
            
            
            NSDictionary *userMessageDictionary = [[NSDictionary alloc]initWithObjectsAndKeys:phone,USERMOILBNUM,passwordMD5,USERPASSWORD,alipay,ZHIFUBAOACCOUNT,credit,USERCREDIT,uid,USERID,password.text,USERPASSTRUEWORD,alipayName,USERNAME,nil];
          
            
            [DBUserMessage insertInToUserMessageList:userMessageDictionary];//插入数据库数据
            
            
            
            NSLog(@"shujuku&&&&&&7%@",[DBUserMessage SelectDataFromUserMessageList]);

            [self dismissSuccess];
            [self dismissSelfViewController];
            //1131weizhuce  1132mimacuo
            
        }
        else if ([code isEqual:@"1131"]){
            //该手机号码未注册
            [SVProgressHUD showErrorWithStatus:@"该手机号码未注册"];
            return ;
            
            
        }else if([code isEqual:@"1132"]){
            //密码错误
            [SVProgressHUD showErrorWithStatus:@"密码错误"];
            return;
            
        }
        

    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error)  {
        
        //
        DLog(@"%@", error);
        
        
           [self dismissError];
    }];

    
}


//忘记密码 点击找回密码


-(void)registerClick1:(id)sender{
    
    RegisterViewController *registerVC = [[RegisterViewController alloc]initWithTitleName:@"找回密码"];
    registerVC.dismissDelegate = self;
    [self presentViewController:registerVC animated:YES completion:^(void){
        
        
    }];
    
}
//新用户注册
-(void)registerClick:(UIButton *)sender{

    RegisterViewController *registerVC = [[RegisterViewController alloc]initWithTitleName:@"注册"];
    registerVC.dismissDelegate = self;
    [self presentViewController:registerVC animated:YES completion:^(void){
   
        
    }];
    
}

-(void)dismissLogInVC{

    [self dismissViewControllerAnimated:YES completion:^(void){

    }];
}

-(void)loginClick:(UIButton *)sender{
    
    //登录按钮点击后

//    [self getDataFromNet];
    [self loginMainVC];
}


static float progress = 0.0f;

-(void)loginMainVC{
    
//    [GlobleFunction upDataZhiFuBaoAccount:@"cdnsj@163.com"];
    
//    NSLog(@"%@", [DBUserMessage SelectDataFromUserMessageList]);
    
    
    if ([mobilTextField.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
        return;
    }
    if (![GlobleFunction isMobileNumber:mobilTextField.text]) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确的手机号"];
        return;
    }
    if ([password.text isEqualToString:@""]) {
         [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
//    if (![passwordMD5 isEqualToString:[GlobleFunction getUserMD5Password]]) {
//        //点击到这块去请求网络
//        
//    
//        [SVProgressHUD showErrorWithStatus:@"密码错误"];
//        return;
//    }
    
   
    
    [self checkUserAndPassword];

//    [SVProgressHUD showSuccessWithStatus:@"Succ"];
//    [SVProgressHUD showErrorWithStatus:@"Filed"];
//    [SVProgressHUD showSuccessWithStatus:@"登录成功" duration:1];
//    [SVProgressHUD showSuccessWithStatus:@"Success"];
//    [SVProgressHUD showProgress:0 status:@"Success" maskType:SVProgressHUDMaskTypeBlack];
//    [SVProgressHUD showWithStatus:@"cbfehuk"];
//    progress = 0.0f;
//    [SVProgressHUD showProgress:0 status:@"Loading"];
//    [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:0.3];
 
   
//    [SVProgressHUD showProgress:0.0f status:@"Done"];
//    [SVProgressHUD show];
    
    //鉴定用户名和密码的正确性

}

//检查用户名和密码 是否和网上的相同
-(void)checkUserAndPassword{
    
    
    [self getDataFromNet];
    [SVProgressHUD showWithStatus:@"Loading"];//加载loading 等待网络回来
    
    
//    if ([mobilTextField.text isEqualToString:[GlobleFunction getUserMobileNumber]] && [passwordMD5 isEqualToString:[GlobleFunction getUserMD5Password]]) {
//           [SVProgressHUD showWithStatus:@"Loading"];//加载loading 等待网络回来
//        [self dismissSuccess];
//        [self dismissSelfViewController];
////        NSLog(@"%@", [DBUserMessage SelectDataFromUserMessageList]);
//        
//    }
    

//     [self performSelector:@selector(checkUserAndPassword) withObject:nil afterDelay:0.5];
}
-(void)dismissSelfViewController{

    
      [self dismissViewControllerAnimated:YES completion:^(void){
    
      }];
}


- (void)increaseProgress {
    progress+=0.1f;
//    [SVProgressHUD showProgress:progress status:@"Loading"];
    
    if(progress < 1.0f)
        [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:0.3];
    else
        [self performSelector:@selector(dismissSuccess) withObject:nil afterDelay:0.4f];
}

#pragma mark -
#pragma mark Dismiss Methods Sample

- (void)dismiss {
	[SVProgressHUD dismiss];
}

- (void)dismissSuccess {
	[SVProgressHUD showSuccessWithStatus:@"登录成功!"];
}

- (void)dismissError {
	[SVProgressHUD showErrorWithStatus:@"登录失败"];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [mobilTextField resignFirstResponder];
    [password resignFirstResponder];
    [mKeyboardBar hiddenKeyBoard];

}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
//
//    UIBarButtonItem *done =    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(leaveEditMode)] ;
   
    [mKeyboardBar showBar:textField];
    UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:nil];
    
    self.navigationItem.rightBarButtonItem = done;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    

//    if ([textField isFirstResponder]) {
//        [mobilTextField becomeFirstResponder];
//    }else
        if([password isFirstResponder]){
        //监测用户手机号码和密码是否正确
        [self loginMainVC];
//        [self performSelector:@selector(checkEmailAndPassword:)];
    }
    
    return YES;
}


-(void)viewDidAppear:(BOOL)animated
{
    


}
-(void)viewDidDisappear:(BOOL)animated
{
 [mKeyboardBar hiddenKeyBoard];
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

@end
