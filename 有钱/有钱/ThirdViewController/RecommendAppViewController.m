//
//  RecommendAppViewController.m
//  moguilay
//
//  Created by Moguilay on 14-2-27.
//  Copyright (c) 2014年 Moguilay. All rights reserved.
//

#import "RecommendAppViewController.h"
#import "RecommendAppCell.h"
#import "RecommendAppItems.h"

@interface RecommendAppViewController ()

@end

@implementation RecommendAppViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"推荐应用";
        
        dataListArray = [[NSMutableArray alloc]init];
    storeProductViewController = [[SKStoreProductViewController alloc] init];//初始化appstore
        storeProductViewController.delegate = self;//实现代理
        UIImage* nomalImage = [UIImage imageNamed:@"adviceAppGray"];
        UITabBarItem* theItem = [[UITabBarItem alloc]init];
        [theItem setTitle:@"推荐应用"];
        [theItem setImage:nomalImage];
        self.tabBarItem = theItem;
        
        
        
//        [self setViewTitle:@"推荐应用"];
//        self.view.backgroundColor = [UIColor orangeColor];

        
//        //App展示的列表
//        appiconTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 500) style:UITableViewStylePlain];
//        appiconTableView.delegate = self;
//        appiconTableView.dataSource = self;
//        //        newTaskTableView.backgroundColor = [UIColor clearColor];
//        //        newTaskTableView.separatorStyle = UITableViewCellAccessoryNone;
//        appiconTableView.userInteractionEnabled = YES;
//        [self.view addSubview:appiconTableView];

        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(65, 65);
       
//        layout.sectionInset = UIEdgeInsetsMake(10, 10, 30, 30);
        layout.sectionInset = UIEdgeInsetsMake(5, 10, 20, 10);
    
        layout.minimumInteritemSpacing = 10;
        layout.minimumLineSpacing = 10;
    
        appIconCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 320, 480 + (isIphone5 ? 88 : 0)) collectionViewLayout:layout];
        appIconCollectionView.backgroundColor = [UIColor clearColor];
        appIconCollectionView.showsVerticalScrollIndicator = NO;
        appIconCollectionView.alwaysBounceVertical = YES;
        [appIconCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ID"];
        appIconCollectionView.delegate = self;
        appIconCollectionView.dataSource = self;
        [self.view addSubview:appIconCollectionView];
    
        //网络部分   用户登录网络监测
        recommendEngine = [[RecommendDownload alloc]initWithHostName:SERVICE_BASE_ADDRESS];
        [self getDataFromNet];
        
    }
    return self;
}

-(void)getDataFromNet{
    
    //给服务器提供数据
    recommendOP = [recommendEngine publicWithPuBrePath:@"" andVersion:CURRENT_VERSION andPhoneNum:[GlobleFunction getUserMobileNumber] andAccount:@"" andPassWord:@"" andMessageCode:@"" andIP:[GlobleFunction getIPAddress] andIDFA:[GlobleFunction getIDFA] andAction:@"getrecommend"];
    
    [recommendOP addCompletionHandler:^(MKNetworkOperation *operation) {
        NSDictionary* JSON=[operation responseJSON];
        NSLog(@"%@", JSON);
        NSDictionary *statusDic = [JSON objectForKey:@"status"];
        NSString *code = [statusDic objectForKey:@"code"];
        if ([code isEqualToString:@"0"]) {
            NSArray *dataArray = [JSON objectForKey:@"data"];
            for (NSDictionary *dic in dataArray) {
                RecommendAppItems *recommendItems = [[RecommendAppItems alloc]init];
                recommendItems.appIdStr = [dic objectForKey:@"appId"];
                recommendItems.appleIdStr = [dic objectForKey:@"apple_id"];
                recommendItems.appleUrlStr = [dic objectForKey:@"apple_url"];
                recommendItems.appNameStr = [dic objectForKey:@"appName"];
                recommendItems.iconImageUrlStr = [dic objectForKey:@"appIcon"];
                recommendItems.idStr = [dic objectForKey:@"id"];
            
                [dataListArray addObject:recommendItems];
                
                [appIconCollectionView reloadData];
                
                
            }
        }else{
            //网络返回错误
        
        
        }
        
        
    
        
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error)  {
        
        //
        DLog(@"%@", error);
        
 
    }];
    
    
    
    
}




#pragma mark - collection数据源代理
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    if (dataListArray.count%4 == 0 ) {
        return dataListArray.count/4;
    }else{
    
        return dataListArray.count/4 + 1;
    
    }
    
    
    
//    return 5;

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    
    if (dataListArray.count % 4 == 0) {
        return 4;
    }else{
        if (section == dataListArray.count/4) {
            return dataListArray.count%4;
        }else{
            return 4;
        }
    
    }

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
 
    
    
    //注册
   [collectionView registerClass:[RecommendAppCell class] forCellWithReuseIdentifier:@"ID"];
    
    RecommendAppCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ID" forIndexPath:indexPath];
    
    
    RecommendAppItems *items = [dataListArray objectAtIndex:indexPath.section * 4 + indexPath.row];

    [cell.iconImageView setImageWithURL:[NSURL URLWithString:items.iconImageUrlStr]];
    cell.namelable.text =items.appNameStr;
    

    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

      RecommendAppItems *items = [dataListArray objectAtIndex:indexPath.section * 4 + indexPath.row];
    
    [self turnToAppStoreWithAppleId:items.appleIdStr];
    
    
    [SVProgressHUD showWithStatus:@"加载中"];
    
    
    
    
    
    

}



-(void)turnToAppStoreWithAppleId:(NSString *)appleID{
    NSDictionary *dict = [NSDictionary dictionaryWithObject:appleID forKey:SKStoreProductParameterITunesItemIdentifier];
    [storeProductViewController loadProductWithParameters:dict completionBlock:^(BOOL result, NSError *error) {
             if (result) {
                       [SVProgressHUD showSuccessWithStatus:@"链接成功"];
                       [self presentViewController:storeProductViewController animated:YES completion:nil];
                   }
               }];

}
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    [viewController dismissViewControllerAnimated:YES completion:^{
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
