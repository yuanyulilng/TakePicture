//
//  GroupFilter.h
//  TakePictureS
//
//  Created by 袁玉灵 on 2019/3/13.
//  Copyright © 2019年 袁玉灵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GPUImage.h"
#import "IF1977Filter.h"
#import "IFBrannanFilter.h"
#import "IFWaldenFilter.h"
#import "IFSierraFilter.h"
#import "IFEarlybirdFilter.h"
#import "IFRiseFilter.h"
#import "IFImageFilter.h"
#import "IFHudsonFilter.h"
#import "IFValenciaFilter.h"
#import "IFToasterFilter.h"
#import "IFInkwellFilter.h"
#import "IFAmaroFilter.h"
#import "IFXproIIFilter.h"
#import "IFLordKelvinFilter.h"
#import "IFLomofiFilter.h"
#import "IFSutroFilter.h"
#import "IFHefeFilter.h"
#import "IFNormalFilter.h"
#import "IFNashvilleFilter.h"
NS_ASSUME_NONNULL_BEGIN

@interface GroupFilter : NSObject
+(GPUImageFilterGroup *)IF1977;
+(GPUImageFilterGroup *)IFBrannan;
+(GPUImageFilterGroup *)IFWalden;
+(GPUImageFilterGroup *)IFSierra;
+(GPUImageFilterGroup *)IFEarlybird;
+(GPUImageFilterGroup *)IFRiseFilter;
+(GPUImageFilterGroup *)IFImage;
+(GPUImageFilterGroup *)IFHudson;
+(GPUImageFilterGroup *)IFValencia;
+(GPUImageFilterGroup *)IFToaster;
+(GPUImageFilterGroup *)IFInkwell;
+(GPUImageFilterGroup *)IFAmaro;
+(GPUImageFilterGroup *)IFXproll;
+(GPUImageFilterGroup *)IFLordKelvin;
+(GPUImageFilterGroup *)IFLomofi;
+(GPUImageFilterGroup *)IFSutro;
+(GPUImageFilterGroup *)IFHefe;
+(GPUImageFilterGroup *)IFNormal;
+(GPUImageFilterGroup *)IFNashville;
@end

NS_ASSUME_NONNULL_END
