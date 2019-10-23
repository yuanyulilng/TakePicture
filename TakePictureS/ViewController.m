//
//  ViewController.m
//  TakePictureS
//
//  Created by 袁玉灵 on 2019/3/11.
//  Copyright © 2019年 袁玉灵. All rights reserved.
//

#import "ViewController.h"
#import <GPUImage.h>
#import "RatioView.h"
#import "GroupFilter.h"
#import "UIView+Category.h"
#import "GPUImageBeautifyFilter.h"
#import <AVFoundation/AVFoundation.h>
#define  SCREENWith [UIScreen mainScreen].bounds.size.width
#define  SCREENHeight [UIScreen mainScreen].bounds.size.height
///闪光灯状态
typedef NS_ENUM(NSInteger, CameraManagerFlashMode) {
    
    CameraManagerFlashModeAuto, /**<自动*/
    
    CameraManagerFlashModeOff, /**<关闭*/
    
    CameraManagerFlashModeOn /**<打开*/
};
@interface ViewController ()<CAAnimationDelegate,UIGestureRecognizerDelegate>
{
    GPUImageStillCamera *_stillCamera;
    CALayer *_focusLayer; //聚焦层
    AVPlayer *_avplayer;
}
@property (weak, nonatomic) IBOutlet UIButton *biliButton;
@property (weak, nonatomic) IBOutlet UIButton *shanguangdengButton;
@property (weak, nonatomic) IBOutlet UIButton *shexiangtouButton;
@property (weak, nonatomic) IBOutlet UIButton *zhaoxiangButton;
@property (weak, nonatomic) IBOutlet UIButton *lvjingButton;
@property (weak, nonatomic) IBOutlet GPUImageView *yulanView;
/**<#注释#> */
@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic , assign) CGFloat beginGestureScale;//开始的缩放比例
@property (nonatomic , assign) CGFloat effectiveScale;//最后的缩放比例

@property (nonatomic , assign) CameraManagerFlashMode flashMode;

/**比例 */
@property (nonatomic,strong) RatioView *ratioView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *yulanViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *yulanViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *yulanViewTop;

/**滤镜数组 */
@property (nonatomic,strong) NSArray *filterArr;

/**标记当前的比例**/
@property (nonatomic , assign) NSInteger biliFlag;
/**标记当前滤镜**/
@property (nonatomic , assign) NSInteger lvjingFlag;

@end

@implementation ViewController
-(NSArray *)filterArr{
    if (_filterArr == nil) {
        
        _filterArr = @[[GroupFilter IFImage],
                       [GroupFilter IF1977],
                       [GroupFilter IFBrannan],
                       [GroupFilter IFWalden],
                       [GroupFilter IFSierra],
                       [GroupFilter IFEarlybird],
                       [GroupFilter IFRiseFilter],
                       [GroupFilter IFHudson],
                       [GroupFilter IFValencia],
                       [GroupFilter IFToaster],
                       [GroupFilter IFInkwell],
                       [GroupFilter IFAmaro],
                       [GroupFilter IFXproll],
                       [GroupFilter IFLordKelvin],
                       [GroupFilter IFLomofi],
                       [GroupFilter IFSutro],
                       [GroupFilter IFHefe],
                       [GroupFilter IFNormal],
                       [GroupFilter IFNashville]
                       ];
    }
    return _filterArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _biliFlag = 0;
    _lvjingFlag = 0;
    
    self.yulanView.fillMode = kGPUImageFillModePreserveAspectRatioAndFill;
    self.yulanViewWidth.constant = SCREENWith;
    self.yulanViewHeight.constant = SCREENHeight;
    
    //聚焦
    [self setfocusImage:[UIImage imageNamed:@"touch_focus_x"]];//初始化聚焦图片
    //初始化开始及结束的缩放比例都为1.0
    [self setBeginGestureScale:1.0f];
    [self setEffectiveScale:1.0f];
  
    //初始化闪光灯模式为Auto
    [self setFlashMode:CameraManagerFlashModeAuto];
    
    [self.shexiangtouButton setTitle:@"后置" forState:UIControlStateNormal];
    [self.shexiangtouButton setTitle:@"前置" forState:UIControlStateSelected];
    self.shexiangtouButton.selected = YES;
    
    //比例
    self.ratioView = [[RatioView alloc]initWithFrame:CGRectMake(-290,60, 290, 60)];
    self.ratioView.hidden = YES;
    [self.view insertSubview:self.ratioView aboveSubview:self.yulanView];


    _stillCamera = [[GPUImageStillCamera alloc]initWithSessionPreset:AVCaptureSessionPresetPhoto cameraPosition:AVCaptureDevicePositionBack];
    _stillCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    _stillCamera.horizontallyMirrorFrontFacingCamera = YES;//设置是否为镜像
    _stillCamera.horizontallyMirrorRearFacingCamera = NO;
   [_stillCamera addTarget:self.filterArr.firstObject];
   [self.filterArr.firstObject addTarget:self.yulanView];
    [_stillCamera startCameraCapture];
    //设置闪光灯
    [self setFlashMode:CameraManagerFlashModeAuto];
    
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(10,self.view.bounds.size.height  , self.view.bounds.size.width - 20, 150)];
   //
   // self.scrollView.backgroundColor = [UIColor redColor];
    [self.view insertSubview:self.scrollView aboveSubview:self.yulanView];
    self.scrollView.contentSize = CGSizeMake(2100, 130);
    
    for (int i = 0; i< 19; i++) {
        GPUImageView *gpuImage = [[GPUImageView alloc]initWithFrame:CGRectMake(10 +110 * i, 10, 100, 130)];
        gpuImage.backgroundColor = [UIColor greenColor];
        [self.scrollView addSubview:gpuImage];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gpuImageTapAction:)];
        [gpuImage addGestureRecognizer:tap];
        gpuImage.tag = 100 + i;
            [_stillCamera addTarget:self.filterArr[i]];
            [self.filterArr[i] addTarget:gpuImage] ;
    }
    
}
-(void)gpuImageTapAction:(UITapGestureRecognizer *)tap{
    NSInteger index = tap.view.tag - 100;
    
       // [_stillCamera removeTarget:_stillCamera.targets.firstObject];
    [_stillCamera removeAllTargets];
        [_stillCamera addTarget:self.filterArr[index] atTextureLocation:0];
        [self.filterArr[index] addTarget:self.yulanView];
   

    
    
    
    _lvjingFlag = index;
}

