//
//  YAWeakTimer.h
//  YABasicUtilites
//
//  Created by 李亚飞 on 2018/12/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YAWeakTimer : NSObject
// 参照NSTimer穿参
+ (NSTimer *)ya_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(id)userInfo
                                     repeats:(BOOL)repeats;
@end

NS_ASSUME_NONNULL_END
