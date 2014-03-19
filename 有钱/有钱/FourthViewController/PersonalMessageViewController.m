//
//  PersonalMessageViewController.m
//  moguilay
//
//  Created by Moguilay on 14-2-27.
//  Copyright (c) 2014年 Moguilay. All rights reserved.
//

#import "PersonalMessageViewController.h"
#import "PersonalMessageCell.h"
#import "AlipayViewController.h"
#import "ChangePasswordViewController.h"

@interface PersonalMessageViewController ()

@end

@implementation PersonalMessageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        [self setViewTitle:@"账户设置"];
//        self.view.backgroundColor = [UIColor orangeColor];

        
        //设置tableView
        CGRect heightRect =[[UIScreen mainScreen] bounds];
        personalMessageTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -34, 320, heightRect.size.height) style:UITableViewStyleGrouped];
//        personalMessageTableView.frame = [[UIScreen mainScreen] bounds];
        personalMessageTableView.delegate = self;
        personalMessageTableView.dataSource = self;
        personalMessageTableView.showsVerticalScrollIndicator = NO;
        //        newTaskTableView.backgroundColor = [UIColor clearColor];
        //        newTaskTableView.separatorStyle = UITableViewCellAccessoryNone;
        //        appiconTableView.userInteractionEnabled = YES;
        [self.view addSubview:personalMessageTableView];
        
        

    }
    return self;
}




//UItabelViewCell的设计
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    PersonalMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[PersonalMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        //        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.personalMessageLabel.text = @"支付宝账号:";
        
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.personalMessageLabel.text = @"密码修改";
    }
   
    return cell;
    
    
}

//几段
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
//tabelView 的列数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else{
    
        return 0;
    }
    
    //    return 20;
}
//mei列的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 50.0f;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        //跳转到修改支付宝账号的位置
        AlipayViewController *alipayVC = [[AlipayViewController alloc]init];
        [self.navigationController pushViewController:alipayVC animated:YES];
        
    }
    if (indexPath.row == 1) {
        //跳转到修改密码的界面
        ChangePasswordViewController *changePasswordVC = [[ChangePasswordViewController alloc]init];
        [self.navigationController pushViewController:changePasswordVC animated:YES];
        
    }
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
  
        
//        self.tabBarController.tabBar.hidden = YES;
    
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
