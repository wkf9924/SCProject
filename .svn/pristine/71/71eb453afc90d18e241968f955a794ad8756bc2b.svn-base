





//
//  RegVC.m
//  BMProject
//
//  Created by WangKaifeng on 15/11/24.
//  Copyright © 2015年 王凯锋. All rights reserved.
//

#import "RegVC.h"
#import "UIImage+Addition.h"
#import "LoginVC.h"
#import "SetupViewController.h"
#import "NJImageCropperViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "GTMDefines.h"
#import "GTMBase64.h"
#import "UIImage+Size.h"

#define ORIGINAL_MAX_WIDTH 640.0f

@interface RegVC () <UIActionSheetDelegate,UIImagePickerControllerDelegate,NJImageCropperDelegate,UINavigationControllerDelegate> {
    
    NSInteger type;
    NSString *imageUrl;  //店铺图片
    NSString *licImageUrl;  //执照图片
    NSString *latitude;
    NSString *longitude;
}

@property (weak, nonatomic) IBOutlet UITextField *shopName;
@property (weak, nonatomic) IBOutlet UITextField *tfShopAddress;
@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;
@property (weak, nonatomic) IBOutlet UIImageView *LicenseImageView;


- (IBAction)submit:(id)sender;
@end

@implementation RegVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackBarButton];
    
    self.title = @"审核注册";
    type = -1;
    //店铺图片
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shopImageViewAction)];
    //将触摸事件添加到当前view
    [self.shopImageView addGestureRecognizer:tapGestureRecognizer];
    
    //营业执照
    UITapGestureRecognizer *tapGestureRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(licenseImageViewAciton)];
    //将触摸事件添加到当前view
    [self.LicenseImageView addGestureRecognizer:tapGestureRecognizer1];
    
    self.shopImageView.userInteractionEnabled = YES;
    self.LicenseImageView.userInteractionEnabled = YES;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submit:(id)sender {
    
    
    if(_shopName.text.length == 0 || _tfShopAddress.text.length == 0 ){
        
        mAlertView(@"警告", @"信息不能为空");
    }
    
    [self address];
    
}


#pragma mark -- 上传执照
- (void)licenseImageViewAciton {
    
    type = 1;
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册中选取", nil];
    [choiceSheet showInView:self.view];
    
}
#pragma mark -- 上传店铺图片
-(void)shopImageViewAction {
    
    type = 0;
//    if ([COM byUserName].length == 0) {
//        
//        [self mySignin:nil];
//        return;
//    }
    
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册中选取", nil];
    [choiceSheet showInView:self.view];
}

#pragma mark VPImageCropperDelegate
- (void)imageCropper:(NJImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage {
    switch (type) {
        case 0:
            //便利店logo
            self.shopImageView.image = editedImage;
            break;
        case 1:
            //营业执照
            self.LicenseImageView.image = editedImage;
            break;
            
        default:
            break;
    }
    
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
        // TO DO
        NSLog(@"选中图片了开始操作");
        [self subImage:self.shopImageView.image];
        
    }];
}

- (void)imageCropperDidCancel:(NJImageCropperViewController *)cropperViewController {
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
    }];
}


#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        // 拍照
        if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]) {
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
            controller.sourceType = UIImagePickerControllerSourceTypeCamera;
            if ([self isFrontCameraAvailable]) {
                controller.cameraDevice = UIImagePickerControllerCameraDeviceFront;
            }
            NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
            [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
            controller.mediaTypes = mediaTypes;
            controller.delegate = self;
            [self presentViewController:controller
                               animated:YES
                             completion:^(void){
                                 NSLog(@"Picker View Controller is presented");
                             }];
        }
        
    } else if (buttonIndex == 1) {
        // 从相册中选取
        if ([self isPhotoLibraryAvailable]) {
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
            controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
            [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
            controller.mediaTypes = mediaTypes;
            controller.delegate = self;
            [self presentViewController:controller
                               animated:YES
                             completion:^(void){
                                 NSLog(@"Picker View Controller is presented");
                             }];
        }
    }
}

#pragma mark camera utility
- (BOOL) isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

- (BOOL) isFrontCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

- (BOOL) doesCameraSupportTakingPhotos {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickVideosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickPhotosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^() {
        UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        portraitImg = [self imageByScalingToMaxSize:portraitImg];
        // 裁剪
        NJImageCropperViewController *imgEditorVC = [[NJImageCropperViewController alloc] initWithImage:portraitImg cropFrame:CGRectMake(0, 100.0f, self.view.frame.size.width, self.view.frame.size.width) limitScaleRatio:3.0];
        imgEditorVC.delegate = self;
        [self presentViewController:imgEditorVC animated:YES completion:^{
            // TO DO
        }];
    }];
}

#pragma mark image scale utility
- (UIImage *)imageByScalingToMaxSize:(UIImage *)sourceImage {
    if (sourceImage.size.width < ORIGINAL_MAX_WIDTH) return sourceImage;
    CGFloat btWidth = 0.0f;
    CGFloat btHeight = 0.0f;
    if (sourceImage.size.width > sourceImage.size.height) {
        btHeight = ORIGINAL_MAX_WIDTH;
        btWidth = sourceImage.size.width * (ORIGINAL_MAX_WIDTH / sourceImage.size.height);
    } else {
        btWidth = ORIGINAL_MAX_WIDTH;
        btHeight = sourceImage.size.height * (ORIGINAL_MAX_WIDTH / sourceImage.size.width);
    }
    CGSize targetSize = CGSizeMake(btWidth, btHeight);
    return [self imageByScalingAndCroppingForSourceImage:sourceImage targetSize:targetSize];
}

