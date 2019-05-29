//
//  NSMutableDictionary+YA.h
//  YABasicFoundation
//
//  Created by OneAlon on 2017/12/5.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (YA)

#pragma mark - Safe
- (void)ya_safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey;
- (void)ya_safeRemoveObjectForKey:(id<NSCopying>)aKey;
- (void)ya_safeAppendDictionary:(NSDictionary *)dictionary;

@end
