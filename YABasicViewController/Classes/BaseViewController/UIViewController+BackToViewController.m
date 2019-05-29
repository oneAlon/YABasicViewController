//
//  UIViewController+BackToViewController.m
//  Pods
//
//  Created by xygj on 2019/5/29.
//

#import "UIViewController+BackToViewController.h"

@implementation UIViewController (BackToViewController)

- (void)backToController:(NSString *)controllerName animated:(BOOL)animaed {
    if(self.navigationController.viewControllers.count <= 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else {
        if (self.navigationController) {
            NSArray *controllers = self.navigationController.viewControllers;
            NSArray *result = [controllers filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
                return [evaluatedObject isKindOfClass:NSClassFromString(controllerName)];
            }]];
            if (result.count > 0) {
                [self.navigationController popToViewController:result[0] animated:YES];
            }
        }
    }
}

@end
