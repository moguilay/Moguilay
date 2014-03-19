//
//  NewTaskViewController.m
//  moguilay
//
//  Created by Moguilay on 14-2-27.
//  Copyright (c) 2014年 Moguilay. All rights reserved.
//

#import "NewTaskViewController.h"
#import "DoTaskViewController.h"
#import "LogInViewController.h"

//#import "UMSocial.h"
@interface NewTaskViewController ()

@end

@implementation NewTaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  
    
    //IDFA：
    
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
     self.title = @"最新任务";

        
        //84B5AA20-077C-4417-8FC0-7B396261E40C
        NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
        NSLog(@"广告标示符^^^^^^^^^^^^^^^^^^^^^^adID==%@", adId);
        
        
        
        
        UIImage* nomalImage = [UIImage imageNamed:@"newTaskGray"];
        UITabBarItem* theItem = [[UITabBarItem alloc]init];
        [theItem setTitle:@"推荐任务"];
        [theItem setImage:nomalImage];
        self.tabBarItem = theItem;
        
//        
//        //设置tabbaritems
//        UITabBarItem *myItems = [[UITabBarItem alloc]init];
//        [myItems setImage:[UIImage imageNamed:@"newTaskGary"]];
//        [myItems setSelectedImage:[UIImage imageNamed:@"newTaskRed"]];
        
        
        
        
        
        
        
        //最新任务的tableView
        newTaskTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, 320, 4 * 92 + (isIphone5 ? 88 : 0)) style:UITableViewStylePlain];
//        newTaskTableView.frame = [[UIScreen mainScreen] bounds];
        newTaskTableView.delegate = self;
        newTaskTableView.dataSource = self;
        newTaskTableView.backgroundColor = [UIColor clearColor];
        newTaskTableView.showsVerticalScrollIndicator = NO;
//        newTaskTableView.separatorStyle = UITableViewCellAccessoryNone;
        newTaskTableView.userInteractionEnabled = YES;
        [self.view addSubview:newTaskTableView];
        
        //EGO
        if (_refreshHeaderView == nil) {
            
            EGORefreshTableHeaderView *egoRefrshview = [[EGORefreshTableHeaderView alloc] initWithFrame:newTaskTableView.frame];
            egoRefrshview.delegate = self;
            [self.view insertSubview:egoRefrshview belowSubview:newTaskTableView];
            _refreshHeaderView = egoRefrshview;
         
            
        }
        [_refreshHeaderView refreshLastUpdatedDate];
        
        //跑马灯测试数据
//        messageArray = [NSArray arrayWithObjects:@"北京千乘信息科技有限公司!",@"新的任务上线啦!",@"有钱可以赚就在有钱App!", nil];
//        UILabel *newMessageLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 44 + 20 , 30, 20)];
//        newMessageLabel.text = @"通知:";
//        newMessageLabel.font = [UIFont boldSystemFontOfSize:13.0f];
//        newMessageLabel.textColor = [UIColor darkGrayColor];
//        [self.view addSubview:newMessageLabel];
        
      //http:// news.163.com/     special/0001220O/news_json.js?0.7364316494204104
        
        
//        testEngine=[[TestDownLoad alloc] initWithHostName:SERVICE_BASE_ADDRESS];
//        testEngine=[[TestDownLoad alloc] initWithHostName:@"192.168.1.112:8080"];
        
//        [self getMessageNet];
        
    }
    return self;
}





-(void)getMessageNet{


//    testOP = [testEngine testSomeThing:@""];
//    testOP = [testEngine testGet];
    
//    
//    NSLog(@"%@", testOP);
//    [testOP addCompletionHandler:^(MKNetworkOperation *operation) {
////        NSLog(@"%@------------%@-------------", operation);
//        
//        
//        
//        
//        NSDictionary* JSON=[operation responseJSON];
//        NSDictionary* statusDic = [JSON objectForKey:@"status"];
//        NSLog(@"-----------%@",[statusDic objectForKey:@"message"]);
//        
//        
//        
//    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error)  {
//     
//        
//        DLog(@"%@", error);
//    }];
}


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
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:newTaskTableView];
	
}


#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_refreshHeaderView egoRefreshScrollViewWillBeginScroll:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
	
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
    
   
    
    NewTaskViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[NewTaskViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    if ( indexPath.row == 0) {
    
//        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 90)];
//        view.backgroundColor = [UIColor redColor];
//        [cell.contentView addSubview:view];
//        cell.backgroundColor = [UIColor redColor];
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
    return 80.0f;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //跳转到DoTaskVC 做任务
    DoTaskViewController *doTaskVC = [[DoTaskViewController alloc]init];
//    [self presentViewController:doTaskVC animated:YES completion:^(void){
//        
//    }];

    [self.navigationController pushViewController:doTaskVC animated:YES];
//    self.hidesBottomBarWhenPushed = YES;
    
//    [self.navigationController pushViewController:doTaskVC animated:YES];

    
}
//第一次加载到登录注册页面
-(void)turnToLogInViewController{

    LogInViewController *logInVC = [[LogInViewController alloc]init];
    [self presentViewController:logInVC animated:YES completion:^(void){

    }];
}





-(void)viewWillAppear:(BOOL)animated
{
//    [self turnToLogInViewController];
    
    
    if (![GlobleFunction isUserLoginOnce]) {
         [self turnToLogInViewController];
    }
    
    
    //跑马灯效果
//    scrollingTicker = [[DMScrollingTicker alloc] initWithFrame:CGRectMake(0, 44 + 20, 320, 20)];
//    scrollingTicker.backgroundColor = [UIColor whiteColor];
//    scrollingTicker.tintColor = [UIColor redColor];
//    [self.view addSubview:scrollingTicker];
//    l = [[NSMutableArray alloc] init];
//    NSMutableArray *sizes = [[NSMutableArray alloc] init];
//    for (NSUInteger k = 0; k < messageArray.count; k++) {
//        LPScrollingTickerLabelItem *label = [[LPScrollingTickerLabelItem alloc] initWithTitle:@"通知:"
//                                                                                  description:[NSString stringWithFormat:@"%@",[messageArray objectAtIndex:k]]];
//        [label layoutSubviews];
//        [sizes addObject:[NSValue valueWithCGSize:label.frame.size]];
//        [l addObject:label];
//    }
//    
//    
//    
//    [scrollingTicker beginAnimationWithViews:l
//                                   direction:LPScrollingDirection_FromRight
//                                       speed:0
//                                       loops:10000000
//                                completition:^(NSUInteger loopsDone, BOOL isFinished) {
//                                }];
    
    

}
-(void)viewWillDisappear:(BOOL)animated{
//[scrollingTicker pauseAnimation];
}

-(void)viewDidDisappear:(BOOL)animated
{


}
-(void)viewDidAppear:(BOOL)animated
{
    
    
  

}


-(void)dealloc
{
   
    
    
//    [timer invalidate];
    
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
