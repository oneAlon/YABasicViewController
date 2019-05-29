//
//  YASingletion.m
//  YABasicUtilites
//
//  Created by 李亚飞 on 2018/12/4.
//

#import "YASingletion.h"
#import "YASingletionManager.h"

#undef    DECLARE_SINGLETON
#define DECLARE_SINGLETON( __class ) \
+ (__class *)sharedInstance;

#undef    DEFINE_SINGLETON
#define DEFINE_SINGLETON( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}

@implementation YASingletion


+ (instancetype)sharedInstance
{
    return [[YASingletionManager sharedManager] sharedInstaceFor:[self class]];
}

+ (void)destorySharedInstance
{
    [[YASingletionManager sharedManager] destorySharedInstanceFor:[self class]];
}

@end