- (UIImage *)imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize {
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else
            if (widthFactor < heightFactor)
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil) NSLog(@"could not scale image");
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^(){
    }];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}


#pragma mark --  上传图像
- (void)subImage:(UIImage *)image
{
    NSLog(@"原始图片 %f", RectWidth(image));
    /*
     ios中获取图片的方法有两种，一种是UIImageJPEGRepresentation ，一种是UIImagePNGRepresentation
     前者获取到图片的数据量要比后者的小很多。。
     */
    //    UIImage *im = [UIImage imageNamed:@"color_blue"];//通过path图片路径获取图片
    UIImage *smallImage = [UIImage scaleImage:image toSize:CGSizeMake(RectWidth(image)/2, RectHeight(image)/2)];
    
    //    UIImage *smallImage = [UIImage scaleImage:image toSize:CGSizeMake(320,320)];
    
    NSLog(@"压缩有的图片 %f", RectWidth(smallImage));
    NSData *data = UIImagePNGRepresentation(smallImage);//获取图片数据
    NSMutableData *imageData = [NSMutableData dataWithData:data];//
    
    NSString *imgBase64String = [self encodeBase64:imageData];
    
    //    NSString *str = [JSONFunction jsonStringWithNSDictionary:com];
    
    NSDictionary *parameters = @{
                                 @"type":@"img",
                                 @"fileExt":@".png",
                                 @"attachment":imgBase64String,
                                 };
    
//    if (type == 0) { //上传店铺图片
//        <#statements#>
//    }
//    else { //执照
//        
//    }
    NSString *urlString = [NSString stringWithFormat:@"%@%@",kSERVER_IMAGE,kLOGOURL];
    //    //    [[iToast makeToast: @"正在上传证照"]show];
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:parameters UrlStr:urlString andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {
            
            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
                NSString *urlImageString = responseData[@"url"];
                if (type == 0) {
                    imageUrl = urlImageString;
                    
                }
                else {
                    licImageUrl = urlImageString;
                }
//                [self submitAction:urlImageString];
            }
        }else{
        }
    }];
}


//地址解析经纬度
-(void)address{
    
    NSString *oreillyAddress = _tfShopAddress.text;  //测试使用中文也可以找到经纬度具体的可以多尝试看看~
    
    CLGeocoder *myGeocoder = [[CLGeocoder alloc] init];
    
    [myGeocoder geocodeAddressString:oreillyAddress completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if ([placemarks count] > 0 && error == nil)
            
        {
            
            NSLog(@"Found %lu placemark(s).", (unsigned long)[placemarks count]);
            
            CLPlacemark *firstPlacemark = [placemarks objectAtIndex:0];
            
            latitude = [NSString stringWithFormat:@"%f",firstPlacemark.location.coordinate.latitude];
            
            longitude = [NSString stringWithFormat:@"%f",firstPlacemark.location.coordinate.longitude];
            
            NSLog(@"Longitude = %f", firstPlacemark.location.coordinate.longitude);
            
            NSLog(@"Latitude = %f", firstPlacemark.location.coordinate.latitude);
            
            [self submitAction:nil];
            
        }
        
        else if ([placemarks count] == 0 && error == nil)
            
        {
            
            NSLog(@"Found no placemarks.");
            
        }
        
        else if (error != nil)
            
        {
            
            NSLog(@"An error occurred = %@", error);
            
        }
        
    }];

}

//定位
-(void)Location{
    
    
    
    
    
    
    
}

#pragma mark -- 提交资料
- (void)submitAction: (NSString *)imageUrlString{
    
    if (latitude.length == 0 || longitude.length == 0) {
        return;
    }
    
    NSString *username = [COM byUserName];
    NSString *storeid = [COM byStoreId];
    NSDictionary *latlong =   [COM byLatitudeOrLongitude];
    NSString *latString = latlong[@"lat"];
    NSString *longStirng = latlong[@"long"];
    //    NSString *username = @"18712365478";
    NSDictionary *dict = @{
                           @"storeId"   : storeid,
                           @"storeName" : _shopName.text, //便利店名称
                           @"storeAddr" : _tfShopAddress.text, //便利店地址
                           @"phone" : username,
                           @"qrCode" : @"dddddddddd",
                           @"storeLogoUrl":imageUrl, //便利店图片
                           @"licenseCode" : licImageUrl,
                           @"regDate" : @"2015-11-12",
                           @"latitude" : latString,
                           @"longitude": longStirng
                           };
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSString *stringJson = [dict toJsonString];
    [dictionary setValue:stringJson forKey:@"mData"];
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,ADDSTOREINFO];
    
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:dictionary UrlStr:url andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {
            
            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
            
                ITOAST_ALERT(@"上传成功");
                [self backHome:nil];
                return;
            }
            
            ITOAST_ALERT(@"上传失败");
        }else{
            
        }
    }];
}


- (NSString *)encodeBase64:(NSData *)data{
    //转换到base64
    data = [GTMBase64 encodeData:data];
    NSString * base64String = [[NSString alloc] initWithData:data
                                                    encoding:NSUTF8StringEncoding];
    return base64String;
}

@end
