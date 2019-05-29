//
//  NSMutableArray+YA.h
//  YABasicFoundation
//
//  Created by OneAlon on 2017/12/5.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (YA)

#pragma mark - Safe
#pragma mark Add
- (void)ya_safeAddObject:(id)obj;
- (void)ya_safeAddObjectsFromArray:(NSArray *)otherArray;

- (BOOL)ya_addObject:(id)obj;

#pragma mark Insert
- (void)ya_safeInsertObject:(id)obj atIndex:(NSUInteger)index;
- (void)ya_safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes;

#pragma mark Remove
- (void)ya_safeRemoveObject:(id)anObject;
- (void)ya_safeRemoveLastObject;
- (void)ya_safeRemoveObject:(id)anObject inRange:(NSRange)aRange;
- (void)ya_safeRemoveObjectAtIndex:(NSUInteger)index;
- (void)ya_safeRemoveObjectIdenticalTo:(id)anObject inRange:(NSRange)aRange;
- (void)ya_safeRemoveObjectsAtIndexex:(NSIndexSet *)indexes;

#pragma mark Replace
- (void)ya_safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
- (void)ya_safeReplaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects;

@end
