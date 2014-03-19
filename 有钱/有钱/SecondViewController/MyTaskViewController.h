//
//  MyTaskViewController.h
//  有钱
//
//  Created by Moguilay on 14-2-28.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "BaseViewController.h"

@interface MyTaskViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource,EGORefreshTableHeaderDelegate>
{
    
    UITableView *myTaskTableView;
    UITableView *finishedTaskTableView;
    
    
    
    EGORefreshTableHeaderView *_refreshHeaderView;//下拉刷新
    BOOL _reloading;//判断刷新状态
    UITabBarItem* theItem ;
    
    
}


- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;
@end
