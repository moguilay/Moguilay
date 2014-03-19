//
//  UIButton+MKNetworkKitAdditions.m
//  Wodm2.1
//
//  Created by Crauson on 13-5-7.
//  Copyright (c) 2013年 ZodiacSoft. All rights reserved.
//

#import "UIButton+MKNetworkKitAdditions.h"
#import <objc/runtime.h>

static MKNetworkEngine *DefaultEngine;
static char imageFetchOperationKey;
 

@interface UIButton (/*Private Methods*/)
@property (strong, nonatomic) MKNetworkOperation *imageFetchOperation;
@end
@implementation UIButton (MKNetworkKitAdditions)

-(MKNetworkOperation*) imageFetchOperation {
    
    return (MKNetworkOperation*) objc_getAssociatedObject(self, &imageFetchOperationKey);
}

-(void) setImageFetchOperation:(MKNetworkOperation *)imageFetchOperation {
    
    objc_setAssociatedObject(self, &imageFetchOperationKey, imageFetchOperation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+(void) setDefaultEngine:(MKNetworkEngine*) engine {
    
    DefaultEngine = engine;
}

-(MKNetworkOperation*) setImageFromURL:(NSURL *)url placeHolderImage:(UIImage *)image forState:(UIControlState)state
{
    
    if(image)
    {
        [self setImage:image forState:state];
    }
    [self.imageFetchOperation cancel];
    
    if(DefaultEngine) {
        self.imageFetchOperation = [DefaultEngine imageAtURL:url
                                                        size:self.frame.size
                                           completionHandler:^(UIImage *fetchedImage, NSURL *url, BOOL isInCache) {
                                               [UIView transitionWithView:self.superview
                                                                 duration:isInCache?kFromCacheAnimationDuration:kFreshLoadAnimationDuration
                                                                  options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionAllowUserInteraction
                                                               animations:^{
                                                                   [self setImage:fetchedImage forState:state];
                                                               } completion:nil];
                                           } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
                                                  
                                                //DLog(@"%@", error);
                                           }];
    } else {
        
        //DLog(@"No default engine found and imageCacheEngine parameter is null")
    }
    
    return self.imageFetchOperation;
}

- (MKNetworkOperation*)setBackgroundImageFromURL:(NSURL *)url placeHolderImage:(UIImage *)image forState:(UIControlState)state
{
    
    if(image)
    {
        [self setBackgroundImage:image forState:state];
    }
    [self.imageFetchOperation cancel];
    
    if(DefaultEngine) {
        self.imageFetchOperation = [DefaultEngine imageAtURL:url
                                                        size:self.frame.size
                                           completionHandler:^(UIImage *fetchedImage, NSURL *url, BOOL isInCache) {
                                               
                                               [UIView transitionWithView:self.superview
                                                                 duration:isInCache?kFromCacheAnimationDuration:kFreshLoadAnimationDuration
                                                                  options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionAllowUserInteraction
                                                               animations:^{
                                                                   [self setBackgroundImage:fetchedImage forState:state];
                                                               } completion:nil];
                                               
                                           } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
                                               
                                               //DLog(@"%@", error);
                                           }];
    } else {
        
        //DLog(@"No default engine found and imageCacheEngine parameter is null")
    }
    
    return self.imageFetchOperation;
}

-(MKNetworkOperation*) setNorImageFromURL:(NSURL*) norUrl andSelImagedFromUrl:(NSURL*)selUrl placeHolderImage:(UIImage*) image
{
    if(image)
    {
        [self setImage:image forState:UIControlStateNormal];
    }
    [self.imageFetchOperation cancel];
    
    if(DefaultEngine) {
        self.imageFetchOperation = [DefaultEngine imageAtURL:norUrl
                                                        size:self.frame.size
                                           completionHandler:^(UIImage *fetchedImage, NSURL *url, BOOL isInCache) {
                                               [UIView transitionWithView:self.superview
                                                                 duration:isInCache?kFromCacheAnimationDuration:kFreshLoadAnimationDuration
                                                                  options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionAllowUserInteraction
                                                               animations:^{
                                                                   [self setImage:fetchedImage forState:UIControlStateNormal];
                                                                   [self setImageFromURL:selUrl placeHolderImage:nil forState:UIControlStateSelected];
                                                               } completion:nil];
                                           } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
                                               
                                               //DLog(@"%@", error);
                                           }];
    } else {
        
        //DLog(@"No default engine found and imageCacheEngine parameter is null")
    }
    
    return self.imageFetchOperation;
}

