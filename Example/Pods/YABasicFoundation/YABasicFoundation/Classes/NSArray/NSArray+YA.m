//
//  NSArray+YA.m
//  YABasicFoundation
//
//  Created by OneAlon on 2017/12/5.
//

#import "NSArray+YA.h"

@implementation NSArray (YA)

- (NSString *)ya_jsonValue
{
    NSData *data = [self ya_jsonData];
    if (data.length) {
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    
    return nil;
}

- (id)ya_jsonData
{
    if (self) {
        return  [NSJSONSerialization dataWithJSONObject:self
                                                options:kNilOptions
                                                  error:nil];
    }
    
    return nil;
}

- (id)ya_safeObjectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self objectAtIndex:index];
    }
    
    return nil;
}

- (id)ya_safeSubarrayWithRange:(NSRange)range
{
    if (range.location + range.length <= self.count) {
        return [self subarrayWithRange:range];
    }
    
    return nil;
}

- (NSInteger)ya_safeIndexOfObject:(id)object
{
    if (object) {
        return [self indexOfObject:object];
    }
    
    return NSNotFound;
}

@end
