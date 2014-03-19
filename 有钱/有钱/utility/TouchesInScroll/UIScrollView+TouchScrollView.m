//
//  DBUserMessage.h
//  有钱
//
//  Created by Moguilay on 14-3-5.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "UIScrollView+TouchScrollView.h"

@implementation UIScrollView (TouchScrollView)
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [[self nextResponder]touchesBegan:touches withEvent:event];
}
@end
