//
//  PersonalMessageViewController.h
//  moguilay
//
//  Created by Moguilay on 14-2-27.
//  Copyright (c) 2014年 Moguilay. All rights reserved.
//

#import "BaseViewController.h"

@interface PersonalMessageViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *personalMessageTableView;
    

}
@end
