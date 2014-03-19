//
//  BaseViewController.m
//  Wodm2.1
//
//  Created by lusnaow on 13-3-13.
//  Copyright (c) 2013年 ZodiacSoft. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"
//#import "GlobleFunction.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.view.backgroundColor = [UIColor whiteColor];
        
        //设置UItabBarItem字体颜色
        [[ UITabBarItem appearance ] setTitleTextAttributes :@{  NSForegroundColorAttributeName  :  [ UIColor grayColor ]  }
                                                   forState : UIControlStateNormal ];
        [[ UITabBarItem appearance ] setTitleTextAttributes :@{  NSForegroundColorAttributeName  :  [ UIColor redColor ]  }
                                                   forState : UIControlStateHighlighted ];
        
        
        
        
        
//        ［UITabBar appearance] setTintColor:[UIColor colorWithRed:0.0
//                                                           green:176.0/255.0 blue:226.0/255.0 alpha:1.0］;
        
        
        [[UITabBar appearance]setTintColor:[UIColor redColor]];

        
        
        [[UINavigationBar appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName  :  [ UIColor darkGrayColor ] }];
        
        
        
        
        
        
        
        //设置UInavigationBar 返回按钮字体了颜色
        [[UINavigationBar appearance] setTintColor:[UIColor darkGrayColor]];
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
        [self.navigationItem setBackBarButtonItem:backItem];
        
        
        
        
        
        
        
        
        // Custom initialization
//        
//        mCommBG=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480+(isIphone5?88:0))];
//        [mCommBG setImage:[UIImage imageNamed:[GlobleFunction getNewResourcePath:@"main_bg.png"]]];
//        [self.view addSubview:mCommBG];
//        
//        titleImage=[[UIImageView alloc] initWithFrame:CGRectMake(112, 7, 95,29)];
//        [self.view addSubview:titleImage];
//
//        
//        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
//        
//        backView.backgroundColor = [UIColor blueColor];
//        [self.view addSubview:backView];
//
//        
//       
//        nameLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 8, 320, 44)];
//        [nameLabel setTextColor:[UIColor blackColor]];
//        [nameLabel setBackgroundColor:[UIColor clearColor]];
//        [nameLabel setFont:[UIFont boldSystemFontOfSize:20]];
//        [nameLabel setTextAlignment:1];
//         nameLabel.text = @"My App";
//        [backView addSubview:nameLabel];
        
//        singletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
//        [singletap setNumberOfTapsRequired:1];
//        singletap.delegate = self;
//        [self.view addGestureRecognizer:singletap];

        
        
        //跑马灯测试数据
//        messageArray = [NSArray arrayWithObjects:@"北京千乘信息科技有限公司!",@"新的任务上线啦!",@"有钱可以赚就在有钱App!", nil];
//        scrollingTicker = [[DMScrollingTicker alloc] initWithFrame:CGRectMake(0, 44 + 20, 320, 20)];
//        scrollingTicker.backgroundColor = [UIColor whiteColor];
//        scrollingTicker.tintColor = [UIColor redColor];
//        [self.view addSubview:scrollingTicker];
//        [self makeRunLabel];
    
    }
    return self;
}
-(void)setRunLabel{
    
//    scrollingTicker = [[DMScrollingTicker alloc] initWithFrame:CGRectMake(0, 44 + 20, 320, 20)];
//    scrollingTicker.backgroundColor = [UIColor whiteColor];
//    scrollingTicker.tintColor = [UIColor redColor];
//    [self.view addSubview:scrollingTicker];
//    [self makeRunLabel];
  
    
}

