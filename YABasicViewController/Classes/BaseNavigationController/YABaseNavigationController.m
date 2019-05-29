//
//  YABaseNavigationController.m
//  Pods
//
//  Created by xygj on 2019/5/29.
//

#import "YABaseNavigationController.h"

@implementation YABaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transferNavigationBarAttributes = YES;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
