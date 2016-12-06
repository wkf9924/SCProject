//
//  MyconveniencestoreViewController.m
//  BMProject
//
//  Created by xa on 15/11/6.
//  Copyright © 2015年 王凯锋. All rights reserved.
//
#define ORIGINAL_MAX_WIDTH 640.0f
#import "MyconveniencestoreViewController.h"
#import "NJImageCropperViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "AppConfigure.h"
#import "UIImage+Addition.h"

@interface MyconveniencestoreViewController ()<NJImageCropperDelegate,UINavigationControllerDelegate>
{
    NSDictionary *dic;
    NSString *imageurl;
}

@end

@implementation MyconveniencestoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"便利店信息";
    [self setBackBarButton];
    self.myImage.image = [UIImage imageNamed:@"user"];
    self.myImage.layer.cornerRadius = 40;
    self.myImage.layer.masksToBounds = YES;
    
    dic = [NSDictionary dictionary];
    //获取用户详情
    [self userDetailAction];

    self.lable.backgroundColor = [UIColor grayColor];
    self.mymessageTableView.tableFooterView = [[UIView alloc]init];
    UITapGestureRecognizer *gesrecog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TextTapGes)];
    gesrecog.cancelsTouchesInView = NO;
    [self.myView  addGestureRecognizer:gesrecog];

  }

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self loadingImageView];
    //这里请求数据是为了刷新用户详情数据去除logourl
//    [self userDetailAction];
}

#pragma mark -- 获取用户详情

- (void)userDetailAction {
    if ([COM byUserName].length == 0) {
        [self TextTapGes];
        return;
    }
    NSString *storeId = [COM byStoreId];
    if (storeId.length == 0) {
        return;
    }
    //封装参数
    NSDictionary *dict = @{@"storeId" : storeId};
    
    //装成json字符串
    NSString *stringJson = [JSONFunction jsonStringWithNSDictionary:dict];
    NSDictionary *jsonDic = @{@"mData" : stringJson};
    
    //拼接链接
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER, STOREDETAILS];
    
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:jsonDic UrlStr:url andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {
            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
                NSDictionary *resultDic = responseData[@"result"];
                if (![resultDic isKindOfClass:[NSDictionary class]]) {
                    self.mymessageTableView.dataSource = self;
                    self.mymessageTableView.delegate  =  self;
                    [self.mymessageTableView  reloadData];
                    
                    return;
                }
                dic = [NSDictionary dictionaryWithDictionary:resultDic];
                NSString *logoURL = dic[@"storeLogoUrl"];
                NSString *urlString = [NSString stringWithFormat:@"%@%@", kSERVER_IMAGE_LOGO, logoURL];
                [_myImage setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:PNGIMAGE(@"")];
                self.mymessageTableView.dataSource = self;
                self.mymessageTableView.delegate  =  self;
                [self.mymessageTableView  reloadData];
            }else {
            }
        }else{
        }
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *rouse = @"MyCell";
    UITableViewCell *cell = [self.mymessageTableView dequeueReusableCellWithIdentifier:rouse];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:rouse];
    }
    
    //cell.textLabel.highlightedTextColor = [UIColor redColor];
   
    cell.detailTextLabel.font = [UIFont fontWithName:@"Arial" size:15.0f];
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:17.0f];
    NSInteger row = indexPath.row;
    switch (row) {
        case 0:// 便利店名称
        {
            
          
            cell.textLabel.text = @"便利店名称";
            cell.detailTextLabel.text = dic[@"storeName"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
           
            
        }
            break;
            
        case 1: // 便利店地址
            
        {
            cell.textLabel.text =@"便利店地址";;
            cell.detailTextLabel.text = dic[@"storeAddr"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
           
            break;
            
        case 2: // 便利店地址
            
        {
            
            
            cell.textLabel.text =@"便利店电话";;
            cell.detailTextLabel.text = dic[@"phone"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
            
            break;
     
        default:
            break;
    }
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        
        switch (indexPath.row) {
            case 0:
                [self.navigationController pushViewController:[[ConSroreNameViewController alloc]init] animated:YES];
                break;
                
            case 1:
                [self.navigationController pushViewController:[[AddressViewController alloc]init] animated:YES];
                break;
                
            case 2:{
                
                mAlertView(@"警告", @"此号码作为登陆账号，不能修改");
               
            }
                break;
                
                
            default:
                break;
                
        }
    }
    
}

-(void)TextTapGes{
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册中选取", nil];
    [choiceSheet showInView:self.view];
  
}

#pragma mark VPImageCropperDelegate
- (void)imageCropper:(NJImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage {
     self.myImage.image = editedImage;
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
        // TO DO
         [self subImage:self.myImage.image];
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

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^(){
    }];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@",kSERVER_IMAGE,kLOGOURL];
    //    //    [[iToast makeToast: @"正在上传证照"]show];
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:parameters UrlStr:urlString andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {
            
            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
                NSString *imageUrl = responseData[@"url"];
                [self submitAction:imageUrl];
            }
        }else{
        }
    }];
    
}


#pragma mark -- 上传图片

- (void)submitAction: (NSString *)imageUrl{
    
    NSString *username = [COM byUserName];
//    NSString *username = @"18715986524";
    NSDictionary *dict = @{
                           @"phone": username,
                           @"storeLogoUrl":imageUrl
                           };
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSString *stringJson = [dict toJsonString];
    [dictionary setValue:stringJson forKey:@"mData"];
    [dictionary setValue:@"1" forKey:@"loginType"]; //1w为便利店 0为用户
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,kUPLOAD_PHOTO];
    
    [[BM_NetAPIManager sharedManager]request_WithParamsPost:dictionary UrlStr:url andBlock:^(id responseData, NSError *error) {
        if (responseData)
        {
            BOOL result = [responseData[@"success"] boolValue];
            if (result == YES) {
                ITOAST_ALERT(@"上传成功");
                imageurl = responseData[@"result"][@"storeLogoUrl"];
                //获取数据加载便利店logo
                [self userDetailAction];
            }
        }else{
        }
    }];
}

- (void)loadingImageView {
    NSString *urlString = [NSString stringWithFormat:@"%@%@", kSERVER_IMAGE, imageurl];
    [_myImage setImageWithURL:[NSURL URLWithString:urlString]];
}


- (NSString *)encodeBase64:(NSData *)data{
    //转换到base64
    data = [GTMBase64 encodeData:data];
    NSString * base64String = [[NSString alloc] initWithData:data
                                                    encoding:NSUTF8StringEncoding];
    return base64String;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
