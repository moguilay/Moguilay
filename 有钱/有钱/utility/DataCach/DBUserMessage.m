//
//  DBUserMessage.m
//  有钱
//
//  Created by Moguilay on 14-3-5.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "DBUserMessage.h"

@implementation DBUserMessage
+(void)insertInToUserMessageList:(NSDictionary *)dataDictionary
{

    if (!dataDictionary) {
        return;
    }
    [dataDictionary writeToFile:[DOCUMENT_DICTIONARY stringByAppendingFormat:@"/usermessageList.plist"] atomically:YES];
}

+(NSDictionary *)SelectDataFromUserMessageList
{

    if (![GlobleFunction FileExistAtPath:[DOCUMENT_DICTIONARY stringByAppendingFormat:@"/usermessageList.plist"]]) {
        return [NSDictionary dictionaryWithDictionary:nil];
    }
    
    return [NSDictionary dictionaryWithContentsOfFile:[DOCUMENT_DICTIONARY stringByAppendingFormat:@"/usermessageList.plist"]];

}


+(void)deleteUserMessageList
{
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSString *path =[DOCUMENT_DICTIONARY stringByAppendingString:@"/usermessageList.plist"];
    if (![GlobleFunction FileExistAtPath:path]) {
        return;
    }
    
    [fileManager removeItemAtPath:path error:nil];
    
    
    

}
@end
