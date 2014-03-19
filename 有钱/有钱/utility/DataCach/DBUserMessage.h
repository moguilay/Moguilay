//
//  DBUserMessage.h
//  有钱
//
//  Created by Moguilay on 14-3-5.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBUserMessage : NSObject
+(void)insertInToUserMessageList:(NSDictionary *)dataDictionary;
+(NSDictionary *)SelectDataFromUserMessageList;
+(void)deleteUserMessageList;
@end
