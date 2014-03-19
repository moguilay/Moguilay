//
//  EXKeyboardTopBar.m
//  Tucao
//
//  Created by 王 玉龙 on 13-7-19.
//  Copyright (c) 2013年 ZodaicSoft. All rights reserved.
//

#import "EXKeyboardTopBar.h"
#import "Defines.h"

@implementation EXKeyboardTopBar

@synthesize view;


//初始化控件和变量

-(id)init{
    
    if((self = [super init])) {
        
        prevButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"上一项" style:UIBarButtonItemStyleBordered target:self action:@selector(showPrevious)];
        prevButtonItem.tintColor = [UIColor redColor];
        
        nextButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一项" style:UIBarButtonItemStyleBordered target:self action:@selector(showNext)];
        nextButtonItem.tintColor = [UIColor redColor];
        hiddenButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleBordered target:self action:@selector(hiddenKeyBoard)];
        hiddenButtonItem.tintColor = [UIColor redColor];
        spaceButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        view = [[UIToolbar alloc] initWithFrame:CGRectMake(0,500+(isIphone5?88:0),320,44)];
        
        view.barStyle = UIBarStyleDefault;
        view.backgroundColor = [UIColor whiteColor];
        
        view.items = [NSArray arrayWithObjects:prevButtonItem,nextButtonItem,spaceButtonItem,hiddenButtonItem,nil];
        
        allowShowPreAndNext = YES;
        
        textFields = nil;
        
        isInNavigationController = YES;
        
        currentTextField = nil;
        mIsKeyboardShow = NO;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];


    }
    
    return self;
    
}
//- (void)keyboardWasShown:(NSNotification*)aNotification     //代理方法
//{
//    NSLog(@"*************************%@",[[UITextInputMode currentInputMode] primaryLanguage]);
//    
//    if ([[[UITextInputMode currentInputMode] primaryLanguage] isEqualToString:@"zh-Hans"]) {
//         view.frame = CGRectMake(0, 201-81+(iPhone5?88:0), 320, 44);
//    }
//    else if([[[UITextInputMode currentInputMode] primaryLanguage] isEqualToString:@"en-US"]){
//    
//    view.frame = CGRectMake(0, 201-40+(iPhone5?88:0), 320, 44);
//    }
//}


//设置是否在导航视图中

-(void)setIsInNavigationController:(BOOL)isbool{
    
    isInNavigationController = isbool;
    
}

//显示上一项

-(void)showPrevious{
    
    if (textFields==nil) {
        
        return;
        
    }
    
    NSInteger num = -1;
    
    for (NSInteger i=0; i<[textFields count]; i++) {
        
        if ([textFields objectAtIndex:i]==currentTextField) {
            
            num = i;
            
            break;
            
        }
        
    }
    
    if (num>0){
        
        [[textFields objectAtIndex:num] resignFirstResponder];
        
        [[textFields objectAtIndex:num-1 ] becomeFirstResponder];
        
        [self showBar:[textFields objectAtIndex:num-1]];
        
    }
    
}

//显示下一项

-(void)showNext{
    
    if (textFields==nil) {
        
        return;
        
    }
    
    NSInteger num = -1;
    
    for (NSInteger i=0; i<[textFields count]; i++) {
        
        if ([textFields objectAtIndex:i]==currentTextField) {
            
            num = i;
            
            break;
            
        }
        
    }
    
    if (num<[textFields count]-1){
        
        [[textFields objectAtIndex:num] resignFirstResponder];
        
        [[textFields objectAtIndex:num+1] becomeFirstResponder];
        
        [self showBar:[textFields objectAtIndex:num+1]];
        
    }
    
}

//显示工具条

-(void)showBar:(UITextField *)textField{
    
    mIsKeyboardShow = YES;
    currentTextField = textField;
    
    if (allowShowPreAndNext) {
        
        [view setItems:[NSArray arrayWithObjects:prevButtonItem,nextButtonItem,spaceButtonItem,hiddenButtonItem,nil]];
        
    }
    
    else {
        
        [view setItems:[NSArray arrayWithObjects:spaceButtonItem,hiddenButtonItem,nil]];
        
    }
    
    if (textFields==nil) {
        
        prevButtonItem.enabled = NO;
        
        nextButtonItem.enabled = NO;
        
    }
    
    else {
        
        NSInteger num = -1;
        
        for (NSInteger i=0; i<[textFields count]; i++) {
            
            if ([textFields objectAtIndex:i]==currentTextField) {
                
                num = i;
                
                break;
                
            }
            
        }
        
        if (num>0) {
            
            prevButtonItem.enabled = YES;
            
        }
        
        else {
            
            prevButtonItem.enabled = NO;
            
        }
        
        if (num<[textFields count]-1) {
            
            nextButtonItem.enabled = YES;
            
        }
        
        else {
            
            nextButtonItem.enabled = NO;
            
        }
        
    }
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:0.3];
    
    if (isInNavigationController) {
        
        view.frame = CGRectMake(0, 201-20+(isIphone5?88:0), 320, 44);
        
    }
    
    else {
        
        view.frame = CGRectMake(0, 201+(isIphone5?88:0) + 20, 320, 44);
        
    }
    
    [UIView commitAnimations];
    
}

//设置输入框数组

-(void)setTextFieldsArray:(NSArray *)array{
    
    textFields = array;
    
}

//设置是否显示上一项和下一项按钮

-(void)setAllowShowPreAndNext:(BOOL)isShow{
    
    allowShowPreAndNext = isShow;
    
}

//隐藏键盘和工具条

-(void)hiddenKeyBoard{
    
    mIsKeyboardShow = NO;
    
    if (currentTextField!=nil) {
        
        [currentTextField  resignFirstResponder];
        
    }
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:0.3];
    
    view.frame = CGRectMake(0, 480+(isIphone5?88:0), 320, 44);
    
    [UIView commitAnimations];
    
}

// keyboard notification
- (void)keyboardWillShow:(NSNotification*)aNotification {
    if (mIsKeyboardShow) {
        NSDictionary* info = [aNotification userInfo];
        CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
//        NSLog(@"keyboard height:%f",kbSize.height);
        
        if (isInNavigationController) {
            view.frame = CGRectMake(0, 480-kbSize.height-63-40+(isIphone5?88:0) + 20, 320, 44);

            //view.frame = CGRectMake(0, 201-40+(iPhone5?88:0), 320, 44);
        
        }
        
        else {
            view.frame = CGRectMake(0, 480-kbSize.height-63+(isIphone5?88:0) + 20, 320, 44);

            //view.frame = CGRectMake(0, 201+(iPhone5?88:0), 320, 44);
            
        }
        
        [UIView commitAnimations];

    }
    
    /* 通过 kbSize.height 就可以得到屏幕键盘的高度，这样就可以据以调整其他的屏幕元素了 */
}
- (void)removeNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}
@end

