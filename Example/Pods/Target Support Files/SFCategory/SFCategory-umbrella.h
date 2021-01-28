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
#import "SFFoundation.h"
#import "NSObject+SFExtension.h"
#import "NSObject+SFMethodSwizzling.h"
#import "NSString+SFRegex.h"
#import "SFKit.h"
#import "SFReusedProtocol.h"
#import "UIButton+SFEnlargeScope.h"
#import "UIButton+SFExtension.h"
#import "UICollectionReusableView+SFReuse.h"
#import "UICollectionView+SFReuse.h"
#import "UICollectionViewCell+SFReuse.h"
#import "UIControl+SFClickDuring.h"
#import "UIImage+SFExtension.h"
#import "UITableView+SFReuse.h"
#import "UITableViewCell+SFReuse.h"
#import "UITableViewHeaderFooterView+SFReuse.h"
#import "UIView+SFAnimation.h"
#import "UIView+SFClip.h"
#import "UIView+SFFrame.h"
#import "UIView+SFGesture.h"
#import "UIView+SFGradient.h"
#import "UIViewController+SFNavigator.h"

FOUNDATION_EXPORT double SFCategoryVersionNumber;
FOUNDATION_EXPORT const unsigned char SFCategoryVersionString[];

