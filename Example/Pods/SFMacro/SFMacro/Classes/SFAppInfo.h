//
//  SFAppInfo.h
//  SFMacro_Example
//
//  Created by 黄山锋 on 2020/12/20.
//  Copyright © 2020 jack110530. All rights reserved.
//

#ifndef SFAppInfo_h
#define SFAppInfo_h

//APP的名称
#define SFAppName                [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
//APP版本号
#define SFAppVersion_short       [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//APP bulid版本
#define SFAppVersion             [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
//APP bundle id
#define SFAppBundleID            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]
//系统版本号
#define SFAppSystemVersion       [[UIDevice currentDevice] systemVersion]
//获取当前语言
#define SFAppCurrentLanguage     ([[NSLocale preferredLanguages] objectAtIndex:0])


#define SFApplication            [UIApplication sharedApplication]
#define SFKeyWindow              [SFUtility getKeyWindow]
#define SFAppDelegate            (AppDelegate *)SFApplication.delegate
#define SFUserDefaults           [NSUserDefaults standardUserDefaults]
#define SFNotificationCenter     [NSNotificationCenter defaultCenter]




#endif /* SFAppInfo_h */
