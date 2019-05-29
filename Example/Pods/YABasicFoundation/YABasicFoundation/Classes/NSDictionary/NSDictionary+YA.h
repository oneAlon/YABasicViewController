//
//  NSDictionary+YA.h
//  YABasicFoundation
//
//  Created by OneAlon on 2017/12/5.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YA)

#pragma mark - Json
// 转换成Json字符串
- (NSString *)ya_jsonString;

// 转成key=value&key=value
- (NSString *)ya_parameterString;

// 转换成json NSData
- (NSData *)ya_jsonData;

#pragma mark - Safe
- (id)ya_safeObjectForKey:(id<NSCopying>)aKey;

@end
