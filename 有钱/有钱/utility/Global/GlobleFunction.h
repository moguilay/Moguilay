//
//  GlobleFunction.h
//  moguilay
//
//  Created by Moguilay on 14-2-26.
//  Copyright (c) 2014年 Moguilay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobleFunction : NSObject
//邮箱验证
+(BOOL) isStandardMail:(NSString *) mail;

//手机号验证
+(BOOL)isMobileNumber:(NSString *)mobileNum;
//是否存在文件
+(BOOL)FileExistAtPath:(NSString*)_filePath;

//创建文件夹
+(BOOL)CreateDictionary:(NSString*)path;
//移动文件夹
+(BOOL)MoveFileAtPath:(NSString*)path toPath:(NSString*)mPath;
//删除文件
+(BOOL)DeleteDictionary:(NSString*)path;

//判断ios系统版本是否高于ios7
+(BOOL)isIOSVersionHigh7;

//判断是否已经有user缓存登录
+(BOOL)isUserLoginOnce;
// 得到用户手机号
+(NSString *)getUserMobileNumber;
//得到用户MD5密码
+(NSString *)getUserMD5Password;
//得到用户支付宝账号
+(NSString *)getUserZhiFuBaoAccount;
//得到用户支付宝姓名
+(NSString *)getUserName;
//得到用户积分
+(NSString *)getUserCredit;

//获取IDFA
+(NSString *)getIDFA;

//用户真是密码
+(NSString *)getUserPassword;
//更新支付宝账号
+(void)upDataZhiFuBaoAccount:(NSString *)alipay;
//获取用户IP地址
+(NSString *)getIPAddress ;
@end
