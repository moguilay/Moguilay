//
//  DESEncrtpt.h
//  有钱
//
//  Created by Moguilay on 14-3-18.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DESEncrtpt : NSObject
+ (NSString *)encryptWithText:(NSString *)sText;//加密
+ (NSString *)decryptWithText:(NSString *)sText;//解密
@end