//-(void)makeRunLabel{
//
//    scrollTickerMutableArray = [[NSMutableArray alloc] init];
//    NSMutableArray *sizes = [[NSMutableArray alloc] init];
//    for (NSUInteger k = 0; k < messageArray.count; k++) {
//        LPScrollingTickerLabelItem *label = [[LPScrollingTickerLabelItem alloc] initWithTitle:@"通知:"
//                                                                                  description:[NSString stringWithFormat:@"%@",[messageArray objectAtIndex:k]]];
//        [label layoutSubviews];
//        [sizes addObject:[NSValue valueWithCGSize:label.frame.size]];
//        [scrollTickerMutableArray addObject:label];
//    }
//    
//    
//    [scrollingTicker beginAnimationWithViews:scrollTickerMutableArray
//                                   direction:LPScrollingDirection_FromRight
//                                       speed:0
//                                       loops:10000000
//                                completition:^(NSUInteger loopsDone, BOOL isFinished) {
//                                }];
//}
-(void)setViewTitle:(NSString*)mTitle{
     [nameLabel setText:mTitle];
    self.navigationItem.title=mTitle;
}
-(void)ShowHomeBtn{
//    UIButton *news_user =[UIButton buttonWithType:UIButtonTypeCustom];
//    [news_user setFrame:CGRectMake(10, 4, 37, 37)];
//    [news_user addTarget:self action:@selector(homeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [news_user setImage:[UIImage imageNamed:[GlobleFunction getNewResourcePath:@"BackHomeBtnN"]] forState:UIControlStateNormal];
//    [news_user setImage:[UIImage imageNamed:[GlobleFunction getNewResourcePath:@"BackHomeBtnH"]] forState:UIControlStateHighlighted];
//    [self.view addSubview:news_user];
}
-(void)homeBtnClick:(id)sender{
//    [GlobleFunction playButtonSound];
//
//    [[AppDelegate GetAppDelegate] BackToHomeView];
    //[self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)ShowLeftBackBtn{
//    UIButton *news_user =[UIButton buttonWithType:UIButtonTypeCustom];
//    [news_user setFrame:CGRectMake(10, 4, 37, 37)];
//    [news_user addTarget:self action:@selector(leftBackBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [news_user setImage:[UIImage imageNamed:[GlobleFunction getNewResourcePath:@"BackBtn"]] forState:UIControlStateNormal];
//    [news_user setImage:[UIImage imageNamed:[GlobleFunction getNewResourcePath:@"BackBtnH"]] forState:UIControlStateHighlighted];
//    [self.view addSubview:news_user];
}
-(void)ShowRightBackBtn{
//    UIButton *news_user =[UIButton buttonWithType:UIButtonTypeCustom];
//    [news_user setFrame:CGRectMake(273, 4, 37, 37)];
//    [news_user addTarget:self action:@selector(leftBackBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [news_user setImage:[UIImage imageNamed:[GlobleFunction getNewResourcePath:@"BackBtn"]] forState:UIControlStateNormal];
//    [news_user setImage:[UIImage imageNamed:[GlobleFunction getNewResourcePath:@"BackBtnH"]] forState:UIControlStateHighlighted];
//    [self.view addSubview:news_user];
}
-(void)leftBackBtnClick:(id)sender{
//    [GlobleFunction playButtonSound];
//
//    [self.navigationController popViewControllerAnimated:YES];
}

-(void)ShowSearchBtn{
//    UIView* leftBarBtnView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 58, 33)];
//    UIButton *news_user =[UIButton buttonWithType:UIButtonTypeCustom];
//    [news_user setFrame:CGRectMake(0, 0, 58, 33)];
//    [news_user addTarget:self action:@selector(searchBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [news_user setImage:[UIImage imageNamed:[GlobleFunction getNewResourcePath:@"searchResultBtn.png"]] forState:UIControlStateNormal];
//    [leftBarBtnView addSubview:news_user];
//    
//    UIBarButtonItem* someBarButtonItem= [[UIBarButtonItem alloc] initWithCustomView:leftBarBtnView];
//    self.navigationItem.rightBarButtonItem=someBarButtonItem;
}
-(void)searchBtnClick:(id)sender{

}

//- (void)handleSingleTap:(UITapGestureRecognizer *) gestureRecognizer{
//    [[AppDelegate GetAppDelegate] HiddenTabBar];
//}
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
