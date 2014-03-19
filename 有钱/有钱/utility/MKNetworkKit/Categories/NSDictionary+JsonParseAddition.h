//
//  NSDictionary+JsonParseAddition.h
//  Tucao1.1
//
//  Created by 王 玉龙 on 13-8-13.
//  Copyright (c) 2013年 ZodaicSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JsonParseAddition)

// if the object for key is null return nil
- (id)safeJsonObjectForKey:(id)aKey;
// if the object for key is not a string return nil
- (NSString*)jsonStringForKey:(id)aKey;
// if the object for key is not an array return nil
- (NSArray*)jsonArrayForKey:(id)aKey;
// if the object for key is not a dictionary return nil
- (NSDictionary*)jsonDicForKey:(id)aKey;

@end
