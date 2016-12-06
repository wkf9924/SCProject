//
//  MHDefine.h
//  PerfectProject
//
//  Created by Meng huan on 14/12/3.
//  Copyright (c) 2014年 M.H Co.,Ltd. All rights reserved.
//




#import "MHLogDefine.h"
#import "MHPathDefine.h"
#import "MHViewDefine.h"
#import "MHLabelDefine.h"
#import "MHPersistentDefine.h"
#import "MHNotificationDefine.h"



#ifndef PerfectProject_MHDefine_h
#define PerfectProject_MHDefine_h

// 底部TabBar的高度
#define DEF_TAB_BAR_HEIGHT 50

/**
 *  在此处定义宏
 */

// 此App中使用的自定义字体名称
#define DEF_Default_FontName @"DFShaoNvW5"



// 判断是否为3.5屏
#define DEF_640_960 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define Request_URL  @""

#endif
