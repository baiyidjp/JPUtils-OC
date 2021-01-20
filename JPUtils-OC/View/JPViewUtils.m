//
// Created by SteyDong on 2021/1/20.
//

#import "JPViewUtils.h"
#import "JPSystemUtils.h"

@implementation JPViewUtils

+ (UIViewController *)jp_currentController {

    UIViewController *rootViewController = [JPSystemUtils jp_keyWindow].rootViewController;

    UIViewController *currentVC = [self jp_currentControllerFrom:rootViewController];

    return currentVC;
}

+ (UIViewController *)jp_currentControllerFrom:(UIViewController *)rootVC {

    UIViewController *currentController;

    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }

    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController,找出当前选中的controller,在继续遍历
        currentController = [self jp_currentControllerFrom:[(UITabBarController *) rootVC selectedViewController]];

    } else if ([rootVC isKindOfClass:[UINavigationController class]]) {
        // 根视图为UINavigationController,找出当前Navigation展示的controller
        currentController = [self jp_currentControllerFrom:[(UINavigationController *) rootVC visibleViewController]];

    } else {
        // 根视图为非导航类
        currentController = rootVC;
    }

    return currentController;
}

@end