//
//  UIApplication+YASetContent.m
//  YABasicUtilites
//
//  Created by 李亚飞 on 2018/12/4.
//

#import "UIApplication+YASetContent.h"

@implementation UIApplication (YASetContent)

- (UIViewController *)ya_currentActivityViewController
{
    UIViewController *activityViewController = nil;
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if(window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow *tmpWin in windows) {
            if(tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    
    NSArray *viewsArray = [window subviews];
    if([viewsArray count] > 0) {
        UIView *frontView = [viewsArray objectAtIndex:0];
        
        id nextResponder = [frontView nextResponder];
        
        if([nextResponder isKindOfClass:[UIViewController class]]) {
            activityViewController = nextResponder;
        } else {
            activityViewController = window.rootViewController;
        }
    }
    
    return activityViewController;
}

- (void)ya_openSettingPage
{
    [self openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
}

- (void)ya_telTo:(NSString *)phoneNumber
{
    phoneNumber = [phoneNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *str = [NSString stringWithFormat:@"telprompt://%@", phoneNumber];
    [self openURL:[NSURL URLWithString:str]];
}

- (void)ya_registerNotificationSettings
{
    UIUserNotificationSettings *settings = [UIUserNotificationSettings
                                            settingsForTypes:(UIUserNotificationTypeAlert |
                                                              UIUserNotificationTypeBadge |
                                                              UIUserNotificationTypeSound)
                                            categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}

- (BOOL)ya_allowedNotification
{
    UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
    if (UIUserNotificationTypeNone != setting.types) {
        return YES;
    }
    
    return NO;
}

- (void)ya_openNotificationSettings
{
    NSString *url = nil;
    
    if (@available(iOS 10.0, *)) {
        url = UIApplicationOpenSettingsURLString;
    } else {
        url = @"prefs:root=---.SSA";
    }
    
    if ([self canOpenURL:[NSURL URLWithString:url]]) {
        if (@available(iOS 10.0, *)) {
            [self openURL:[NSURL URLWithString:url] options:@{} completionHandler:nil];
        } else {
            [self openURL:[NSURL URLWithString:url]];
        }
    }
}

- (void)ya_openAppStoreWithAppId:(NSString *)appId
{
    NSString *appStoreString = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@", appId];
    [self openURL:[NSURL URLWithString:appStoreString]];
}

- (void)ya_openAppStoreReviewsWithAppId:(NSString *)appId
{
    NSString *str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", appId];
    [self openURL:[NSURL URLWithString:str]];
}

@end
