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

#import "SFCategory.h"
#import "NSObject+SFExtension.h"
#import "NSString+SFRegex.h"
#import "UIButton+SFEnlargeScope.h"
#import "UIButton+SFExtension.h"
#import "UIImage+SFExtension.h"
#import "UIView+SFAnimation.h"
#import "UIView+SFClip.h"
#import "UIView+SFFrame.h"
#import "UIView+SFGesture.h"
#import "UIView+SFGradient.h"
#import "UIViewController+SFNavigator.h"

FOUNDATION_EXPORT double SFCategoryVersionNumber;
FOUNDATION_EXPORT const unsigned char SFCategoryVersionString[];

