//
//  NSNotificationCenter+YA.h
//  YABasicFoundation
//
//  Created by OneAlon on 2017/12/5.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (YA)

// 安全添加
- (void)ya_safeAddObserver:(id)observer
                   selector:(SEL)aSelector
                       name:(NSString *)aName
                     object:(id)anObject;

@end
