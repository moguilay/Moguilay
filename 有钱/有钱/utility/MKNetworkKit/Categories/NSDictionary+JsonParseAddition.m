//
//  NSDictionary+JsonParseAddition.m
//  Tucao1.1
//
//  Created by 王 玉龙 on 13-8-13.
//  Copyright (c) 2013年 ZodaicSoft. All rights reserved.
//

#import "NSDictionary+JsonParseAddition.h"

@implementation NSDictionary (JsonParseAddition)

- (id)safeJsonObjectForKey:(id)aKey
{
    NSObject *tempObj = [self objectForKey:aKey];
    if ([tempObj isEqual:[NSNull null]]) {
        tempObj = nil;
    }
    return tempObj;
}

- (NSString*)jsonStringForKey:(id)aKey
{
    NSString *tempStr = [self objectForKey:aKey];
    if (![tempStr isKindOfClass:[NSString class]]) {
        tempStr = nil;
    }
    return tempStr;
}

- (NSArray*)jsonArrayForKey:(id)aKey
{
    NSArray *tempArr = [self objectForKey:aKey];
    if (![tempArr isKindOfClass:[NSArray class]]) {
        tempArr = nil;
    }
    return tempArr;
}

- (NSDictionary*)jsonDicForKey:(id)aKey
{
    NSDictionary *tempDic = [self objectForKey:aKey];
    if (![tempDic isKindOfClass:[NSDictionary class]]) {
        tempDic = nil;
    }
    return tempDic;
}
@end
