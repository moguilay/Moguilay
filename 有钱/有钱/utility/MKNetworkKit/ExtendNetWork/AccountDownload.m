//
//  TestDownLoad.m
//  Test
//
//  Created by Moguilay on 14-2-26.
//  Copyright (c) 2014年 Moguilay. All rights reserved.
//

#import "AccountDownload.h"
#import <CommonCrypto/CommonCryptor.h>
@implementation AccountDownload
-(MKNetworkOperation *)userRegisterWithPuBrePath:(NSString *)str andVersion:(NSString *)version andPhoneNum:(NSString *)phoneNum andAccount:(NSString *)userAccount andPassWord:(NSString *)passWord andMessageCode:(NSString *)messageCode andIP:(NSString *)ip andIDFA:(NSString *)idfa
{
    
    
    
    
    
    NSDictionary *userDic = [NSDictionary dictionaryWithObjectsAndKeys:phoneNum,@"account",passWord,@"password", messageCode,@"code",nil];
    NSDictionary *myDic = [NSDictionary dictionaryWithObjectsAndKeys:@"register",@"action",userDic,@"paras",idfa,@"requuid",nil];
    NSArray *tokenArray = [NSArray arrayWithObjects:myDic,nil];
    NSDictionary *param=[NSDictionary dictionaryWithObjectsAndKeys:str,@"CP_PUBRESPATH",version,@"CP_VER",phoneNum,@"CP_PHONENUM",tokenArray,@"actions",ip,@"CP_IP",nil];
    
    
  
    
    
    MKNetworkOperation *op = [self operationWithPath:[[NSString stringWithFormat:@"qiansheng/service.do"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
                                              params:param
                                          httpMethod:@"POST"
                              ssl:NO];
    
    op.postDataEncoding=MKNKPostDataEncodingTypeJSON;
    [self enqueueOperation:op];
    
//    NSLog(@"$$$$$$$$$$$%@", op);
    
    return op;
    
    
    
    
}

-(MKNetworkOperation *)userLogInWithPuBrePath:(NSString *)str andVersion:(NSString *)version andPhoneNum:(NSString *)phoneNum andAccount:(NSString *)userAccount andPassWord:(NSString *)passWord andIP:(NSString *)ip andIDFA:(NSString *)idfa{
    NSDictionary *userDic = [NSDictionary dictionaryWithObjectsAndKeys:phoneNum,@"account",passWord,@"password",nil];
    NSDictionary *myDic = [NSDictionary dictionaryWithObjectsAndKeys:@"login",@"action",userDic,@"paras",idfa,@"requuid",nil];
    NSArray *tokenArray = [NSArray arrayWithObjects:myDic,nil];
    NSDictionary *param=[NSDictionary dictionaryWithObjectsAndKeys:str,@"CP_PUBRESPATH",version,@"CP_VER",phoneNum,@"CP_PHONENUM",tokenArray,@"actions",ip,@"CP_IP",nil];
    
    
//   
//    NSString *jsonStr=[param jsonEncodedKeyValueString];
//  
//  
//    
//    NSString *strs = [DESEncrtpt encryptWithText:jsonStr];
//    
//    NSDictionary *desDic = [NSDictionary dictionaryWithObjectsAndKeys:strs,@"DESPost", nil];
    
    MKNetworkOperation *op = [self operationWithPath:[[NSString stringWithFormat:@"qiansheng/service.do"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
                                              params:param
                                          httpMethod:@"POST"
                                                 ssl:NO];
    
    op.postDataEncoding=MKNKPostDataEncodingTypeJSON;
    [self enqueueOperation:op];
 
    
    return op;
}



@end
