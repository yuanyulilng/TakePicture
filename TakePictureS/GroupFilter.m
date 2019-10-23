//
//  GroupFilter.m
//  TakePictureS
//
//  Created by 袁玉灵 on 2019/3/13.
//  Copyright © 2019年 袁玉灵. All rights reserved.
//

#import "GroupFilter.h"
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
#import "GPUImageBeautifyFilter.h"

@implementation GroupFilter
+(GPUImageFilterGroup *)IF1977{
     IF1977Filter *filter = [[IF1977Filter alloc] init]; //默认
    GPUImageBeautifyFilter *beauty = [[GPUImageBeautifyFilter alloc]init];

    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    [(GPUImageFilterGroup *) group setInitialFilters:[NSArray arrayWithObjects:beauty,filter,nil]];
    [(GPUImageFilterGroup *) group setTerminalFilter:filter];
    return group;
}
+(GPUImageFilterGroup *)IFBrannan{
    IFBrannanFilter *filter = [[IFBrannanFilter alloc] init]; //默认
    GPUImageBeautifyFilter *beauty = [[GPUImageBeautifyFilter alloc]init];

    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    [(GPUImageFilterGroup *) group setInitialFilters:[NSArray arrayWithObjects:beauty,  filter,nil]];
    [(GPUImageFilterGroup *) group setTerminalFilter:filter];
    return group;
}
+(GPUImageFilterGroup *)IFWalden{
    IFWaldenFilter *filter = [[IFWaldenFilter alloc] init]; //默认
    GPUImageBeautifyFilter *beauty = [[GPUImageBeautifyFilter alloc]init];

    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    [(GPUImageFilterGroup *) group setInitialFilters:[NSArray arrayWithObjects:beauty,filter,nil]];
    [(GPUImageFilterGroup *) group setTerminalFilter:filter];
    return group;
}
+(GPUImageFilterGroup *)IFSierra{
    IFSierraFilter *filter = [[IFSierraFilter alloc] init]; //默认
    GPUImageBeautifyFilter *beauty = [[GPUImageBeautifyFilter alloc]init];

    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    [(GPUImageFilterGroup *) group setInitialFilters:[NSArray arrayWithObjects:beauty, filter,nil]];
    [(GPUImageFilterGroup *) group setTerminalFilter:filter];
    return group;
}
+( GPUImageFilterGroup *)IFEarlybird{
    IFEarlybirdFilter *filter = [[IFEarlybirdFilter alloc] init]; //默认
    GPUImageBeautifyFilter *beauty = [[GPUImageBeautifyFilter alloc]init];

    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    [(GPUImageFilterGroup *) group setInitialFilters:[NSArray arrayWithObjects:beauty, filter,nil]];
    [(GPUImageFilterGroup *) group setTerminalFilter:filter];
    return group;
}+(GPUImageFilterGroup *)IFRiseFilter{
    IFRiseFilter *filter = [[IFRiseFilter alloc] init]; //默认
    GPUImageBeautifyFilter *beauty = [[GPUImageBeautifyFilter alloc]init];

    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    [(GPUImageFilterGroup *) group setInitialFilters:[NSArray arrayWithObjects:beauty, filter,nil]];
    [(GPUImageFilterGroup *) group setTerminalFilter:filter];
    return group;
}
+(GPUImageFilterGroup *)IFImage{
    GPUImageBeautifyFilter *beauty = [[GPUImageBeautifyFilter alloc]init];

    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    [(GPUImageFilterGroup *) group setInitialFilters:[NSArray arrayWithObject:beauty]];
    [(GPUImageFilterGroup *) group setTerminalFilter:beauty];
    return group;
}
+(GPUImageFilterGroup *)IFHudson{
    IFHudsonFilter *filter = [[IFHudsonFilter alloc] init]; //默认
    GPUImageBeautifyFilter *beauty = [[GPUImageBeautifyFilter alloc]init];

    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    [(GPUImageFilterGroup *) group setInitialFilters:[NSArray arrayWithObjects:beauty, filter,nil]];
    [(GPUImageFilterGroup *) group setTerminalFilter:filter];
    return group;
}
+(GPUImageFilterGroup *)IFValencia{
    IFValenciaFilter *filter = [[IFValenciaFilter alloc] init]; //默认
    GPUImageBeautifyFilter *beauty = [[GPUImageBeautifyFilter alloc]init];

    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    [(GPUImageFilterGroup *) group setInitialFilters:[NSArray arrayWithObjects:beauty, filter,nil]];
    [(GPUImageFilterGroup *) group setTerminalFilter:filter];
    return group;
}+(GPUImageFilterGroup *)IFToaster{
    IFToasterFilter *filter = [[IFToasterFilter alloc] init]; //默认
    GPUImageBeautifyFilter *beauty = [[GPUImageBeautifyFilter alloc]init];

    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    [(GPUImageFilterGroup *) group setInitialFilters:[NSArray arrayWithObjects:beauty, filter,nil]];
    [(GPUImageFilterGroup *) group setTerminalFilter:filter];
    return group;
}+(GPUImageFilterGroup *)IFInkwell{
    IFInkwellFilter *filter = [[IFInkwellFilter alloc] init]; //默认
    GPUImageBeautifyFilter *beauty = [[GPUImageBeautifyFilter alloc]init];

    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    [(GPUImageFilterGroup *) group setInitialFilters:[NSArray arrayWithObjects:beauty, filter,nil]];
    [(GPUImageFilterGroup *) group setTerminalFilter:filter];
    return group;
}+(GPUImageFilterGroup *)IFAmaro{
    IFAmaroFilter *filter = [[IFAmaroFilter alloc] init]; //默认
    GPUImageBeautifyFilter *beauty = [[GPUImageBeautifyFilter alloc]init];

    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    [(GPUImageFilterGroup *) group setInitialFilters:[NSArray arrayWithObjects:beauty, filter,nil]];
    [(GPUImageFilterGroup *) group setTerminalFilter:filter];
    return group;
}
+(GPUImageFilterGroup *)IFXproll{
    IFXproIIFilter *filter = [[IFXproIIFilter alloc] init]; //默认
    GPUImageBeautifyFilter *beauty = [[GPUImageBeautifyFilter alloc]init];

    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    [(GPUImageFilterGroup *) group setInitialFilters:[NSArray arrayWithObjects:beauty, filter,nil]];
    [(GPUImageFilterGroup *) group setTerminalFilter:filter];
    return group;
}
+(GPUImageFilterGroup *)IFLordKelvin{
    IFLordKelvinFilter *filter = [[IFLordKelvinFilter alloc] init]; //默认
    GPUImageBeautifyFilter *beauty = [[GPUImageBeautifyFilter alloc]init];

    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    [(GPUImageFilterGroup *) group setInitialFilters:[NSArray arrayWithObjects:beauty, filter,nil]];
    [(GPUImageFilterGroup *) group setTerminalFilter:filter];
    return group;
}
+(GPUImageFilterGroup *)IFLomofi{
    IFLomofiFilter *filter = [[IFLomofiFilter alloc] init]; //默认
    GPUImageBeautifyFilter *beauty = [[GPUImageBeautifyFilter alloc]init];

    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    [(GPUImageFilterGroup *) group setInitialFilters:[NSArray arrayWithObjects:beauty, filter,nil]];
    [(GPUImageFilterGroup *) group setTerminalFilter:filter];
    return group;
}
+(GPUImageFilterGroup *)IFSutro{
    IFSutroFilter *filter = [[IFSutroFilter alloc] init]; //默认
    GPUImageBeautifyFilter *beauty = [[GPUImageBeautifyFilter alloc]init];

    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    [(GPUImageFilterGroup *) group setInitialFilters:[NSArray arrayWithObjects:beauty, filter,nil]];
    [(GPUImageFilterGroup *) group setTerminalFilter:filter];
    return group;
}+(GPUImageFilterGroup *)IFHefe{
    IFHefeFilter *filter = [[IFHefeFilter alloc] init]; //默认
    GPUImageBeautifyFilter *beauty = [[GPUImageBeautifyFilter alloc]init];

    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    [(GPUImageFilterGroup *) group setInitialFilters:[NSArray arrayWithObjects:beauty, filter,nil]];
    [(GPUImageFilterGroup *) group setTerminalFilter:filter];
    return group;
}
+(GPUImageFilterGroup *)IFNormal{
    IFNormalFilter *filter = [[IFNormalFilter alloc] init]; //默认
    GPUImageBeautifyFilter *beauty = [[GPUImageBeautifyFilter alloc]init];

    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    [(GPUImageFilterGroup *) group setInitialFilters:[NSArray arrayWithObjects:beauty, filter,nil]];
    [(GPUImageFilterGroup *) group setTerminalFilter:filter];
    return group;
}

+(GPUImageFilterGroup *)IFNashville{
    IFNashvilleFilter *filter = [[IFNashvilleFilter alloc] init]; //默认
    GPUImageBeautifyFilter *beauty = [[GPUImageBeautifyFilter alloc]init];

    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    [(GPUImageFilterGroup *) group setInitialFilters:[NSArray arrayWithObjects:beauty, filter,nil]];
    [(GPUImageFilterGroup *) group setTerminalFilter:filter];
    return group;
}
@end
