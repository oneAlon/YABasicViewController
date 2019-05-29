//
//  YABaseItem.m
//  YFLBasicUtilites
//
//  Created by 李亚飞 on 2018/12/6.
//

#import "YABaseItem.h"
#import "YARuntimeUtilites.h"
#import "NSMutableArray+YA.h"

static NSArray *cTypes = nil;

@interface YABaseItem () <NSCopying, NSCoding>

@end



@implementation YABaseItem

+ (void)load
{
    cTypes = @[@"i", @"s", @"l", @"q", @"I", @"S", @"L", @"Q", @"f", @"d", @"b", @"c", @"B"];
}

- (void)parseJSONValue:(NSDictionary *)jsonValue
{
    if (jsonValue && [jsonValue isKindOfClass:[NSDictionary class]]) {
        __strong NSDictionary *dictForJsonValue = jsonValue;
        
        [self willAutoParse];
        
        Class cls = [self class];
        while (cls != [YABaseItem class]) {
            NSDictionary *propertyList = [YARuntimeUtilites propertiesForClass:cls];
            for (NSString *key in [propertyList allKeys]) {
                NSString *typeString = [propertyList objectForKey:key];
                NSString *jsonKey = [self JSONKeyForProperty:key];
                
                id jsonKeyMapValue = [dictForJsonValue objectForKey:jsonKey];
                if (jsonKeyMapValue && typeString && jsonKey) {
                    [self _setJSONValue:jsonKeyMapValue propertyCls:typeString propertyName:key];
                }
            }
            
            cls = [cls superclass];
        }
        
        [self afterAutoParse];
    } else {
//        NSLog(@"can not support un NSDictionary Class in XNBBaseItem");
    }
}

- (NSString *)JSONKeyForProperty:(NSString *)propertyKey
{
    return propertyKey;
}

- (Class)classForObject:(id)arrayElement inArrayWithPropertyName:(NSString *)propertyName
{
    return nil;
}

- (void)willAutoParse
{}

- (void)afterAutoParse
{}

#pragma mark - Others

- (void)_setJSONValue:(id)jsonValue propertyCls:(NSString *)className propertyName:(NSString *)propertyName
{
    if (jsonValue && className && propertyName) {
        if ([className rangeOfString:@"YABaseItemUnAutoParseProperty"].location != NSNotFound) {
            return;
        }
        
        Class propertyCls = NSClassFromString(className);
        id value = nil;
        if ([propertyCls isSubclassOfClass:[YABaseItem class]]) {
            if ([jsonValue isKindOfClass:[NSDictionary class]]) {
                YABaseItem *baseItem = [[propertyCls alloc] init];
                [baseItem parseJSONValue:jsonValue];
                value = baseItem;
            }
        } else if ([propertyCls isSubclassOfClass:[NSArray class]]) {   //如果是数组
            if ([jsonValue isKindOfClass:[NSArray class]]) {
                value = [NSMutableArray arrayWithCapacity:[jsonValue count]];
                for (id arrayElement in jsonValue) {
                    Class objectClass = [self classForObject:arrayElement inArrayWithPropertyName:propertyName];
                    id elementValue = nil;
                    // 不支持数组中嵌套数组
                    if ([arrayElement isKindOfClass:[NSArray class]] || [arrayElement isKindOfClass:[NSNull class]]) {
                        if ([arrayElement isKindOfClass:[NSArray class]]) {
                            elementValue = arrayElement;
                        }
                    } else if (objectClass && [arrayElement isKindOfClass:[NSDictionary class]]) {
                        if ([objectClass isSubclassOfClass:[YABaseItem class]]) {
                            YABaseItem *baseItem = [[objectClass alloc] init];
                            [baseItem parseJSONValue:arrayElement];
                            elementValue = baseItem;
                        }
                    } else {
                        if (!objectClass) {
                            elementValue = arrayElement;
                        }
                    }
                    
                    if (elementValue) {
                        [value ya_safeAddObject:elementValue];
                    }
                }
            }
        } else if ([propertyCls isSubclassOfClass:[NSString class]]) {
            if ([jsonValue isKindOfClass:[NSString class]]) {
                value = jsonValue;
            } else if ([jsonValue isKindOfClass:[NSNumber class]]) {
                value = [(NSNumber *)jsonValue stringValue];
            }
        } else if ([propertyCls isSubclassOfClass:[NSNumber class]]) {
            if ([jsonValue isKindOfClass:[NSString class]]) {
                value = @([(NSNumber *)jsonValue doubleValue]);
            } else if ([jsonValue isKindOfClass:[NSNumber class]]) {
                value = jsonValue;
            }
        } else if ([propertyCls isSubclassOfClass:[NSDictionary class]]) {
            if ([jsonValue isKindOfClass:[NSDictionary class]]) {
                value = jsonValue;
            }
        } else {
            // C语言类型
            if ([cTypes containsObject:className]) {
                if ([jsonValue isKindOfClass:[NSString class]]) {
                    value = @([((NSString *)jsonValue) doubleValue]);
                } else if ([jsonValue isKindOfClass:[NSNumber class]]) {
                    value = jsonValue;
                } else {
                    value = @(0);
                }
            }
        }
        
        [self _setValue:value forKey:propertyName];
    }
}

- (void)_setValue:(id)value forKey:(NSString *)key
{
#ifdef DEBUG
    [self setValue:value forKey:key];
#else
    @try {
        [self setValue:value forKey:key];
    }
    @catch (NSException *exception) {
//        NSLog(0x1, @"exception in YABaseItem");
    }
#endif
}

@end
