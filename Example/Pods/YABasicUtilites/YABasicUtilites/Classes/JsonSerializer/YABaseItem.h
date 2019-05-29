//
//  YABaseItem.h
//  YFLBasicUtilites
//
//  Created by 李亚飞 on 2018/12/6.
//

#import "YAAutoSerializationItem.h"

NS_ASSUME_NONNULL_BEGIN
@protocol YABaseItemUnAutoParseProperty <NSObject>
@end


@interface NSObject (AdapterForBaseItem)<YABaseItemUnAutoParseProperty>
@end
@interface YABaseItem : YAAutoSerializationItem

// Json解析
- (void)parseJSONValue:(NSDictionary *)jsonValue;

// 如果子类中的元素有数组类型的话，通过重载这个方法返回解析后数组元素类型
- (Class)classForObject:(id)arrayElement inArrayWithPropertyName:(NSString *)propertyName;

// 通过属性名称相对应返回Json串中的key，默认与属性名称一样
- (NSString *)JSONKeyForProperty:(NSString *)propertyKey;

- (void)willAutoParse;  // 开始解析之前
- (void)afterAutoParse; // 解析结束回调




@end

NS_ASSUME_NONNULL_END
