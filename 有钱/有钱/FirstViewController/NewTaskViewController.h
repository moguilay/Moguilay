//
//  NewTaskViewController.h
//  moguilay
//
//  Created by Moguilay on 14-2-27.
//  Copyright (c) 2014年 Moguilay. All rights reserved.
//

#import "BaseViewController.h"
#import "NewTaskViewCell.h"
#import "LogInViewController.h"
#import "DMScrollingTicker.h"


@interface NewTaskViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate,EGORefreshTableHeaderDelegate>
{
    UITableView *newTaskTableView;

    NSTimer *timer;
    NSArray *messageArray;
    UILabel *adsLabel;
    int second;
    CGRect frame;
    
    
    
    DMScrollingTicker *scrollingTicker;
    NSMutableArray *l;
    
    
    EGORefreshTableHeaderView *_refreshHeaderView;//下拉刷新
    BOOL _reloading;//判断刷新状态
    
    
    
    
    
  
}



- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;

@end
