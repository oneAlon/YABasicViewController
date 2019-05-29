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

#import "YAAutoSerializationItem.h"
#import "YABaseItem.h"
#import "UIApplication+YASetContent.h"
#import "UIDevice+YA.h"
#import "YABasicUtilites.h"
#import "YAJsonSerializerItem.h"
#import "YARuntimeUtilites.h"
#import "YAWeakTimer.h"
#import "YASingletion.h"
#import "YASingletionManager.h"

FOUNDATION_EXPORT double YABasicUtilitesVersionNumber;
FOUNDATION_EXPORT const unsigned char YABasicUtilitesVersionString[];

