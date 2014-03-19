//
//  BaseViewController.h
//  Wodm2.1
//
//  Created by lusnaow on 13-3-13.
//  Copyright (c) 2013年 ZodiacSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMScrollingTicker.h"
@interface BaseViewController : UIViewController<UIGestureRecognizerDelegate>{
    UILabel * nameLabel;
    UIImageView* titleImage;
    UIImageView *mCommBG;
    UITapGestureRecognizer *singletap;

//    DMScrollingTicker *scrollingTicker;
//    NSMutableArray *scrollTickerMutableArray;
//    NSArray *messageArray;
}
-(void)setRunLabel;
-(void)setViewTitle:(NSString*)mTitle;
-(void)ShowHomeBtn;
-(void)ShowLeftBackBtn;
-(void)ShowRightBackBtn;
-(void)ShowSearchBtn;
@end
