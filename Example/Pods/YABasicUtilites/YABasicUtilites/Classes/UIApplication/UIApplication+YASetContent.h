//
//  UIApplication+YASetContent.h
//  YABasicUtilites
//
//  Created by 李亚飞 on 2018/12/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (YASetContent)
/**
 获取当前活跃的UIViewController
 */
- (UIViewController *)ya_currentActivityViewController;
/**
 打开App的系统设置面板
 */
- (void)ya_openSettingPage;

/**
 拨打电话
 */
- (void)ya_telTo:(NSString *)phoneNumber;

/**
 注册推送通知
 */
- (void)ya_registerNotificationSettings;

/**
 是否开启推送通知
 */
- (BOOL)ya_allowedNotification;

/**
 打开系统推送通知设置页面
 */
- (void)ya_openNotificationSettings;

/**
 打开app在appStore的主页面
 */
- (void)ya_openAppStoreWithAppId:(NSString *)appId;

/**
 打开app在appStore的评价页面
 */
- (void)ya_openAppStoreReviewsWithAppId:(NSString *)appId;
@end

NS_ASSUME_NONNULL_END
