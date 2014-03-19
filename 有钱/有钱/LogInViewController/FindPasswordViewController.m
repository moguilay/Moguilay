//
//  FindPasswordViewController.m
//  有钱
//
//  Created by Moguilay on 14-3-5.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "FindPasswordViewController.h"

@interface FindPasswordViewController ()

@end

@implementation FindPasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        
        
        //返回上一页面的按钮
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        backButton.backgroundColor = [UIColor blueColor];
        backButton.frame = CGRectMake(0, 40, 50, 50);
        [backButton setTitle:@"BACK" forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(backButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:backButton];
    }
    return self;
}
-(void)backButton{
    
    [self dismissViewControllerAnimated:YES completion:^(void){
        
    }];
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
