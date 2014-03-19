//
//  PullPicDoneViewController.m
//  有钱
//
//  Created by Moguilay on 14-2-28.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "PullPicDoneViewController.h"
#import "NewTaskViewController.h"
#import "DoTaskViewController.h"
@interface PullPicDoneViewController ()

@end

@implementation PullPicDoneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        self.view.backgroundColor = [UIColor orangeColor];
//        [self setViewTitle:@"上传证据"];
      self.title = @"上传截图";

        
        UIButton *goNextButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        goNextButton.backgroundColor = [UIColor blueColor];
        goNextButton.frame = CGRectMake(0, 520, 320, 40);
        [goNextButton setTitle:@"完" forState:UIControlStateNormal];
        [goNextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [goNextButton addTarget:self action:@selector(done) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:goNextButton];
        
        
        picImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 50, 300, 400)];
        [self.view addSubview:picImageView];
        
    
        
        
        choicePhotoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        choicePhotoButton.backgroundColor = [UIColor blueColor];
        choicePhotoButton.frame = CGRectMake(0, 200, 320, 40);
        [choicePhotoButton setTitle:@"上传截图" forState:UIControlStateNormal];
        [choicePhotoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [choicePhotoButton addTarget:self action:@selector(choiceP) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:choicePhotoButton];
        
        
        
    }
    return self;
}
-(void)choiceP{
    UIActionSheet *sheet;
   
    // 判断是否支持相机
  
//    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
//        
//        
//        
//    {
//        
//        sheet  = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照",@"从相册选择", nil];
//      
//    }
//    
//   
//    else {
    
        sheet = [[UIActionSheet alloc] initWithTitle:@"上传截图" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"从相册选择" otherButtonTitles:@"取消", nil];
       
//    }
   
    sheet.tag = 255;
   
    [sheet showInView:self.view];


}
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 255) {
        
        NSUInteger sourceType = 0;
        
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            switch (buttonIndex) {
                    case 0:
                    // 相册
                        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                        break;
                    case 1:
                        //取消
                        return;

//                case 0:
//                    // 取消
//                    return;
//                case 1:
//                    // 相机
////                    sourceType = UIImagePickerControllerSourceTypeCamera;
//                    break;
//                    
//                case 2:
//                    // 相册
//                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//                    break;
            }
        }
        else {
            if (buttonIndex == 0) {
                
                return;
            } else {
                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
        }
//        <p>
//        // 跳转到相机或相册页面
//        </p>
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        
        imagePickerController.delegate = self;
        
        imagePickerController.allowsEditing = NO;
        
        imagePickerController.sourceType = sourceType;
        
        [self presentViewController:imagePickerController animated:YES completion:^{}];
        
       
    }
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    picImageView.image = image;
    [choicePhotoButton removeFromSuperview];
    NSLog(@"%@", image);
    /* 此处info 有六个值
     * UIImagePickerControllerMediaType; // an NSString UTTypeImage)
     * UIImagePickerControllerOriginalImage;  // a UIImage 原始图片
     * UIImagePickerControllerEditedImage;    // a UIImage 裁剪后图片
     * UIImagePickerControllerCropRect;       // an NSValue (CGRect)
     * UIImagePickerControllerMediaURL;       // an NSURL
     * UIImagePickerControllerReferenceURL    // an NSURL that references an asset in the AssetsLibrary framework
     * UIImagePickerControllerMediaMetadata    // an NSDictionary containing metadata from a captured photo
     */
    // 保存图片至本地，方法见下文
//    [self saveImage:image withName:@"currentImage.png"];
//    
//    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
//    
//    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
//    
//    isFullScreen = NO;
//    [self.imageView setImage:savedImage];
//    
//    self.imageView.tag = 100;
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	[self dismissViewControllerAnimated:YES completion:^{}];
}




-(void)done{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
//    [self dismissViewControllerAnimated:YES completion:^(void){
//        
//        
//    }];

//    NewTaskViewController *first = [[NewTaskViewController alloc]init];
//    first.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    [self presentViewController:first animated:YES completion:^(void){}];
   
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
