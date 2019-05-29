//
//  NSMutableDictionary+YA.m
//  YABasicFoundation
//
//  Created by OneAlon on 2017/12/5.
//

#import "NSMutableDictionary+YA.h"

@implementation NSMutableDictionary (YA)

- (void)ya_safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (!aKey) {
        return;
    }
    if (!anObject) {
        [self removeObjectForKey:aKey];
        return;
    }
    [self setObject:anObject forKey:aKey];
}

- (void)ya_safeRemoveObjectForKey:(id<NSCopying>)aKey
{
    if (aKey) {
        [self removeObjectForKey:aKey];
    }
}

- (void)ya_safeAppendDictionary:(NSDictionary *)dictionary
{
    __weak typeof(self) weakSelf = self;
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf ya_safeSetObject:obj forKey:key];
    }];
}

@end
