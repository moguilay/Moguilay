//
//  RegisterViewController.m
//  有钱
//
//  Created by Moguilay on 14-3-3.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end


@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}


- (id)initWithTitleName:(NSString *)titleName{

    self = [super initWithNibName:nil bundle:nil];
    if (self) {
    
        
        
        bgScrollView = [[UITableView alloc]init];
        bgScrollView.frame = [[UIScreen mainScreen] bounds];
        bgScrollView.delegate = self;
        bgScrollView.dataSource = self;
        bgScrollView.backgroundColor = [UIColor clearColor];
        bgScrollView.userInteractionEnabled = YES;
        bgScrollView.showsHorizontalScrollIndicator = NO;
        bgScrollView.showsVerticalScrollIndicator = NO;
        bgScrollView.separatorStyle = UITableViewCellAccessoryNone;
        bgScrollView.alwaysBounceVertical = NO;
        bgScrollView.alwaysBounceHorizontal = NO;
        [bgScrollView setContentOffset:CGPointMake(0, 0)];

        [self.view addSubview:bgScrollView];
        
        
        //设置Title
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 320, 60)];
        titleLabel.textColor = [UIColor darkGrayColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = titleName;
        titleLabel.font = [UIFont boldSystemFontOfSize:20.0f];
        titleLabel.numberOfLines = 0;
        titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [bgScrollView addSubview:titleLabel];
        
        
        
        // s倒计时
        secondsCountDown = 120;
        
        
        mobilTextField = [[UITextField alloc]initWithFrame:CGRectMake(30, 100, 263, 54)];
        mobilTextField.backgroundColor = [UIColor whiteColor];
        mobilTextField.placeholder = @"输入您的手机号码";
        mobilTextField.borderStyle = UITextBorderStyleRoundedRect;
        [mobilTextField setKeyboardType:UIKeyboardTypeNumberPad];
        mobilTextField.font = [UIFont fontWithName:@"helvetica" size:20.0];
        mobilTextField.clearButtonMode = UITextFieldViewModeWhileEditing;//一键删除
        mobilTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对其的方式
        mobilTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        mobilTextField.returnKeyType = UIReturnKeyNext;
        [bgScrollView addSubview:mobilTextField];
        //        [mobilTextField becomeFirstResponder];//键盘第一响应
        //        mobilTextField.clearsOnBeginEditing = YES;//重新重新输入时候清空
        mobilTextField.delegate = self;
        
        //验证码
        
        verificationWord = [[UITextField alloc]initWithFrame:CGRectMake(30, 170, 120, 54)];
        verificationWord.backgroundColor = [UIColor whiteColor];
        verificationWord.placeholder = @"验证码";
        verificationWord.borderStyle = UITextBorderStyleRoundedRect;
        [verificationWord setKeyboardType:UIKeyboardTypeNumberPad];
        verificationWord.font = [UIFont fontWithName:@"helvetica" size:20.0];
        verificationWord.clearButtonMode = UITextFieldViewModeWhileEditing;//一键删除
        verificationWord.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对其的方式
        verificationWord.autocapitalizationType = UITextAutocapitalizationTypeNone;
        verificationWord.returnKeyType = UIReturnKeyNext;
        [bgScrollView addSubview:verificationWord];
        //        verificationWord.clearsOnBeginEditing = YES;//重新重新输入时候清空
        verificationWord.delegate = self;
        
        //获取验证码
        getVerificationWordButton = [[UnderLineLabel alloc]init];
        getVerificationWordButton.backgroundColor  = [UIColor whiteColor];
        getVerificationWordButton.frame = CGRectMake(200, 170, 100, 54);
        
        
        [getVerificationWordButton setBackgroundColor:[UIColor clearColor]];
        [getVerificationWordButton setTextColor:[UIColor darkGrayColor]];
        getVerificationWordButton.shouldUnderline = YES;
        [getVerificationWordButton setText:@"获取验证码" andCenter:CGPointMake(250, 200)];
        [getVerificationWordButton addTarget:self action:@selector(getVerificationClick:)];
        [getVerificationWordButton setHighlightedColor:[UIColor clearColor]];
        getVerificationWordButton.userInteractionEnabled = YES;
        [bgScrollView addSubview:getVerificationWordButton];
        
        
        if (secondsCountDown < 120 ) {
//            [getVerificationWordButton setTitle:[NSString stringWithFormat:@"%d", secondsCountDown] forState:UIControlStateNormal];
            getVerificationWordButton.userInteractionEnabled = NO;
            getVerificationWordButton.shouldUnderline = NO;
        }
        
        
        
  
        //设置密码
        
        
        password = [[UITextField alloc]initWithFrame:CGRectMake(30, 230, 263, 54)];
        password.backgroundColor = [UIColor whiteColor];
        password.placeholder = @"设置您的密码(最少6位)";
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
        [bgScrollView addSubview:password];
        
        
        //重复密码
        
        repeatPassword = [[UITextField alloc]initWithFrame:CGRectMake(30, 290, 263, 54)];
        repeatPassword.backgroundColor = [UIColor whiteColor];
        repeatPassword.placeholder = @"重复您的密码(最少6位)";
        //        repeatPassword.text = @"njklvdfnvjkld";
        repeatPassword.font = [UIFont fontWithName:@"helvetica" size:20.0];
        repeatPassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        repeatPassword.secureTextEntry = YES;
        repeatPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
        repeatPassword.borderStyle = UITextBorderStyleRoundedRect;
        [repeatPassword setKeyboardType:UIKeyboardTypeEmailAddress];
        repeatPassword.returnKeyType = UIReturnKeyGo;
        repeatPassword.delegate = self;
        repeatPassword.clearsOnBeginEditing = YES;
        [bgScrollView addSubview:repeatPassword];
        
        
        //返回上一页面的按钮
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        backButton.backgroundColor = [UIColor clearColor];
        backButton.frame = CGRectMake(0, 15, 60, 50);
        [backButton setTitle:@"取消" forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        backButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [backButton addTarget:self action:@selector(backButton) forControlEvents:UIControlEventTouchUpInside];
        [bgScrollView addSubview:backButton];
        
        
        
        //注册按钮
        ReButton *doneButton = [[ReButton  alloc]initWithFrame:CGRectMake(30, 350, 263, 54) andTitle:@"确认" andTitleColor:[UIColor whiteColor] andTitleFont:[UIFont systemFontOfSize: 20]];
        doneButton.backgroundColor = [UIColor redColor];
        [bgScrollView addSubview:doneButton];
        [doneButton addTarget:self action:@selector(doneButton) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        //
        //自定义键盘添加完成等按钮
        mEditFieldArray = [NSMutableArray arrayWithObjects:mobilTextField,verificationWord,password,repeatPassword,nil];
        mKeyboardBar = [[EXKeyboardTopBar alloc]init];
        [mKeyboardBar  setAllowShowPreAndNext:YES];
        [mKeyboardBar setIsInNavigationController:NO];
        [mKeyboardBar setTextFieldsArray:mEditFieldArray];
        [self.view addSubview:mKeyboardBar.view];
        [self.view bringSubviewToFront:mKeyboardBar.view];
        
        //监听键盘
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
          [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        
        
        
        
        //网络初始化
        registEngine = [[AccountDownload alloc]initWithHostName:SERVICE_BASE_ADDRESS];
        
        
        
    }
    return self;

}






//tableView


//UItabelViewCell的设计
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IDID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"IDID"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
    
    
}
//tabelView 的列数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
//mei列的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0f;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    
}
//监听键盘出现和隐藏
- (void)keyboardWillShow:(NSNotification*)aNotification{

//    CGRect tScreenBounds = [[UIScreen mainScreen] bounds];
//
//   
//    [UIView animateWithDuration:0.3 animations:^(void){
//            bgScrollView.frame = CGRectMake(0, 0, 320,tScreenBounds.size.height - 200);
////        [bgScrollView setContentOffset:CGPointMake(0, tScreenBounds.size.height - 200)];
//        
//    }];
}
- (void)keyboardWillHide:(NSNotification*)aNotification{
    bgScrollView.alwaysBounceVertical = NO;
    [UIView animateWithDuration:0.3 animations:^(void){
//        [bgScrollView setContentOffset:CGPointMake(0, 0)];
         bgScrollView.frame = [[UIScreen mainScreen] bounds];
        
    }];
    
}
//
-(void)doneButton{
    
    //点击完成按钮 判断用户输入内容
    
    //判断手机号码
    if ([mobilTextField.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
        return;
    }
    if (![GlobleFunction isMobileNumber:mobilTextField.text]) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确的手机号"];
        return;
    }
    
    //判断验证码
    if ([verificationWord.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
        return;
    }
    if (verificationWord.text.length < 4) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确地验证码"];
        return;
    }
    
    //密码设置判断
    if ([password.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    if (password.text.length < 6) {
        [SVProgressHUD showErrorWithStatus:@"密码不能少于6位"];
        return;
    }
    
    
    if ([repeatPassword.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入确认密码"];
        return;
    }
    if (![repeatPassword.text isEqualToString:password.text]) {
        [SVProgressHUD showErrorWithStatus:@"俩次输入密码不一致"];
        return;
    }
    
    
    
    //本地检查无误后请求网络注册
    [SVProgressHUD showWithStatus:@"注册中"];
//     [SVProgressHUD showWithStatus:@"注册成功"];
    
    [self registUserFromNet];
    
//    [self dismissSelfViewController];
    
    
    
  
    
}
//从网络获取注册后信息
-(void)registUserFromNet{
    
    NSString *passwordMD5 = [MyMD5 md5:repeatPassword.text];

//    //测试数据
//    [DBUserMessage deleteUserMessageList];
//    NSDictionary *userMessageDictionary = [[NSDictionary alloc]initWithObjectsAndKeys:mobilTextField.text,USERMOILBNUM,passwordMD5,USERPASSWORD,@"",ZHIFUBAOACCOUNT,@"0",USERCREDIT, repeatPassword.text,USERPASSTRUEWORD,@"00001",USERID,@"",USERNAME,nil];
//   
//    [DBUserMessage insertInToUserMessageList:userMessageDictionary];//插入数据库数据
//    
//    
//    NSLog(@"第一次本地数据%@",[DBUserMessage SelectDataFromUserMessageList]);
    
    
    
    //给服务器提供数据
    registOP = [registEngine userRegisterWithPuBrePath:@"" andVersion:CURRENT_VERSION andPhoneNum:mobilTextField.text andAccount:mobilTextField.text andPassWord:passwordMD5 andMessageCode:verificationWord.text andIP:[GlobleFunction getIPAddress] andIDFA:[GlobleFunction getIDFA]];
    
    
    
    
    //防止警告
//    __unsafe_unretained NSString *phoneNumDataMode = mobilTextField.text;
//    __unsafe_unretained NSString *passwordMD5Data = passwordMD5;
//    __unsafe_unretained NSString *passwordDataMode = repeatPassword.text;
     __unsafe_unretained RegisterViewController *dataMode = self;
    [registOP addCompletionHandler:^(MKNetworkOperation *operation) {
//        [DBUserMessage deleteUserMessageList];
        NSDictionary* JSON=[operation responseJSON];
        
        
        NSLog(@"getData For Net %@", JSON);
        NSDictionary* statusDic = [JSON objectForKey:@"status"];
        NSDictionary *dataDic = [JSON objectForKey:@"data"];
        NSString *code = [statusDic objectForKey:@"code"];
        //获取注册返回信息状态码
        if ([code isEqual:@"0"]) {
            //注册成功后删除本地缓存的数据
            [DBUserMessage deleteUserMessageList];
             //注册成功后获取用户信息插入本地数据库中
        
            NSString *uid = [dataDic objectForKey:@"uid"];
//            NSString *phone = [dataDic objectForKey:@"phone"];
//            NSString *credit = [dataDic objectForKey:@"credit"];
//            NSString *alipay = [dataDic objectForKey:@"alipay"];
            
      
            
            NSDictionary *userMessageDictionary = [[NSDictionary alloc]initWithObjectsAndKeys:mobilTextField.text,USERMOILBNUM,passwordMD5,USERPASSWORD,@"",ZHIFUBAOACCOUNT,@"",USERCREDIT,uid,USERID,repeatPassword.text,USERPASSTRUEWORD,@"",USERNAME,nil];
        
            
            
            
            
            
            
            
            [DBUserMessage insertInToUserMessageList:userMessageDictionary];//插入数据库数据
            [dataMode dismiss];
            [dataMode dismissSelfViewController];
            
            
            
        }else if ([code isEqual:@"1130"]){
            //该用户已经存在
            [SVProgressHUD showErrorWithStatus:@"该用户已经存在"];
            return ;
        
        
        }else if([code isEqual:@"1131"]){
            //注册失败
            [SVProgressHUD showErrorWithStatus:@"注册失败"];
            return;
        
        }else if([code isEqual:@"1135"]){
            //注册失败
            [SVProgressHUD showErrorWithStatus:@"验证码错误"];
            return;
            
        }
        
       
        
        
        
        
        
        

    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error)  {
        
        //
          [SVProgressHUD showErrorWithStatus:@"网络错误"];
        DLog(@"%@", error);
    }];

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

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == verificationWord) {
        if (range.location>= 4)
        {
            return  NO;
        }
    }
    
    if (textField == mobilTextField) {
        if (range.location>= 11)
        {
            return  NO;
        }
    }
    return YES;
  
}
//注册成功后调用

-(void)dismissSelfViewController{

    
    [self dismissViewControllerAnimated:YES completion:^(void){
        [self.dismissDelegate dismissLogInVC];
        
    }];
}

-(void)backButton{

    [self dismissViewControllerAnimated:YES completion:^(void){
        
    }];
}


-(void)getVerificationClick:(UIButton *)sender{
//    getVerificationWordButton.userInteractionEnabled = NO;
    if ([mobilTextField.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
        return;
    }
    if (![GlobleFunction isMobileNumber:mobilTextField.text]) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确的手机号"];
        return;
    }
    
    //发送成功获取验证码后
    [SVProgressHUD showSuccessWithStatus:@"发送成功"];
    
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
    
}


-(void)timeFireMethod{
    secondsCountDown--;
    NSLog(@"%d", secondsCountDown);
    
    
     [getVerificationWordButton setText:[NSString stringWithFormat:@"剩余%d秒",secondsCountDown] andCenter:CGPointMake(250, 200)];
    getVerificationWordButton.textColor = [UIColor grayColor];
//    [getVerificationWordButton setTitle:[NSString stringWithFormat:@"%d",secondsCountDown] forState:UIControlStateNormal];
//    [getVerificationWordButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    getVerificationWordButton.userInteractionEnabled = NO;
    getVerificationWordButton.shouldUnderline = NO;
    if (secondsCountDown == 0) {
    
        
        [timer invalidate];
        getVerificationWordButton.userInteractionEnabled = YES;
        getVerificationWordButton.shouldUnderline = YES;
           getVerificationWordButton.textColor = [UIColor blackColor];
         [getVerificationWordButton setText:@"获取验证码" andCenter:CGPointMake(250, 200)];
//        [getVerificationWordButton setTitle:@"获取验证码" forState:UIControlStateNormal];
//        [getVerificationWordButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        secondsCountDown = 120;
    }
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [mKeyboardBar hiddenKeyBoard];
    
    [mobilTextField resignFirstResponder];
    [verificationWord resignFirstResponder];
    [password resignFirstResponder];
    [repeatPassword resignFirstResponder];
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    
    CGRect tScreenBounds = [[UIScreen mainScreen] bounds];
    
    
    [UIView animateWithDuration:0.3 animations:^(void){
        bgScrollView.frame = CGRectMake(0, 0, 320,tScreenBounds.size.height - 200);
        
    }];
        
         bgScrollView.alwaysBounceVertical = YES;
   

   
    if (textField == mobilTextField) {
        [UIView animateWithDuration:0.3 animations:^(void){
            
//        [bgScrollView setContentOffset:CGPointMake(0, 70)];
//            bgScrollView.frame = CGRectMake(0, -60, 320, 1000);
            
        }];
    }
    
    if (textField == verificationWord) {
        [UIView animateWithDuration:0.3 animations:^(void){
            [bgScrollView setContentOffset:CGPointMake(0, 120)];
//             bgScrollView.frame = CGRectMake(0, -100, 320, 1000);
            
        }];
       
    }
    if (textField == password) {
        [UIView animateWithDuration:0.3 animations:^(void){
            [bgScrollView setContentOffset:CGPointMake(0, 140)];
//            bgScrollView.frame = CGRectMake(0, -140, 320, 1000);
            
        }];
      
    }
    if (textField == repeatPassword) {
        [UIView animateWithDuration:0.3 animations:^(void){
            [bgScrollView setContentOffset:CGPointMake(0, 180)];
//            bgScrollView.frame = CGRectMake(0, -180, 320, 1000);
            
        }];
     
    }
    
    [mKeyboardBar showBar:textField];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    
  
    if([password isFirstResponder]){
 
        [repeatPassword becomeFirstResponder];
    
    }else{
    
        [self doneButton];
    }
    
    return YES;
}


-(void)viewWillDisappear:(BOOL)animated
{
    [timer invalidate];
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
