//
//  UIDevice+YA.h
//  YABasicUtilites
//
//  Created by OneAlon on 2017/12/4.
//

#import <UIKit/UIKit.h>



@interface UIDevice (YA)


 /**
  获取手机型号
  */
- (NSString *)ya_phoneType;

/**
 运营商
 */
- (NSString *)ya_OperatorInfo;

/**
 获取idfa
 */
- (NSString *)ya_idfaString;

/**
 获取idfv
 */
- (NSString *)ya_idfvString;

/**
 mac地址
 */
- (NSString *)ya_macAddress;

@end
