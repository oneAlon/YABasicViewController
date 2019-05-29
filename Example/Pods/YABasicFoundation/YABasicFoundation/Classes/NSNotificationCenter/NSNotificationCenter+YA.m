//
//  NSNotificationCenter+YA.m
//  YABasicFoundation
//
//  Created by OneAlon on 2017/12/5.
//

#import "NSNotificationCenter+YA.h"

@implementation NSNotificationCenter (YA)

- (void)ya_safeAddObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject
{
    [self removeObserver:observer name:aName object:anObject];
    [self addObserver:observer selector:aSelector name:aName object:anObject];
}

@end
