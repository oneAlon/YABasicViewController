//
//  NSDateFormatter+YA.h
//  YABasicFoundation
//
//  Created by OneAlon on 2017/12/5.
//

#import <Foundation/Foundation.h>

typedef void (^YADateFormmaterConfigBlock)(NSDateFormatter *dateFormmater);

@interface NSDateFormatter (YA)

+ (NSDateFormatter *)ya_dateFormatterWithFormat:(NSString *)format;

// key 唯一标识
// block 配置formmater的格式
+ (NSDateFormatter *)ya_dateFormatterWithKey:(NSString *)key configBlock:(YADateFormmaterConfigBlock)block;

@end
