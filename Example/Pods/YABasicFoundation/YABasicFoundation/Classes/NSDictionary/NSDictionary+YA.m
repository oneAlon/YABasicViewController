//
//  NSDictionary+YA.m
//  YABasicFoundation
//
//  Created by OneAlon on 2017/12/5.
//

#import "NSDictionary+YA.h"

@implementation NSDictionary (YA)


- (NSString *)ya_jsonString
{
    if (self) {
        NSData *data = [self ya_jsonData];
        if (data.length) {
            return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        }
    }
    
    return nil;
}

- (NSString *)ya_parameterString {
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSString *key in [self allKeys]) {
        NSString *content = [NSString stringWithFormat:@"%@=%@", key, [self ya_safeObjectForKey:key]];
        [tempArray addObject:content];
    }
    NSString *resultStr = [tempArray componentsJoinedByString:@"&"];
    resultStr = [NSString stringWithFormat:@"%@\n", resultStr];
    return resultStr;
}

- (NSData *)ya_jsonData
{
    if (self) {
        return  [NSJSONSerialization dataWithJSONObject:self
                                                options:NSJSONWritingPrettyPrinted
                                                  error:nil];
    }
    
    return nil;
}

- (id)ya_safeObjectForKey:(id<NSCopying>)aKey
{
    if (aKey) {
        return [self objectForKey:aKey];
    }
    
    return nil;
}

@end
