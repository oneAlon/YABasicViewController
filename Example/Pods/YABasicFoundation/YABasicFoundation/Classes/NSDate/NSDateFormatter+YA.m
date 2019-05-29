//
//  NSDateFormatter+YA.m
//  YABasicFoundation
//
//  Created by OneAlon on 2017/12/5.
//

#import "NSDateFormatter+YA.h"

static NSMutableDictionary *formatters = nil;

@implementation NSDateFormatter (YA)

+ (NSDateFormatter *)ya_dateFormatterWithFormat:(NSString *)formmat
{
    return [self ya_dateFormatterWithKey:[NSString stringWithFormat:@"<%@>", formmat] configBlock: ^(NSDateFormatter *formatter) {
        if (formatter) {
            [formatter setDateFormat:formmat];
        }
    }];
}

+ (NSDateFormatter *)ya_dateFormatterWithKey:(NSString *)key configBlock:(YADateFormmaterConfigBlock)cofigBlock
{
    NSString *strKey = nil;
    if (!key) {
        strKey = @"defaultFormatter";
    } else {
        strKey = [key copy];
    }
    
    @synchronized(self) {
        NSDateFormatter *dateFormatter = [[self formatters] objectForKey:strKey];
        if (!dateFormatter) {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [[self formatters] setObject:dateFormatter forKey:strKey];
            
            if (cofigBlock) {
                cofigBlock(dateFormatter); //配置它
            }
            return dateFormatter;
        }
        
        return dateFormatter;
    }
}

+ (NSMutableDictionary *)formatters
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!formatters) {
            formatters = [[NSMutableDictionary alloc] init];
        }
    });
    
    return formatters;
}

@end
