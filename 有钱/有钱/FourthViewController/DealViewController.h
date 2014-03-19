//
//  DealViewController.h
//  有钱
//
//  Created by Moguilay on 14-3-4.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "BaseViewController.h"

@interface DealViewController : BaseViewController<UITextFieldDelegate,UIPickerViewDataSource, UIPickerViewDelegate>
{
    UIView *backView;
    UITextField *myTextField;
    UIPickerView *moneyPickerView;
    NSArray *moneyArray;
}
-(id)initWithTitleName:(NSString *)titleName andButtonName:(NSString *)buttonName andWhichOne:(int) whichOne;
@end
