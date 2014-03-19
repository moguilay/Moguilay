//
//  PersonalCenterViewController.m
//  moguilay
//
//  Created by Moguilay on 14-2-27.
//  Copyright (c) 2014年 Moguilay. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "PersonalCenterCell.h"
#import "PersonalMessageViewController.h"
#import "AboutUsViewController.h"
#import "DealViewController.h"
//#import "LogInViewController.h"
//#import "RegisterViewController.h"


#import "DBUserMessage.h"
@interface PersonalCenterViewController ()

@end

@implementation PersonalCenterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        isUMViewAppear = NO;
        // Custom initialization
        self.title = @"个人中心";
        [self setViewTitle:@"个人中心"];
        UIImage* nomalImage = [UIImage imageNamed:@"personalGray"];
        UITabBarItem* theItem = [[UITabBarItem alloc]init];
        [theItem setTitle:@"个人中心"];
        [theItem setImage:nomalImage];
        self.tabBarItem = theItem;

//        shareBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        shareBtn.frame = CGRectMake(260, 60, 50, 20);
//        shareBtn.backgroundColor =[UIColor grayColor];
//        [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
//        [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [shareBtn addTarget:self action:@selector(shareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//
//        
        
        
        
       
        
        
        //个人用户
        CGRect heightRect =[[UIScreen mainScreen] bounds];
        personalCenterTableView.frame =  [[UIScreen mainScreen] bounds];
        personalCenterTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -34, 320, heightRect.size.height) style:UITableViewStyleGrouped];
//        personalCenterTableView.frame =  [[UIScreen mainScreen] bounds];
//        personalCenterTableView.backgroundColor = [UIColor clearColor];
        personalCenterTableView.delegate = self;
        personalCenterTableView.dataSource = self;
//        [personalCenterTableView setSeparatorInset:UIEdgeInsetsZero];
        //        newTaskTableView.backgroundColor = [UIColor clearColor];
        //        newTaskTableView.separatorStyle = UITableViewCellAccessoryNone;
//        appiconTableView.userInteractionEnabled = YES;
        personalCenterTableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:personalCenterTableView];

    
        //退出登录按钮
        logOutbutton = [[ReButton  alloc]initWithFrame:CGRectMake(10, 0, 300, 50) andTitle:@"退出登录" andTitleColor:[UIColor whiteColor] andTitleFont:[UIFont systemFontOfSize: 20]];
        logOutbutton.backgroundColor = [UIColor redColor];
//        [self.view addSubview:logOutbutton];
        [logOutbutton addTarget:self action:@selector(logOutBtnClick:) forControlEvents:UIControlEventTouchUpInside];

        
        
        
        
//        logInButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        logInButton.backgroundColor = [UIColor blackColor];
//        [logInButton setTintColor:[UIColor blackColor]];
//        logInButton.frame = CGRectMake(10, 210, 300, 30);
//        [logInButton setTitle:@"登录" forState:UIControlStateNormal];
//        [logInButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//        [logInButton addTarget:self action:@selector(logInBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:logInButton];
//        logInButton.hidden = YES;
//        
//        [UMSocialSnsService presentSnsIconSheetView:self appKey:UMSOCIALKEY shareText:@"" shareImage:[UIImage imageNamed:@"icon.png"] shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQzone,UMShareToQQ,nil] delegate:nil];
//
//        NSLog(@"%@", self.view.subviews);
//
//        [UMSocialShakeService setShakeToShareWithTypes:nil
//                                             shareText:nil
//                                          screenShoter:nil
//                                      inViewController:self
//                                              delegate:self];
        
        
        
        
//
        
//        [UMSocialShakeService unShakeToSns];
        
        
//        UMSocialShakeService setShakeToShareWithTypes:<#(NSArray *)#> shareText:<#(NSString *)#> screenShoter:<#(UMSocialScreenShoter *)#> inViewController:<#(UIViewController *)#> delegate:<#(id<UMSocialShakeDelegate>)#>
        
       
        
      
    }
    return self;
}


-(void)didCloseShakeView{
    
}


-(void)didCloseUIViewController:(UMSViewControllerType)fromViewControllerType
{
    //设置UM的View是否收回
    isUMViewAppear = NO;
    
    
}

-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response{



}
-(UMSocialShakeConfig)didShakeWithShakeConfig
{

//    //下面返回值控制是否显示分享编辑页面、是否显示截图、是否有音效，UMSocialShakeConfigNone表示都不显示
    
    
    
    
    
//    
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:UMSOCIALKEY
                                      shareText:@"有钱"
                                     shareImage:[UIImage imageNamed:@"Icon"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQzone,UMShareToQQ,nil]
                                       delegate:nil];
    



    return UMSocialShakeConfigDefault;
   

    

//    return UMSocialShakeConfigShowShareEdit;
    
    
    
    
 
    
}


//点击分享按钮分享
-(void)shareBtnClick:(UIButton *)sender{
//    [UMSocialSnsService presentSnsIconSheetView:self
//                                         appKey:UMSOCIALKEY
//                                      shareText:@"你要分享的文字"
//                                     shareImage:[UIImage imageNamed:@"icon.png"]
//                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQzone,UMShareToQQ,nil]
//                                       delegate:nil];


    
}
-(void)logInBtnClick:(UIButton *)sender{

//    NSLog(@"登录");
//    personalCenterTableView.hidden = NO;
//    logInButton.hidden = YES;
}
//退出登录按钮点击动作
-(void)logOutBtnClick:(UIButton *)sender{
    
    
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"退出当前用户" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [sheet showInView:self.view];

   
  
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex ==0) {
         [self turnToLogInViewController];
    }else{
        return;
        
    }
    
    
}
-(void)turnToLogInViewController{
    
    LogInViewController *logInVC = [[LogInViewController alloc]init];
    [self presentViewController:logInVC animated:YES completion:^(void){
  
    }];
    
}




