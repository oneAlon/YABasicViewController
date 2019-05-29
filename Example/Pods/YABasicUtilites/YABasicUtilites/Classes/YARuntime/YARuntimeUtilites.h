//
//  YARuntimeUtilites.h
//  YABasicUtilites
//
//  Created by 李亚飞 on 2018/12/4.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
NS_ASSUME_NONNULL_BEGIN

/**
 *  替换实现
 *
 *  @param aClass         类
 *  @param originSelector 待替换方法
 *  @param swizzSelector  替换的方法
 */
FOUNDATION_EXPORT void YASwizzMethod(Class aClass, SEL originSelector, SEL swizzSelector);


@interface YARuntimeUtilites : NSObject

+ (NSDictionary *)propertiesForClass:(Class)aClass;

+ (NSString *)propertyTypeName:(objc_property_t)property;

#pragma mark - BOOL
+ (BOOL)propertyIsObject:(objc_property_t)property;
+ (BOOL)propertyIsWeak:(objc_property_t)property;
+ (BOOL)propertyIsStrong:(objc_property_t)property;
+ (BOOL)propertyIsCopy:(objc_property_t)property;
+ (BOOL)propertyIsAssign:(objc_property_t)property;
+ (BOOL)propertyIsReadOnly:(objc_property_t)property;

@end

NS_ASSUME_NONNULL_END
