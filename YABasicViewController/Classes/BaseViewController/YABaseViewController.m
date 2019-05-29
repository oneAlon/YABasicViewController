//
//  YABaseViewController.m
//  Pods
//
//  Created by xygj on 2019/5/29.
//

#import "YABaseViewController.h"
#import "UIColor+YAColor.h"
#import "NSString+YA.h"
#import "UIFont+YAFontType.h"
#import "ALView+PureLayout.h"
#import "NSMutableArray+YA.h"

@interface YABaseViewController ()

@property (nonatomic, assign) BOOL isDefaultBackBtn;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, strong) NSLayoutConstraint *activityViewConstraint;

@end

@implementation YABaseViewController

- (void)dealloc {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor ya_colorForKey:@"ffffff"];
    self.edgesForExtendedLayout = UIRectEdgeAll;
}

// 通用式返回操作
- (void)backToLastViewController {
    if (self.navigationController && self.navigationController.viewControllers.count > 0 && self.navigationController.viewControllers.firstObject != self.navigationController.topViewController) {
        [self.navigationController popViewControllerAnimated:YES];
    } else if (self.navigationController) {
        [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (UIActivityIndicatorView *)activityIndicatorView {
    if (!_activityIndicatorView) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc] init];
        //        _activityIndicatorView.hidesWhenStopped = YES;
        [self.view addSubview:_activityIndicatorView];
        [self.view bringSubviewToFront:_activityIndicatorView];
        [_activityIndicatorView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        //        [_activityIndicatorView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        self.activityViewConstraint = [_activityIndicatorView autoAlignAxis:ALAxisHorizontal
                                                           toSameAxisOfView:self.view
                                                                 withOffset:0];
    }
    
    return _activityIndicatorView;
}


@end

@implementation YABaseViewController (NavigationBar)

- (void)setNavBarTitle:(NSString *)title textColor:(UIColor *)textColor fontSize:(CGFloat)font
{
    if ([title ya_nilOrEmpty]) {
        self.navigationItem.titleView = nil;
    } else {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = textColor;
        titleLabel.font = [UIFont ya_normalFontOfSize:font];
        titleLabel.text = title;
        [titleLabel sizeToFit];
        
        self.navigationItem.titleView = titleLabel;
    }
}

- (void)setNavBarTitle:(UIImage *)titleImage
{
    if (titleImage) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, titleImage.size.width, titleImage.size.height)];
        imageView.image = titleImage;
        
        self.navigationItem.titleView = imageView;
    } else {
        self.navigationItem.titleView = nil;
    }
}

- (void)setNavBarLeftItem:(NSString *)title textColor:(UIColor *)textColor
{
    if ([title ya_nilOrEmpty]) {
        return;
    }
    
    self.isDefaultBackBtn = NO;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 60, 20);
    [leftButton setTitle:title forState:UIControlStateNormal];
    [leftButton setTitleColor:textColor forState:UIControlStateNormal];
    [leftButton.titleLabel setFont:[UIFont ya_normalFontOfSize:15]];
    [leftButton addTarget:self action:@selector(onPressedLeftBarItem) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)setNavBarRightItem:(NSString *)title textColor:(UIColor *)textColor
{
    if ([title ya_nilOrEmpty]) {
        return;
    }
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 60, 20);
    [rightButton setTitle:title forState:UIControlStateNormal];
    [rightButton setTitleColor:textColor forState:UIControlStateNormal];
    [rightButton.titleLabel setFont:[UIFont ya_normalFontOfSize:15]];
    [rightButton addTarget:self action:@selector(onPressedRightBarItem:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton sizeToFit];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)setNavBarLeftItem:(UIImage *)normalImage hightedImage:(UIImage *)hightedImage
{
    self.isDefaultBackBtn = NO;
    
    CGSize buttonSize = CGSizeMake(24.f, 24.f);
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, buttonSize.width, buttonSize.height);
    [leftButton setImage:normalImage forState:UIControlStateNormal];
    [leftButton setImage:hightedImage forState:UIControlStateHighlighted];
    leftButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [leftButton addTarget:self action:@selector(onPressedLeftBarItem) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)setNavBarRightItem:(UIImage *)normalImage hightedImage:(UIImage *)hightedImage
{
    CGSize buttonSize = CGSizeMake(24.f, 24.f);
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, buttonSize.width, buttonSize.height);
    [rightButton setImage:normalImage forState:UIControlStateNormal];
    [rightButton setImage:hightedImage forState:UIControlStateHighlighted];
    rightButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [rightButton addTarget:self action:@selector(onPressedRightBarItem:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)setNavBarRightItem:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage
{
    CGSize buttonSize = CGSizeMake(24.f, 24.f);
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, buttonSize.width, buttonSize.height);
    [rightButton setImage:normalImage forState:UIControlStateNormal];
    [rightButton setImage:selectedImage forState:UIControlStateSelected];
    rightButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [rightButton addTarget:self action:@selector(onPressedRightBarItem:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)setDefaultBackBarItem
{
    self.isDefaultBackBtn = YES;
    
}

- (void)onPressedBackBarButton
{
    [self backToLastViewController];
}

- (void)onPressedLeftBarItem
{}

- (void)onPressedRightBarItem:(UIButton *)sender
{}

@end
