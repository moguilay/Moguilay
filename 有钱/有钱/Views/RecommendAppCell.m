//
//  RecommendAppCell.m
//  有钱
//
//  Created by Moguilay on 14-3-18.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "RecommendAppCell.h"

@implementation RecommendAppCell
@synthesize iconImageView, namelable;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //初始化
       iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 70, 70)];
      iconImageView.backgroundColor = [UIColor clearColor];
        [self addSubview:iconImageView];
        
        
        
        
        namelable =[[UILabel alloc]initWithFrame:CGRectMake(0, 70, 70, 20)];
       namelable.backgroundColor =[UIColor clearColor];
        namelable.textAlignment = NSTextAlignmentCenter;
       namelable.textColor = [UIColor grayColor];
       namelable.font = [UIFont boldSystemFontOfSize:13.0f];
        [self addSubview:namelable];
        
        
        
        
        
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
