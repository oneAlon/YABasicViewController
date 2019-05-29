//
//  YASingletionManager.h
//  YABasicUtilites
//
//  Created by 李亚飞 on 2018/12/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YASingletionManager : NSObject

+ (instancetype)sharedManager;

- (id)sharedInstaceFor:(Class)aClass;

- (id)sharedInstanceFor:(Class)aClass category:(NSString *)aKey;

- (void)destorySharedInstanceFor:(Class)aClass;

- (void)destorySharedInstanceFor:(Class)aClass category:(NSString *)aKey;

@end

NS_ASSUME_NONNULL_END
