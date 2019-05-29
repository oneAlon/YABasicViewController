//
//  UIViewController+BackToViewController.h
//  Pods
//
//  Created by xygj on 2019/5/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (BackToViewController)

- (void)backToController:(NSString *)controllerName animated:(BOOL )animaed;

@end

NS_ASSUME_NONNULL_END
