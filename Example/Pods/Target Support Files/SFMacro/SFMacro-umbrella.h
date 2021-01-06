#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "SFAppInfo.h"
#import "SFDeviceInfo.h"
#import "SFFunc.h"
#import "SFMacro.h"
#import "SFUtility.h"

FOUNDATION_EXPORT double SFMacroVersionNumber;
FOUNDATION_EXPORT const unsigned char SFMacroVersionString[];

