//
//  Defines.h
//  moguilay
//
//  Created by Moguilay on 14-2-26.
//  Copyright (c) 2014年 Moguilay. All rights reserved.
//

#ifndef moguilay_Defines_h
#define moguilay_Defines_h
//isIphone5
#define isIphone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define UMSOCIALKEY @"530f1d4756240b7101032879"
#define NAV_HEIGHT 44
#define NAV_HEIGHTIOS7 64
#pragma mark - 服务器通用接口
//http://42.120.53.27:8080
//当前服务器根地址
#define SERVICE_BASE_ADDRESS     @"192.168.1.104:9090"
#define SERVICE_HTTP_BASE_ADDRESS     @" "
//数据库文件名
#define DATEBASE_FILE_NAME @"HavaMoney.db"

#define DOCUMENT_DICTIONARY     [NSHomeDirectory() stringByAppendingFormat:@"/Library/Private Documents"]
//temp文件目录
#define TEMP_DICTIONARY     [NSHomeDirectory() stringByAppendingFormat:@"/tmp"]
//cache目录
#define CACHE_DICTIONARY     [NSHomeDirectory() stringByAppendingFormat:@"/Library/Caches"]
//图片存放位置
#define CARTOON_PAGE_DICTIONARY  [DOCUMENT_DICTIONARY stringByAppendingFormat:@"/IconContent"]
#define CARTOON_PAGE_TEMP_DICTIONARY  [DOCUMENT_DICTIONARY stringByAppendingFormat:@"/IconTempContent"]

//#define UPDATE_SYSTEMUI_NOTIFICATION @"update_systemui_notification"
//#define UPDATE_DOWNLOADTABLE_NOTIFICATION @"update_downloadtable_notification"

#define KEY_CURRENT_VERSION @"currentVersion"
#define CURRENT_VERSION  @"1.0"



#define USERMOILBNUM @"useriPhoneNumber"
#define USERPASSWORD @"userPassword"
#define USERPASSTRUEWORD @"userTruePassword"
#define ZHIFUBAOACCOUNT @"zhifubaoAccount"
#define USERID @"userID"
#define USERNAME @"userName"
#define USERCREDIT @"credit"
#endif