-(MKNetworkOperation*) setBackgroundNorImageFromURL:(NSURL*) norUrl setBackgroundSelImageFromURL:(NSURL*)selUrl placeHolderImage:(UIImage*) image
{
    if(image)
    {
        [self setBackgroundImage:image forState:UIControlStateNormal];
    }
    [self.imageFetchOperation cancel];
    
    if(DefaultEngine) {
        self.imageFetchOperation = [DefaultEngine imageAtURL:norUrl
                                                        size:self.frame.size
                                           completionHandler:^(UIImage *fetchedImage, NSURL *url, BOOL isInCache) {
                                               
                                               [UIView transitionWithView:self.superview
                                                                 duration:isInCache?kFromCacheAnimationDuration:kFreshLoadAnimationDuration
                                                                  options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionAllowUserInteraction
                                                               animations:^{
                                                                   [self setBackgroundImage:fetchedImage forState:UIControlStateNormal];
                                                                   [self setBackgroundImageFromURL:selUrl placeHolderImage:nil forState:UIControlStateSelected];
                                                              } completion:nil];
                                               
                                           } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
                                               
                                               //DLog(@"%@", error);
                                           }];
    } else {
        
        //DLog(@"No default engine found and imageCacheEngine parameter is null")
    }
    
    return self.imageFetchOperation;
}

- (MKNetworkOperation*)setNorImageFromURL:(NSURL *)norUrl andHighLightImagedFromUrl:(NSURL *)highlightUrl placeHolderImage:(UIImage *)image
{
    if(image)
    {
        [self setImage:image forState:UIControlStateNormal];
    }
    [self.imageFetchOperation cancel];
    if(DefaultEngine) {
        self.imageFetchOperation = [DefaultEngine imageAtURL:norUrl
                                                        size:self.frame.size
                                           completionHandler:^(UIImage *fetchedImage, NSURL *url, BOOL isInCache) {
                                               [UIView transitionWithView:self.superview
                                                                 duration:isInCache?kFromCacheAnimationDuration:kFreshLoadAnimationDuration
                                                                  options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionAllowUserInteraction
                                                               animations:^{
                                                                   [self setImage:fetchedImage forState:UIControlStateNormal];
                                                                   [self setImageFromURL:highlightUrl placeHolderImage:nil forState:UIControlStateHighlighted];
                                                               } completion:nil];
                                           } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {      
                                               //DLog(@"%@", error);
                                           }];
    } else {
        
        //DLog(@"No default engine found and imageCacheEngine parameter is null")
    }
    return self.imageFetchOperation;
}
-(MKNetworkOperation*)setBackgroundNorImageFromURL:(NSURL *)norUrl setBackgroundHighLightImageFromURL:(NSURL *)highlightUrl placeHolderImage:(UIImage *)image
{
    if(image)
    {
        [self setBackgroundImage:image forState:UIControlStateNormal];
    }
    [self.imageFetchOperation cancel];
    
    if(DefaultEngine) {
        self.imageFetchOperation = [DefaultEngine imageAtURL:norUrl
                                                        size:self.frame.size
                                           completionHandler:^(UIImage *fetchedImage, NSURL *url, BOOL isInCache) {
                                               
                                               [UIView transitionWithView:self.superview
                                                                 duration:isInCache?kFromCacheAnimationDuration:kFreshLoadAnimationDuration
                                                                  options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionAllowUserInteraction
                                                               animations:^{
                                                                   [self setBackgroundImage:fetchedImage forState:UIControlStateNormal];
                                                                   [self setBackgroundImageFromURL:highlightUrl placeHolderImage:nil forState:UIControlStateHighlighted];
                                                               } completion:nil];
                                               
                                           } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
                                               
                                               //DLog(@"%@", error);
                                           }];
    } else {
        
        //DLog(@"No default engine found and imageCacheEngine parameter is null")
    }
    
    return self.imageFetchOperation;

}
@end
