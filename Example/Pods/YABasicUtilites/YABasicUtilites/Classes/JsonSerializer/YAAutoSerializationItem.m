//
//  YAAutoSerializationItem.m
//  YFLBasicUtilites
//
//  Created by 李亚飞 on 2018/12/6.
//

#import "YAAutoSerializationItem.h"
#import "YARuntimeUtilites.h"
#import "NSString+YA.h"
#import "NSArray+YA.h"
#import "NSMutableArray+YA.h"
#import "NSMutableDictionary+YA.h"

static NSString * const kUnSerializationProperty = @"YAUnSerializationProperty";

@implementation YAAutoSerializationItem
#pragma mark - NSCoding
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        unsigned int propertyCount = 0;
        Class cls = self.class;
        
        while (cls != [NSObject class]) {
            objc_property_t *propertyList = class_copyPropertyList(cls, &propertyCount);
            for (unsigned i = 0; i < propertyCount; i++) {
                objc_property_t property = propertyList[i];
                const char *attrs = property_getAttributes(property);
                NSString *propertyAttributes = @(attrs);
                if (![propertyAttributes ya_contains:kUnSerializationProperty]) {
                    NSArray *attributeItems = [propertyAttributes componentsSeparatedByString:@","];
                    if ([attributeItems containsObject:@"R"]) {
                        continue;
                    }
                    NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
                    @try {
                        id value = [aDecoder decodeObjectForKey:propertyName];
                        if (value) {
                            [self setValue:value forKey:value];
                        }
                    }
                    @catch (NSException *exception) {
//                        NSLog(@"%@", exception);
                    }
                    @finally {
                    }
                }
            }
            
            free(propertyList);
            propertyCount = 0;
            propertyList = 0;
        }
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int propertyCount = 0;
    Class cls = self.class;
    
    while (cls != [NSObject class]) {
        objc_property_t *propertyList = class_copyPropertyList(cls, &propertyCount);
        for (unsigned i = 0; i < propertyCount; i++) {
            objc_property_t property = propertyList[i];
            const char *attrs = property_getAttributes(property);
            NSString *propertyAttributes = @(attrs);
            if (![propertyAttributes ya_contains:kUnSerializationProperty]) {
                NSArray *attributeItems = [propertyAttributes componentsSeparatedByString:@","];
                if ([attributeItems containsObject:@"R"]) {
                    continue;
                }
                NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
                @try {
                    id value = [self valueForKey:propertyName];
                    if (value) {
                        [aCoder encodeObject:value forKey:propertyName];
                    }
                }
                @catch (NSException *exception) {
//                    NSLog(@"%@", exception);
                }
                @finally {
                }
            }
        }
        
        free(propertyList);
        cls = class_getSuperclass(cls);
        propertyList = 0;
        propertyCount = 0;
    }
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone
{
    YAAutoSerializationItem *item = [[self class] allocWithZone:zone];
    unsigned int propertyCount = 0;
    
    Class cls = self.class;
    while (cls != [NSObject class]) {
        objc_property_t *propertyList = class_copyPropertyList(cls, &propertyCount);
        for (unsigned i = 0; i < propertyCount; i++) {
            objc_property_t property = propertyList[i];
            if ([YARuntimeUtilites propertyIsReadOnly:property]) {
                continue;
            }
            NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
            @try {
                id value = [self valueForKey:propertyName];
                if (value) {
                    [item  setValue:value forKey:propertyName];
                }
            }
            @catch (NSException *exception) {
//                NSLog(@"%@", exception);
            }
            @finally {
            }
        }
        
        free(propertyList);
        cls = class_getSuperclass(cls);
        propertyList = 0;
        propertyCount = 0;
    }
    
    return item;
}

- (NSDictionary *)ya_propertyToDictionary
{
    uint count = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    NSMutableDictionary *properties = [NSMutableDictionary dictionaryWithCapacity:count];
    
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertyList[i];
        const char *pName = property_getName(property);
        if (pName) {
            id value = [self valueForKey:[NSString stringWithUTF8String:pName]];
            if (value) {
                if ([value isKindOfClass:[YAAutoSerializationItem class]]) {
                    NSDictionary *valueDict = [value ya_propertyToDictionary];
                    [properties ya_safeSetObject:valueDict forKey:[NSString stringWithUTF8String:pName]];
                } else if ([value isKindOfClass:[NSArray class]]) {
                    NSArray *valueArr = (NSArray *)value;
                    NSString *arrayType = [YARuntimeUtilites propertyTypeName:property];
                    if (![arrayType ya_contains:@"YAPropertyToDictionaryArrayToJson"]) {
                        NSMutableArray *tempArray = [NSMutableArray array];
                        for (YAAutoSerializationItem *item in valueArr) {
                            if ([item isKindOfClass:[YAAutoSerializationItem class]]) {
                                NSDictionary *tempDict = [item ya_propertyToDictionary];
                                if (tempDict) {
                                    [tempArray ya_safeAddObject:tempDict];
                                }
                            } else {
                                [tempArray ya_safeAddObject:item];
                            }
                        }
                        
                        [properties ya_safeSetObject:tempArray forKey:[NSString stringWithUTF8String:pName]];
                    } else {
                        [properties ya_safeSetObject:[valueArr ya_jsonValue] forKey:[NSString stringWithUTF8String:pName]];
                    }
                } else {
                    [properties ya_safeSetObject:value forKey:[NSString stringWithUTF8String:pName]];
                }
            }
        }
    }
    
    free(propertyList);
    propertyList = nil;
    count = 0;
    
    return properties;
}
@end
