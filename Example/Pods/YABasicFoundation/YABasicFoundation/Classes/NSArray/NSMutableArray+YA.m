//
//  NSMutableArray+YA.m
//  YABasicFoundation
//
//  Created by OneAlon on 2017/12/5.
//

#import "NSMutableArray+YA.h"

@implementation NSMutableArray (YA)

- (void)ya_safeAddObject:(id)obj
{
    if (obj) {
        [self addObject:obj];
    }
}

- (BOOL)ya_addObject:(id)obj
{
    if (!obj) {
        return NO;
    }
    [self addObject:obj];
    return YES;
}

- (void)ya_safeAddObjectsFromArray:(NSArray *)otherArray
{
    if (otherArray.count) {
        [self addObjectsFromArray:otherArray];
    }
}

- (void)ya_safeInsertObject:(id)obj atIndex:(NSUInteger)index
{
    if (obj && index <= self.count) {
        [self insertObject:obj atIndex:index];
    }
}

- (void)ya_safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes
{
    if (objects.count && indexes) {
        [self insertObjects:objects atIndexes:indexes];
    }
}

- (void)ya_safeRemoveObject:(id)anObject
{
    if (anObject && [self containsObject:anObject]) {
        [self removeObject:anObject];
    }
}

- (void)ya_safeRemoveLastObject
{
    if (self.count) {
        [self removeLastObject];
    }
}

- (void)ya_safeRemoveObject:(id)anObject inRange:(NSRange)aRange
{
    if (anObject && aRange.location + aRange.length < self.count) {
        [self removeObject:anObject inRange:aRange];
    }
}

- (void)ya_safeRemoveObjectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        [self removeObjectAtIndex:index];
    }
}

- (void)ya_safeRemoveObjectIdenticalTo:(id)anObject inRange:(NSRange)aRange
{
    if (anObject && aRange.location + aRange.length < self.count) {
        [self removeObjectIdenticalTo:anObject inRange:aRange];
    }
}

- (void)ya_safeRemoveObjectsAtIndexex:(NSIndexSet *)indexes
{
    if (indexes) {
        [self removeObjectsAtIndexes:indexes];
    }
}

- (void)ya_safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (anObject && index < self.count) {
        [self replaceObjectAtIndex:index withObject:anObject];
    }
}

- (void)ya_safeReplaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects
{
    if (objects.count && indexes) {
        [self replaceObjectsAtIndexes:indexes withObjects:objects];
    }
}

@end
