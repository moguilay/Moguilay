//
//  RecommendDownload.h
//  有钱
//
//  Created by Moguilay on 14-3-16.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "MKNetworkEngine.h"

@interface RecommendDownload : MKNetworkEngine
-(MKNetworkOperation *)publicWithPuBrePath:(NSString *)str andVersion:(NSString *)version andPhoneNum:(NSString *)phoneNum andAccount:(NSString *)userAccount andPassWord:(NSString *)passWord andMessageCode:(NSString *)messageCode andIP:(NSString *)ip andIDFA:(NSString *)idfa andAction:(NSString *)action;

@end
