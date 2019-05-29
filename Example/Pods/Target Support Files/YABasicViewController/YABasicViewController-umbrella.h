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

#import "YABaseNavigationController.h"
#import "UIViewController+BackToViewController.h"
#import "YABaseViewController.h"
#import "RTRootNavigationController.h"
#import "UIViewController+RTRootNavigationController.h"

FOUNDATION_EXPORT double YABasicViewControllerVersionNumber;
FOUNDATION_EXPORT const unsigned char YABasicViewControllerVersionString[];

