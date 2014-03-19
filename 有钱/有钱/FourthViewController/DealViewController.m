//
//  DealViewController.m
//  有钱
//
//  Created by Moguilay on 14-3-4.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "DealViewController.h"

@interface DealViewController ()

@end

@implementation DealViewController
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
////        self.view.backgroundColor = [UIColor whiteColor];
//        
//    }
//    return self;
//}
-(id)initWithTitleName:(NSString *)titleName andButtonName:(NSString *)buttonName andWhichOne:(int) whichOne{
     self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = titleName;
        //用户选择钱数
        moneyArray = [NSArray arrayWithObjects:@"20元",@"30元",@"50元",@"100元",@"200元",@"300元",@"400元",@"500元",nil];
      
        
        //账户余额
        UILabel *accountBalanceLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 90, 300, 54)];
        accountBalanceLabel.textColor = [UIColor blackColor];
        accountBalanceLabel.font = [UIFont boldSystemFontOfSize:20.0f];
        accountBalanceLabel.text = [NSString stringWithFormat:@"账户余额:%@",[GlobleFunction getUserCredit]];
        [self.view addSubview:accountBalanceLabel];
        
        
        
        UILabel *nameTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 140, 300, 54)];
        nameTitleLabel.textColor = [UIColor blackColor];
        nameTitleLabel.font = [UIFont boldSystemFontOfSize:20.0f];
        [self.view addSubview:nameTitleLabel];
        
        //支付宝或者充值按钮
//        UIButton *theButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        theButton.frame = CGRectMake(20, 360, 280, 60);
//        theButton.backgroundColor = [UIColor blueColor];
//        [theButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        
//        [theButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:theButton];
//        ReButton *theButton = [[ReButton  alloc]initWithFrame:CGRectMake(20, 300, 280, 60) andTitle:buttonName andTitleColor:[UIColor whiteColor] andTitleFont:[UIFont systemFontOfSize: 20]];
        
        
        
        UIButton *redButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        redButton.backgroundColor = [UIColor redColor];
        redButton.frame = CGRectMake(120, 300, 80, 80);
        redButton.layer.borderWidth = 1;
        redButton.layer.borderColor = [UIColor redColor].CGColor;
        redButton.layer.cornerRadius = 40;
        redButton.layer.masksToBounds = YES;
        [redButton setTitle:buttonName forState:UIControlStateNormal];
        [redButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
        [redButton setTitle:buttonName forState:UIControlStateHighlighted];
//        [redButton setImage:[UIImage imageNamed:@"redButton"] forState:UIControlStateNormal];
        [self.view addSubview:redButton];
        [redButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
//        UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        btn1.frame = CGRectMake(150, 350, 60, 60);
//        
//        [btn1 setTitle:@"启动" forState:UIControlStateNormal];
//        btn1.layer.borderWidth = 1;
//        btn1.layer.borderColor = [UIColor greenColor].CGColor;
//        btn1.layer.cornerRadius = 30;
//        btn1.layer.masksToBounds = YES;
//        [btn1 setTitleColor:[UIColor greenColor]forState:UIControlStateNormal];
//        [self.view addSubview:btn1];
        
        
        
        
        //提款或者充值的钱数
        
        myTextField = [[UITextField alloc]initWithFrame:CGRectMake(30, 200, 263, 54)];
        myTextField.backgroundColor = [UIColor whiteColor];
        myTextField.placeholder = @"请选择钱数";
        myTextField.borderStyle = UITextBorderStyleRoundedRect;
//        [myTextField setKeyboardType:UIKeyboardTypeNumberPad];
        myTextField.font = [UIFont fontWithName:@"helvetica" size:20.0];
        myTextField.clearButtonMode = UITextFieldViewModeWhileEditing;//一键删除
        myTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对其的方式
//        myTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
//        myTextField.returnKeyType = UIReturnKeyNext;
        [self.view addSubview:myTextField];
//        myTextField.clearsOnBeginEditing = YES;//重新重新输入时候清空
        myTextField.delegate = self;
        
        
        
        if (whichOne == 1) {
            nameTitleLabel.text = [NSString stringWithFormat:@"支付宝账号:%@",[GlobleFunction getUserZhiFuBaoAccount]];
//
            
            
            
        }else{
        
            nameTitleLabel.text = [NSString stringWithFormat:@"手机号码:%@",[GlobleFunction getUserMobileNumber]];;
//
        }
        
        
        backView = [[UIView alloc]initWithFrame:CGRectMake(-10, 1000, 330, 300)];
        backView.layer.borderWidth = 1;
        backView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        backView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:backView];
               //选择钱数
        moneyPickerView = [[UIPickerView alloc]init];
        moneyPickerView.frame = CGRectMake(10, 0, 320, 300);
        moneyPickerView.backgroundColor = [UIColor whiteColor];
        [backView addSubview:moneyPickerView];
        moneyPickerView.delegate = self;
        moneyPickerView.dataSource = self;
        moneyPickerView.showsSelectionIndicator = YES;
        
        
        UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        doneButton.backgroundColor = [UIColor clearColor];
        doneButton.frame = CGRectMake(240, 0, 90, 50);
        [doneButton setTitle:@"完成" forState:UIControlStateNormal];
        [doneButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [backView addSubview:doneButton];
        [doneButton addTarget:self action:@selector(doenButtonClick) forControlEvents:UIControlEventTouchUpInside];

        
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        cancelButton.backgroundColor = [UIColor clearColor];
        cancelButton.frame = CGRectMake(10, 0, 90, 50);
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [backView addSubview:cancelButton];
        [cancelButton addTarget:self action:@selector(doenButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}


-(void)doenButtonClick{
    //完成按钮点击后
    [UIView animateWithDuration:1 animations:^(void){
        
        backView.frame = CGRectMake(-10, 1000, 330, 300);
        
    }];
    
}
//-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
//{
//    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 300, 320, 200)];
//    return v;
//}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    myTextField.text = [moneyArray objectAtIndex:row];
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [moneyArray objectAtIndex:row];
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 320;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return [moneyArray count];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
 [myTextField resignFirstResponder];
    [UIView animateWithDuration:0.6 animations:^(void){
    
     backView.frame = CGRectMake(-10, 260, 330, 300);
    NSInteger row = [moneyPickerView selectedRowInComponent:0];
    textField.text = [moneyArray objectAtIndex:row];
    
    }];
    
   
    
//    
//    
  
}
//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    
//    
//    
//    NSLog(@"----------------");
////    if ([textField isFirstResponder]) {
////        [myTextField becomeFirstResponder];
////    }
//    
//    
//    //    if ([textField isFirstResponder]) {
//    //        [mobilTextField becomeFirstResponder];
//    //    }else
////    if([password isFirstResponder]){
////        //监测用户手机号码和密码是否正确
////        //        [self loginMainVC];
////        //        [self performSelector:@selector(checkEmailAndPassword:)];
////    }
////    
//    return YES;
//}



//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [myTextField resignFirstResponder];
//    [UIView animateWithDuration:1 animations:^(void){
//        
//        backView.frame = CGRectMake(0, 1000, 320, 300);
//        
//    }];
//    
//}


//支付按钮或者充值按钮点击调用方法
-(void)buttonClick:(UIButton *)sender{

    
    NSLog(@"_____--------------%@", myTextField.text);
    
    
    
    
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
