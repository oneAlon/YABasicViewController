//
//  YASingletion.h
//  YABasicUtilites
//
//  Created by 李亚飞 on 2018/12/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YASingletion : NSObject

+ (instancetype)sharedInstance;

+ (void)destorySharedInstance;


@end

NS_ASSUME_NONNULL_END
