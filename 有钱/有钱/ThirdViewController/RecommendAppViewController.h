//
//  RecommendAppViewController.h
//  moguilay
//
//  Created by Moguilay on 14-2-27.
//  Copyright (c) 2014年 Moguilay. All rights reserved.
//

#import "BaseViewController.h"
#import "RecommendDownload.h"
@interface RecommendAppViewController : BaseViewController<UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,SKStoreProductViewControllerDelegate>
{
//    UITableView *appiconTableView;
    UICollectionView *appIconCollectionView;


    RecommendDownload* recommendEngine;// 获取推荐列表网络引擎
    MKNetworkOperation* recommendOP;
    
    
    
    NSMutableArray *dataListArray;
    
    
     SKStoreProductViewController *storeProductViewController;//appstore

}

@end
