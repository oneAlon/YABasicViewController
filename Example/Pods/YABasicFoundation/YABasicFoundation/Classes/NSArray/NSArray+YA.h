//
//  NSArray+YA.h
//  YABasicFoundation
//
//  Created by OneAlon on 2017/12/5.
//

#import <Foundation/Foundation.h>

@interface NSArray (YA)

#pragma mark - Json
// Array转换成Json
- (NSString *)ya_jsonValue;

// Array转换成Json NSData
- (id)ya_jsonData;

#pragma mark - Safe
- (id)ya_safeObjectAtIndex:(NSUInteger)index;
- (id)ya_safeSubarrayWithRange:(NSRange)range;

- (NSInteger)ya_safeIndexOfObject:(id)object;

@end
