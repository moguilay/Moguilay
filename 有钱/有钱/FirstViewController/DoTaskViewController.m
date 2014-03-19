//
//  DoTaskViewController.m
//  moguilay
//
//  Created by Moguilay on 14-2-27.
//  Copyright (c) 2014年 Moguilay. All rights reserved.
//

#import "DoTaskViewController.h"
#import "PullPicDoneViewController.h"
@interface DoTaskViewController ()

@end

@implementation DoTaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
        // Custom initialization
//        self.view.backgroundColor = [UIColor orangeColor];
      self.title = @"做任务";
//        [self setViewTitle:@"下载安装"];
        doTaskNav = [[UINavigationController alloc]initWithRootViewController:self];

        
        UIButton *goNextButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        goNextButton.backgroundColor = [UIColor blueColor];
        goNextButton.frame = CGRectMake(0, 200, 320, 40);
        [goNextButton setTitle:@"下载安装" forState:UIControlStateNormal];
        [goNextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [goNextButton addTarget:self action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:goNextButton];
        
        
        
    }
    return self;
}

//下一页
-(void)nextPage:(UIButton *)sender{
   
    //跳转到DoTaskVC 做任务s
   
    PullPicDoneViewController *pullPicVC = [[PullPicDoneViewController alloc]init];
    [self.navigationController pushViewController:pullPicVC animated:YES];
//    [self presentViewController:pullPicVC animated:YES completion:^(void){
//       
//    }];
//      self.tabBarController.tabBar.hidden = YES;
   
    
}



-(void)viewWillAppear:(BOOL)animated
{
//    self.tabBarController.tabBar.hidden = YES;
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
