//
//  GlobleFunction.m
//  moguilay
//
//  Created by Moguilay on 14-2-26.
//  Copyright (c) 2014年 Moguilay. All rights reserved.
//

#import "GlobleFunction.h"
#import <ifaddrs.h>
#import <arpa/inet.h>

@implementation GlobleFunction

#pragma mark 验证邮箱 0succ 1fail
+(BOOL) isStandardMail:(NSString *) mail{
	
	if (mail == nil || [mail isEqualToString:@""]) {
		return FALSE;
	}
	NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:mail];
	
    //	NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    //	NSString *laxString = @".+@.+\.[A-Za-z]{2}[A-Za-z]*";
    //	NSString *emailRegex = stricterFilterString ? stricterFilterString : laxString;
    //	NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    //	return [emailTest evaluateWithObject:mail];
	
}

#pragma 验证手机号
+(BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//是否存在文件
+(BOOL)FileExistAtPath:(NSString*)_filePath
{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if ( [fileManager fileExistsAtPath:_filePath]) {
        return  YES;
    }
    return NO;
}

//创建文件夹
+(BOOL)CreateDictionary:(NSString*)path
{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if ([fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil])
    {
        return  YES;
    }
    return  NO;
}
//移动文件夹

+(BOOL)MoveFileAtPath:(NSString*)path toPath:(NSString*)mPath{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if ([fileManager moveItemAtPath:path toPath:mPath error:nil])
    {
        return  YES;
    }
    return  NO;
}
//删除文件夹
+(BOOL)DeleteDictionary:(NSString*)path
{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if ([fileManager removeItemAtPath:path error:nil])
    {
        return  YES;
    }
    return  NO;
}
//ios版本判断
+(BOOL)isIOSVersionHigh7{
    if ([[[UIDevice currentDevice] systemVersion] floatValue]<7.0f) {
        return NO;
    }else{
        return YES;
    }
    
}
// 判断用户是否登录过
+(BOOL)isUserLoginOnce{

    
    //在数据库获得用户信息判断是否为空
    NSDictionary *getUserMessageDic = [DBUserMessage SelectDataFromUserMessageList];

    if ([getUserMessageDic count] == 0) {
        return NO;
    }
    return YES;
}

// 得到用户手机号
+(NSString *)getUserMobileNumber{
    //在数据库获得用户信息
    NSDictionary *getUserMessageDic = [DBUserMessage SelectDataFromUserMessageList];
   
        
//    NSDictionary *dic = [getUserMessageDic objectForKey:USERID];
    NSString *mobileNumber = [getUserMessageDic objectForKey:USERMOILBNUM];
    return  mobileNumber;
}
//得到用户MD5密码
+(NSString *)getUserMD5Password{
    //在数据库获得用户信息
    NSDictionary *getUserMessageDic = [DBUserMessage SelectDataFromUserMessageList];
    
    
//    NSDictionary *dic = [getUserMessageDic objectForKey:USERID];
    NSString *password = [getUserMessageDic objectForKey:USERPASSWORD];
    return password;
}
//得到用户真实密码
+(NSString *)getUserPassword{
    //在数据库获得用户信息
    NSDictionary *getUserMessageDic = [DBUserMessage SelectDataFromUserMessageList];
    
    
//    NSDictionary *dic = [getUserMessageDic objectForKey:USERID];
    NSString *password = [getUserMessageDic objectForKey:USERPASSTRUEWORD];
    return password;
}
//得到用户支付宝账号
+(NSString *)getUserZhiFuBaoAccount{
    //在数据库获得用户信息
    NSDictionary *getUserMessageDic = [DBUserMessage SelectDataFromUserMessageList];
//    NSDictionary *dic = [getUserMessageDic objectForKey:USERID];
    NSString *zhiFuBao = [getUserMessageDic objectForKey:ZHIFUBAOACCOUNT];
    return zhiFuBao;
    
}
//跟新用户支付宝账号
+(void)upDataZhiFuBaoAccount:(NSString *)alipay{
    //在数据库获得用户信息
//    NSDictionary *getUserMessageDic = [DBUserMessage SelectDataFromUserMessageList];
//    NSDictionary *dic = [getUserMessageDic objectForKey:USERID];
//    [dic setValue:alipay forKey:ZHIFUBAOACCOUNT];
//    
//    NSLog(@"%@", dic);
}

//得到用户姓名
+(NSString *)getUserName{
    //在数据库获得用户信息
    NSDictionary *getUserMessageDic = [DBUserMessage SelectDataFromUserMessageList];
//    NSDictionary *dic = [getUserMessageDic objectForKey:USERID];
    NSString *userName = [getUserMessageDic objectForKey:USERNAME];
    return userName;
    
}

//得到用户积分
+(NSString *)getUserCredit{
    //在数据库获得用户信息
    NSDictionary *getUserMessageDic = [DBUserMessage SelectDataFromUserMessageList];
//    NSDictionary *dic = [getUserMessageDic objectForKey:USERID];
    NSString *userName = [getUserMessageDic objectForKey:USERCREDIT];
    return userName;
    
}

//获取IDFA
+(NSString *)getIDFA{


    
    NSString *myIDFA =[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    return myIDFA;
}
//获取IP地址
+(NSString *)getIPAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
    
}




@end
