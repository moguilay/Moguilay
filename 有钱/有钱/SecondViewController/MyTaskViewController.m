//
//  MyTaskViewController.m
//  有钱
//
//  Created by Moguilay on 14-2-28.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "MyTaskViewController.h"
#import "MyTaskViewCell.h"
#import "DoTaskViewController.h"
@interface MyTaskViewController ()

@end

@implementation MyTaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        self.title = @"我的任务";
        [self setViewTitle:@"我的任务"];
//        self.view.backgroundColor = [UIColor orangeColor];
        
        UIImage* nomalImage = [UIImage imageNamed:@"mytaskGray"];
        theItem = [[UITabBarItem alloc]init];
        [theItem setBadgeValue:@"6"];
        

        [theItem setTitle:@"我的任务"];
        [theItem setImage:nomalImage];
        self.tabBarItem = theItem;
        
        //EEB1C3C6-FA4A-462B-BFF3-91CD91279E0D
        
        //我的任务的未完成任务tableView
        myTaskTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44 + 20 + 33, 320, 4 * 80 + 15 + (isIphone5 ? 88 : 0)) style:UITableViewStylePlain];
        myTaskTableView.delegate = self;
        myTaskTableView.dataSource = self;
        myTaskTableView.backgroundColor = [UIColor clearColor];
        
        //        newTaskTableView.separatorStyle = UITableViewCellAccessoryNone;
        myTaskTableView.userInteractionEnabled = YES;
        myTaskTableView.showsHorizontalScrollIndicator = NO;
        myTaskTableView.showsVerticalScrollIndicator = NO;
//        myTaskTableView.hidden = YES;
        [self.view addSubview:myTaskTableView];
        
        
        
        

        
        
        
        //我的任务的已完成任务tableView
        
        finishedTaskTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44 + 20 + 33, 320, 4 * 80 + 15 + (isIphone5 ? 88 : 0)) style:UITableViewStylePlain];
        finishedTaskTableView.delegate = self;
        finishedTaskTableView.dataSource = self;
        finishedTaskTableView.backgroundColor = [UIColor clearColor];
        //        newTaskTableView.separatorStyle = UITableViewCellAccessoryNone;
        finishedTaskTableView.userInteractionEnabled = YES;
        finishedTaskTableView.showsHorizontalScrollIndicator = NO;
        finishedTaskTableView.showsVerticalScrollIndicator = NO;
        finishedTaskTableView.hidden = YES;
        
        [self.view addSubview:finishedTaskTableView];
        
        
        
        
        
        //添加下拉刷新
        if (_refreshHeaderView == nil) {
            
            EGORefreshTableHeaderView *egoRefrshview = [[EGORefreshTableHeaderView alloc] initWithFrame:myTaskTableView.frame];
            egoRefrshview.delegate = self;
            [self.view insertSubview:egoRefrshview belowSubview:myTaskTableView];
            _refreshHeaderView = egoRefrshview;
            
            
        }
        [_refreshHeaderView refreshLastUpdatedDate];
        
        
        
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 44+20, 320, 33)];
        backView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:backView];
        
        
        
        //完成任务  未完成任务切换
        UISegmentedControl *mySegmentes = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"未完成任务",@"已完成任务", nil]];
        mySegmentes.frame = CGRectMake(10, 1.5f, 300, 30);
        mySegmentes.selectedSegmentIndex = 0;
        mySegmentes.tintColor = [UIColor redColor];//1500727605  Ct630786811
        [mySegmentes addTarget:self
                             action:@selector(segmentAction:)
                   forControlEvents:UIControlEventValueChanged];
        [backView addSubview:mySegmentes];
      

    }
    return self;
}
//缴费账号   B23671383    账号 01011211778   密码 417252

-(void)segmentAction:(UISegmentedControl *)Seg
{
    NSInteger index = Seg.selectedSegmentIndex;
    switch (index) {
        case 0:
            //未完成任务
            myTaskTableView.hidden = NO;
            _refreshHeaderView.hidden = NO;
            finishedTaskTableView.hidden = YES;
            
            
            break;
        case 1:
           //已完成任务
            myTaskTableView.hidden = YES;
            _refreshHeaderView.hidden = YES;
            finishedTaskTableView.hidden = NO;
            
            
            break;
        default:
            break;
    }
}



// EGO代理

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}




#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_reloading = YES;
	
}

- (void)doneLoadingTableViewData{
	
	//  model should call this when its done loading
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:myTaskTableView];
	
}


#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (scrollView == myTaskTableView) {
         [_refreshHeaderView egoRefreshScrollViewWillBeginScroll:scrollView];
    }
   
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == myTaskTableView) {
        	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    }
	

    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    
    if (scrollView == myTaskTableView) {
        [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    }
	
	
	
}


#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	[self reloadTableViewDataSource];
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
	
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}


//UItabelViewCell的设计
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == myTaskTableView) {
        
        
        
        
        
        
        
    }else if(tableView == finishedTaskTableView){

    }
    
    
    MyTaskViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[MyTaskViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
   
    return cell;
    
    
}
//tabelView 的列数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
//mei列的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == myTaskTableView) {
        //跳转到DoTaskVC 做任务
        DoTaskViewController *doTaskVC = [[DoTaskViewController alloc]init];
        //    [self presentViewController:doTaskVC animated:YES completion:^(void){
        //
        //    }];
        [self.navigationController pushViewController:doTaskVC animated:YES];

        
    }
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
//    self.tabBarController.tabBar.hidden = NO;
}

-(void)viewDidDisappear:(BOOL)animated
{
    [theItem setBadgeValue:nil];
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