//UItabelViewCell的设计
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    PersonalCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[PersonalCenterCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section == 0) {
//         [cell.contentView addSubview:shareBtn];
        UIImageView *headBGImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
        headBGImageView.image = [UIImage imageNamed:@"headBGImage"];
//        UIImageView *headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(60, 20, 60, 60)];
//        headImageView.image = [UIImage imageNamed:@"userHeadImage"];
//        [headBGImageView addSubview:headImageView];
        
        UILabel *credit = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 320, 100)];
        credit.textColor = [UIColor whiteColor];
        credit.backgroundColor = [UIColor clearColor];
        credit.font = [UIFont boldSystemFontOfSize:30];
        credit.textAlignment = NSTextAlignmentCenter;
        credit.text = [NSString stringWithFormat:@"积分:%@",[GlobleFunction getUserCredit]];
        [headBGImageView addSubview:credit];
        
        
        [cell.contentView addSubview:headBGImageView];
        
//        cell.frame = CGRectMake(0, 0, 320, 100);
        
        cell.personalMessageLabel.frame =CGRectMake(220, 55, 300, 80);
        cell.personalMessageLabel.font = [UIFont boldSystemFontOfSize:18.0f];
         cell.personalMessageLabel.text = @"摇一摇分享";
        cell.personalMessageLabel.textColor = [UIColor whiteColor];
    }
    if (indexPath.section == 1 && indexPath.row == 0) {
         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.personalMessageLabel.text = @"账户设置";
        cell.iconImageView.backgroundColor = [UIColor clearColor];
        cell.iconImageView.image = [UIImage imageNamed:@"personalMessage"];

//        cell.iconImageView.frame = CGRectMake(15, 15, 30, 30);
        
        
       
    }
    if (indexPath.section == 1 && indexPath.row == 1) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.personalMessageLabel.text = @"支付宝提现";
        cell.iconImageView.image = [UIImage imageNamed:@"payFor"];
    }
    if (indexPath.section == 1 && indexPath.row == 2) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.personalMessageLabel.text = @"话费充值";
        cell.iconImageView.image = [UIImage imageNamed:@"moilble"];
    }
    if (indexPath.section == 2 && indexPath.row == 1) {
         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
         cell.personalMessageLabel.text = @"关于我们";
        cell.iconImageView.image = [UIImage imageNamed:@"about"];
    }
    if (indexPath.section == 2 && indexPath.row == 0) {
        cell.personalMessageLabel.text = @"联系我们：QQ123457";
        cell.iconImageView.image = [UIImage imageNamed:@"contect"];
    }
    
    if (indexPath.section == 3) {
        cell.backgroundColor = [UIColor clearColor];
    
        
        [cell.contentView addSubview:logOutbutton];
        
        
        
    }
    return cell;
    
    
}



//几段
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;

}
//tabelView 的列数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if(section == 1){
        return 3;
        
    }else if (section == 2){
        return 2;
        
    }else{
    
        return 1;
    }
//    return 20;
}
//mei列的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 120.0f;
    }
    
  
    return 50.0f;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //根据不同Cell跳转到不同的界面
    if (indexPath.section == 1 && indexPath.row == 0) {
        
        
        PersonalMessageViewController *personalMessageVC = [[PersonalMessageViewController alloc]init];
        [self.navigationController pushViewController:personalMessageVC animated:YES];
        
        
    }
    
    
    
    if ((indexPath.section == 1 && indexPath.row == 1 )) {
        
        
        DealViewController *dealVC = [[DealViewController alloc]initWithTitleName:@"支付宝提现" andButtonName:@"立即提现" andWhichOne:1];
        
        
        
        if (![[GlobleFunction getUserZhiFuBaoAccount] isEqualToString:@""]) {
            [self.navigationController pushViewController:dealVC animated:YES];
        }else{
        
            [SVProgressHUD showErrorWithStatus:@"账户设置中先绑定支付宝"];
        }
    
        

        
        
    }
    
    if ((indexPath.section == 1 && indexPath.row == 2)) {
        DealViewController *dealVC = [[DealViewController alloc]initWithTitleName:@"手机充值" andButtonName:@"立即充值" andWhichOne:2];
        
        [self.navigationController pushViewController:dealVC animated:YES];

    }
    
    if (indexPath.section == 2 && indexPath.row == 1) {
    //跳入关于我们的VC
        
        AboutUsViewController *aboutUsVC = [[AboutUsViewController alloc]init];
        [self.navigationController pushViewController:aboutUsVC animated:YES];

        
        
        
    }
    
    
//    NSLog(@"跳转到Appstore");
    
    
}
//-(BOOL)canBecomeFirstResponder
//{
//    return YES;
//}
//-(void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    [self becomeFirstResponder];
//}
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
   
    if (motion == UIEventSubtypeMotionShake) {
     
       
        
        if (!isUMViewAppear) {
            [UMSocialSnsService presentSnsIconSheetView:self
                                                 appKey:UMSOCIALKEY
                                              shareText:@"马上有钱"
                                             shareImage:[UIImage imageNamed:@"icon.png"]
                                        shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQzone,UMShareToQQ,nil]
                                               delegate:self];
            isUMViewAppear = YES;

        }
        
        
        
        
         
        
        
       
        
    
        
        
      
        

    }
}



-(void)viewWillAppear:(BOOL)animated
{
    
//    self.tabBarController.tabBar.hidden = NO;
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
