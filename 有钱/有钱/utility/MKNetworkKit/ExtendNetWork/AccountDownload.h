//
//  TestDownLoad.h
//  Test
//
//  Created by Moguilay on 14-2-26.
//  Copyright (c) 2014年 Moguilay. All rights reserved.
//

#import "MKNetworkEngine.h"

@interface AccountDownload : MKNetworkEngine
-(MKNetworkOperation *)userRegisterWithPuBrePath:(NSString *)str andVersion:(NSString *)version andPhoneNum:(NSString *)phoneNum andAccount:(NSString *)userAccount andPassWord:(NSString *)passWord andMessageCode:(NSString *)messageCode andIP:(NSString *)ip andIDFA:(NSString *)idfa;
-(MKNetworkOperation *)userLogInWithPuBrePath:(NSString *)str andVersion:(NSString *)version andPhoneNum:(NSString *)phoneNum andAccount:(NSString *)userAccount andPassWord:(NSString *)passWord andIP:(NSString *)ip andIDFA:(NSString *)idfa;
@end
