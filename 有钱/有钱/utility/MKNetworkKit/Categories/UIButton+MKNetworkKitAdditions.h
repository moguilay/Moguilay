//
//  UIButton+MKNetworkKitAdditions.h
//  Wodm2.1
//
//  Created by Crauson on 13-5-7.
//  Copyright (c) 2013年 ZodiacSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

extern const float kFromCacheAnimationDuration;
extern const float kFreshLoadAnimationDuration;

@class MKNetworkEngine;
@class MKNetworkOperation;

@interface UIButton (MKNetworkKitAdditions)

+(void) setDefaultEngine:(MKNetworkEngine*) engine;

-(MKNetworkOperation*) setImageFromURL:(NSURL*) url placeHolderImage:(UIImage*) image forState:(UIControlState)state;
-(MKNetworkOperation*) setNorImageFromURL:(NSURL*) norUrl andSelImagedFromUrl:(NSURL*)selUrl placeHolderImage:(UIImage*) image;
-(MKNetworkOperation*) setNorImageFromURL:(NSURL*) norUrl andHighLightImagedFromUrl:(NSURL*)highlightUrl placeHolderImage:(UIImage*) image;

-(MKNetworkOperation*) setBackgroundImageFromURL:(NSURL*) url placeHolderImage:(UIImage*) image forState:(UIControlState)state;
-(MKNetworkOperation*) setBackgroundNorImageFromURL:(NSURL*) norUrl setBackgroundSelImageFromURL:(NSURL*)selUrl placeHolderImage:(UIImage*) image;
-(MKNetworkOperation*) setBackgroundNorImageFromURL:(NSURL*) norUrl setBackgroundHighLightImageFromURL:(NSURL*)highlightUrl placeHolderImage:(UIImage*) image;

@end
