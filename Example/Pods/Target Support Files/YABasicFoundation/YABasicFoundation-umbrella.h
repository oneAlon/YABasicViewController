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

#import "NSArray+YA.h"
#import "NSMutableArray+YA.h"
#import "NSDate+YA.h"
#import "NSDateFormatter+YA.h"
#import "NSDictionary+YA.h"
#import "NSMutableDictionary+YA.h"
#import "NSNotificationCenter+YA.h"
#import "YAObjectCheck.h"
#import "NSString+MD5.h"
#import "NSString+YA.h"
#import "YABasicFoundation.h"

FOUNDATION_EXPORT double YABasicFoundationVersionNumber;
FOUNDATION_EXPORT const unsigned char YABasicFoundationVersionString[];

