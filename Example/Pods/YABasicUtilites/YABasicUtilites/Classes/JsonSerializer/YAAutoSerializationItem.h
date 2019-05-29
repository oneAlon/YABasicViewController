//
//  YAAutoSerializationItem.h
//  YFLBasicUtilites
//
//  Created by 李亚飞 on 2018/12/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol YAUnSerializationProperty <NSObject>
@end


@protocol YAPropertyToDictionaryArrayToJson <NSObject>
@end


@interface NSArray (PropertyAdpaterToJson)<YAPropertyToDictionaryArrayToJson>
@end


@interface NSObject (AdapterForUnSerializationItem)<YAUnSerializationProperty>
@end



@interface YAAutoSerializationItem : NSObject <NSCopying, NSCoding>

- (NSDictionary *)ya_propertyToDictionary;

@end

NS_ASSUME_NONNULL_END
