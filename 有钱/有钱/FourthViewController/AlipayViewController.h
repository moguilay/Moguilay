//
//  AlipayViewController.h
//  有钱
//
//  Created by Moguilay on 14-3-13.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "BaseViewController.h"

@interface AlipayViewController : BaseViewController<UITextFieldDelegate>
{
    UITextField *password;
    UITextField *rePassword;
    
    
    
    
    NSMutableArray *mEditFieldArray;     //存放视图中可编辑的控件
    EXKeyboardTopBar *mKeyboardBar;

}
@end
