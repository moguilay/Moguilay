//
//  RecommendDownload.m
//  有钱
//
//  Created by Moguilay on 14-3-16.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "RecommendDownload.h"

@implementation RecommendDownload
-(MKNetworkOperation *)publicWithPuBrePath:(NSString *)str andVersion:(NSString *)version andPhoneNum:(NSString *)phoneNum andAccount:(NSString *)userAccount andPassWord:(NSString *)passWord andMessageCode:(NSString *)messageCode andIP:(NSString *)ip andIDFA:(NSString *)idfa andAction:(NSString *)action
{
    
    
    
    
    
    NSDictionary *userDic = [NSDictionary dictionaryWithObjectsAndKeys:phoneNum,@"account",passWord,@"password", messageCode,@"code",nil];
    NSDictionary *myDic = [NSDictionary dictionaryWithObjectsAndKeys:action,@"action",userDic,@"paras",idfa,@"requuid",nil];
    NSArray *tokenArray = [NSArray arrayWithObjects:myDic,nil];
    NSDictionary *param=[NSDictionary dictionaryWithObjectsAndKeys:str,@"CP_PUBRESPATH",version,@"CP_VER",phoneNum,@"CP_PHONENUM",tokenArray,@"actions",ip,@"CP_IP",nil];
    
    MKNetworkOperation *op = [self operationWithPath:[[NSString stringWithFormat:@"qiansheng/service.do"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
                                              params:param
                                          httpMethod:@"POST"];
    
    op.postDataEncoding=MKNKPostDataEncodingTypeJSON;
    [self enqueueOperation:op];

    
    return op;
    
    
    
    
}
@end
