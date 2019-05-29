//
//  YABaseViewController.h
//  Pods
//
//  Created by xygj on 2019/5/29.
//

#import <UIKit/UIKit.h>
#import "UIViewController+BackToViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface YABaseViewController : UIViewController
// 返回方法 通用
- (void)backToLastViewController;

@end

@interface YABaseViewController (NavigationBar)

// 设置导航标题
- (void)setNavBarTitle:(NSString *)title textColor:(UIColor *)textColor fontSize:(CGFloat)font;

// 设置导航栏标题图片
- (void)setNavBarTitle:(UIImage *)titleImage;

// 根据文字设置左导航按钮
- (void)setNavBarLeftItem:(NSString *)title textColor:(UIColor *)textColor;

// 根据文字设置右导航按钮
- (void)setNavBarRightItem:(NSString *)title textColor:(UIColor *)textColor;

// 根据图片设置左导航按钮
- (void)setNavBarLeftItem:(UIImage *)normalImage hightedImage:(UIImage *)hightedImage;

// 根据图片设置右导航按钮
- (void)setNavBarRightItem:(UIImage *)normalImage hightedImage:(UIImage *)hightedImage;

// 根据选中图片设置右导航按钮
- (void)setNavBarRightItem:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage;

#pragma mark - Actions
// 默认的返回按钮
- (void)setDefaultBackBarItem;

// 返回按钮的回调
- (void)onPressedBackBarButton;

// 左边button回调
- (void)onPressedLeftBarItem;

// 右边button回调
- (void)onPressedRightBarItem:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
