//
//  NSString+MD5.h
//  Pods
//
//  Created by OneAlon on 2017/12/5.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)

/**
 *   数据加密
 *   @param string 加密前
 *   @return 加密后
 */
- (NSString *)ya_md5:(NSString *)string;

@end