- (IBAction)xiangjiButtong:(UIButton *)sender {
    
    
    [_stillCamera capturePhotoAsImageProcessedUpToFilter:self.filterArr[_lvjingFlag] withCompletionHandler:^(UIImage *processedImage, NSError *error) {
       // NSLog(@"image:%@",processedImage);
        //NSLog(@"error:%@",error);
        //创建图片上下文
       
        CGSize size = CGSizeMake(self.yulanView.frame.size.width, self.yulanView.frame.size.height);
        UIGraphicsBeginImageContextWithOptions(size, NO, 0);
      
        if (self->_biliFlag == 1) {
            //绘制边框的圆
            
            CGContextRef context = UIGraphicsGetCurrentContext();
            
             CGContextAddEllipseInRect(context, CGRectMake(0, 0, size.width, size.height));
            //剪切可视范围
            
             CGContextClip(context);
        }
        //绘制头像
        
        [processedImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
 
        //取出整个图片上下文的图片
        
        UIImage *iconImage = UIGraphicsGetImageFromCurrentImageContext();
       
        UIImageWriteToSavedPhotosAlbum(iconImage, nil, nil, nil);
        
       
    }];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"photoShutter2" ofType:@"caf"];
    NSURL *urll = [NSURL fileURLWithPath:path];
    _avplayer = [[AVPlayer alloc]initWithURL:urll];
    [_avplayer play];
    
}
- (IBAction)shexiangtouButton:(UIButton *)sender {
    [_stillCamera rotateCamera];
    sender.selected = !sender.selected;
}
//比例
- (IBAction)biliButton:(UIButton *)sender {
    self.ratioView.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.ratioView.frame = CGRectMake(20, CGRectGetMaxY(self.biliButton.frame) , 290, 60);
    }];
    [self.ratioView.full addTarget:self action:@selector(fullRatioButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.ratioView.chang addTarget:self action:@selector(fullRatioButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.ratioView.fang addTarget:self action:@selector(fullRatioButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.ratioView.yuan addTarget:self action:@selector(fullRatioButton:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)hideRatio{
    [UIView animateWithDuration:0.3 animations:^{
        self.ratioView.frame = CGRectMake(-290, 60 , 290, 60);
    }];
    self.ratioView.hidden = YES;
}
-(void)fullRatioButton:(UIButton *)sender{
    
    if ([sender.titleLabel.text isEqualToString:@"full"]) {
        self.yulanViewWidth.constant = SCREENWith;
        self.yulanViewHeight.constant = SCREENHeight;
        self.yulanViewTop.constant = 0;

        self.biliButton.titleLabel.text = @"full";
        self.yulanView.layer.cornerRadius = 0;
        self.yulanView.layer.masksToBounds = NO;
        _biliFlag = 0;
        
        [self hideRatio];
        
    }else if ([sender.titleLabel.text isEqualToString:@"3:4"]){
        self.yulanViewWidth.constant = SCREENWith;
        self.yulanViewHeight.constant = SCREENWith*4/3;
        self.yulanViewTop.constant = 60;
        _biliButton.titleLabel.text = @"3:4";
        self.yulanView.layer.cornerRadius = 0;
        self.yulanView.layer.masksToBounds = NO;
        _biliFlag = 0;
        [self hideRatio];
        
        
    }else if ([sender.titleLabel.text isEqualToString:@"1:1"]){
        self.yulanViewWidth.constant = SCREENWith;
        self.yulanViewHeight.constant = SCREENWith;
        self.yulanViewTop.constant = 60;

        _biliButton.titleLabel.text = @"1:1";
        self.yulanView.layer.cornerRadius = 0;
        self.yulanView.layer.masksToBounds = NO;
        _biliFlag = 0;
        [self hideRatio];
        
        
        
    }else if ([sender.titleLabel.text isEqualToString:@"圆"]){
        self.yulanViewWidth.constant = SCREENWith;
        self.yulanViewHeight.constant = SCREENWith;
        self.yulanViewTop.constant = 60;

        _biliButton.titleLabel.text = @"圆";
        self.yulanView.layer.cornerRadius = SCREENWith/2;
        self.yulanView.layer.masksToBounds = YES;
        _biliFlag = 1;
        [self hideRatio];
        
        
    }else{
        
    }
    
    
}

- (IBAction)lvjingButton:(UIButton *)sender {
    
 
    if (self.scrollView.y == self.view.bounds.size.height) {
        [UIView animateWithDuration:0.5 animations:^{
            self.scrollView.frame  = CGRectMake(10,self.view.bounds.size.height -160  , self.view.bounds.size.width - 20, 150);
         
        }];
        [self.lvjingButton setTitle:@"滤镜关闭" forState:UIControlStateNormal];
    }else if (self.scrollView.y == self.view.bounds.size.height - 160){
        [UIView animateWithDuration:0.5 animations:^{
            self.scrollView.frame =CGRectMake(10,self.view.bounds.size.height  , self.view.bounds.size.width - 20, 150);
          
        }];
        [self.lvjingButton setTitle:@"滤镜" forState:UIControlStateNormal];

    }
  
}
- (IBAction)shangguangdengButton:(UIButton *)sender {
    [self changeFlashMode:_shanguangdengButton];
}
- (void)setFlashMode:(CameraManagerFlashMode)flashMode {
    _flashMode = flashMode;
    
    switch (flashMode) {
        case CameraManagerFlashModeAuto: {
            [_stillCamera.inputCamera lockForConfiguration:nil];
            if ([_stillCamera.inputCamera isFlashModeSupported:AVCaptureFlashModeAuto]) {
                [_stillCamera.inputCamera setFlashMode:AVCaptureFlashModeAuto];
               
            }
            [_stillCamera.inputCamera unlockForConfiguration];
        }
            break;
        case CameraManagerFlashModeOff: {
            [_stillCamera.inputCamera lockForConfiguration:nil];
            [_stillCamera.inputCamera setFlashMode:AVCaptureFlashModeOff];
            [_stillCamera.inputCamera unlockForConfiguration];
        }
            
            break;
        case CameraManagerFlashModeOn: {
            [_stillCamera.inputCamera lockForConfiguration:nil];
            [_stillCamera.inputCamera setFlashMode:AVCaptureFlashModeOn];
            [_stillCamera.inputCamera unlockForConfiguration];
        }
            break;
            
        default:
            break;
    }
}
#pragma mark 改变闪光灯状态
- (void)changeFlashMode:(UIButton *)button {
    switch (self.flashMode) {
        case CameraManagerFlashModeAuto:
            self.flashMode = CameraManagerFlashModeOn;
            //[button setImage:[UIImage imageNamed:@"flashing_on"] forState:UIControlStateNormal];
            [self.shanguangdengButton setTitle:@"打开" forState:UIControlStateNormal];
            break;
        case CameraManagerFlashModeOff:
            self.flashMode = CameraManagerFlashModeAuto;
            //[button setImage:[UIImage imageNamed:@"flashing_auto"] forState:UIControlStateNormal];
            [self.shanguangdengButton setTitle:@"自动" forState:UIControlStateNormal];
            
            break;
        case CameraManagerFlashModeOn:
            self.flashMode = CameraManagerFlashModeOff;
            // [button setImage:[UIImage imageNamed:@"flashing_off"] forState:UIControlStateNormal];
            [self.shanguangdengButton setTitle:@"关闭" forState:UIControlStateNormal];
            
            break;
            
        default:
            break;
    }
}
//设置聚焦图片
- (void)setfocusImage:(UIImage *)focusImage {
    if (!focusImage) return;
    
    if (!_focusLayer) {
        //增加tap手势，用于聚焦及曝光
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(focus:)];
        [self.yulanView addGestureRecognizer:tap];
        //增加pinch手势，用于调整焦距
        UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(focusDisdance:)];
        [self.yulanView addGestureRecognizer:pinch];
        pinch.delegate = self;
    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, focusImage.size.width, focusImage.size.height)];
    imageView.image = focusImage;
    CALayer *layer = imageView.layer;
    layer.hidden = YES;
    [self.yulanView.layer addSublayer:layer];
    _focusLayer = layer;
    
}
//调整焦距方法
-(void)focusDisdance:(UIPinchGestureRecognizer*)pinch {
    self.effectiveScale = self.beginGestureScale * pinch.scale;
    if (self.effectiveScale < 1.0f) {
        self.effectiveScale = 1.0f;
    }
    CGFloat maxScaleAndCropFactor = 3.0f;//设置最大放大倍数为3倍
    if (self.effectiveScale > maxScaleAndCropFactor)
        self.effectiveScale = maxScaleAndCropFactor;
    [CATransaction begin];
    [CATransaction setAnimationDuration:.025];
    NSError *error;
    if([_stillCamera.inputCamera lockForConfiguration:&error]){
        [_stillCamera.inputCamera setVideoZoomFactor:self.effectiveScale];
        [_stillCamera.inputCamera unlockForConfiguration];
    }
    else {
      //  NSLog(@"ERROR = %@", error);
    }
    
    [CATransaction commit];
}
//手势代理方法
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ( [gestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]] ) {
        self.beginGestureScale = self.effectiveScale;
    }
    return YES;
}
//对焦方法
- (void)focus:(UITapGestureRecognizer *)tap {
    self.yulanView.userInteractionEnabled = NO;
    CGPoint touchPoint = [tap locationInView:tap.view];
    // CGContextRef *touchContext = UIGraphicsGetCurrentContext();
    [self layerAnimationWithPoint:touchPoint];
    /**
     *下面是照相机焦点坐标轴和屏幕坐标轴的映射问题，这个坑困惑了我好久，花了各种方案来解决这个问题，以下是最简单的解决方案也是最准确的坐标转换方式
     */
    if(_stillCamera.cameraPosition == AVCaptureDevicePositionBack){
        touchPoint = CGPointMake( touchPoint.y /tap.view.bounds.size.height ,1-touchPoint.x/tap.view.bounds.size.width);
    }
    else
        touchPoint = CGPointMake(touchPoint.y /tap.view.bounds.size.height ,touchPoint.x/tap.view.bounds.size.width);
    /*以下是相机的聚焦和曝光设置，前置不支持聚焦但是可以曝光处理，后置相机两者都支持，下面的方法是通过点击一个点同时设置聚焦和曝光，当然根据需要也可以分开进行处理
     */
    if([_stillCamera.inputCamera isExposurePointOfInterestSupported] && [_stillCamera.inputCamera isExposureModeSupported:AVCaptureExposureModeContinuousAutoExposure])
    {
        NSError *error;
        if ([_stillCamera.inputCamera lockForConfiguration:&error]) {
            [_stillCamera.inputCamera setExposurePointOfInterest:touchPoint];
            [_stillCamera.inputCamera setExposureMode:AVCaptureExposureModeContinuousAutoExposure];
            if ([_stillCamera.inputCamera isFocusPointOfInterestSupported] && [_stillCamera.inputCamera isFocusModeSupported:AVCaptureFocusModeAutoFocus]) {
                [_stillCamera.inputCamera setFocusPointOfInterest:touchPoint];
                [_stillCamera.inputCamera setFocusMode:AVCaptureFocusModeAutoFocus];
            }
            [_stillCamera.inputCamera unlockForConfiguration];
        } else {
           // NSLog(@"ERROR = %@", error);
        }
    }
}

//对焦动画
- (void)layerAnimationWithPoint:(CGPoint)point {
    if (_focusLayer) {
        ///聚焦点聚焦动画设置
        CALayer *focusLayer = _focusLayer;
        focusLayer.hidden = NO;
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        [focusLayer setPosition:point];
        focusLayer.transform = CATransform3DMakeScale(2.0f,2.0f,1.0f);
        [CATransaction commit];
        
        CABasicAnimation *animation = [ CABasicAnimation animationWithKeyPath: @"transform" ];
        animation.toValue = [ NSValue valueWithCATransform3D: CATransform3DMakeScale(1.0f,1.0f,1.0f)];
        animation.delegate = self;
        animation.duration = 0.3f;
        animation.repeatCount = 1;
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        [focusLayer addAnimation: animation forKey:@"animation"];
    }
}

//动画的delegate方法
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    //    1秒钟延时
    [self performSelector:@selector(focusLayerNormal) withObject:self afterDelay:0.5f];
}
//focusLayer回到初始化状态
- (void)focusLayerNormal {
    self.yulanView.userInteractionEnabled = YES;
    _focusLayer.hidden = YES;
}


@end
