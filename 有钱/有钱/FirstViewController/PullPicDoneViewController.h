//
//  PullPicDoneViewController.h
//  有钱
//
//  Created by Moguilay on 14-2-28.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "BaseViewController.h"

@interface PullPicDoneViewController : BaseViewController<UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate>
{
    UIImageView *picImageView;
    
    UIButton *choicePhotoButton;

}
//@property(nonatomic, strong)UISwipeGestureRecognizer *swipeGestureRecognizer;
@end
