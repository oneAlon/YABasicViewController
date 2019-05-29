//
//  NSDate+YA.h
//  YABasicFoundation
//
//  Created by OneAlon on 2017/12/5.
//

#import <Foundation/Foundation.h>

@interface NSDate (YA)

// 当前时间 yyyy-MM-dd hh:mm:ss
+ (NSString *)ya_nowDateLongString;

// 当前时间 yyyy-MM-dd
+ (NSString *)ya_nowDateShortString;

// 当前是否在两个时间之间
+ (BOOL)ya_isToadyInRange:(NSString *)beginDateInterVal and:(NSString *)endDateInterVal;

// 根据时间戳 时间轴展示
+ (NSString *)ya_convertDateIntervalToStringWith:(NSString *)aInterVal;
+ (NSString *)ya_convertDateIntervalToSimpleStringWith:(NSString *)aInterVal;

+ (NSCalendar *)ya_currentCalendar; // avoid bottlenecks

#pragma mark - Property
@property (nonatomic, readonly) NSString *shortString;
@property (nonatomic, readonly) NSString *shortDateString;
@property (nonatomic, readonly) NSString *shortTimeString;
@property (nonatomic, readonly) NSString *mediumString;
@property (nonatomic, readonly) NSString *mediumDateString;
@property (nonatomic, readonly) NSString *mediumTimeString;
@property (nonatomic, readonly) NSString *longString;
@property (nonatomic, readonly) NSString *longDateString;
@property (nonatomic, readonly) NSString *longTimeString;

@property (readonly) NSInteger nearestHour;
@property (readonly) NSInteger hour;
@property (readonly) NSInteger minute;
@property (readonly) NSInteger seconds;
@property (readonly) NSInteger day;
@property (readonly) NSInteger month;
@property (readonly) NSInteger weekOfMonth;
@property (readonly) NSInteger weekOfYear;
@property (readonly) NSInteger weekday;
@property (readonly) NSInteger nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger year;
@property (readonly) NSInteger numbersOfDaysInThisMonth;

@end
