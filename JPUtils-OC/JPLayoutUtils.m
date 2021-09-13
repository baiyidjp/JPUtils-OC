//
// Created by SteyDong on 2021/1/21.
//

#import "JPLayoutUtils.h"


@implementation JPLayoutUtils

+ (UIEdgeInsets)stey_safeAreaInsets {
    UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
    if (![window isKeyWindow]) {
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        if (CGRectEqualToRect(keyWindow.bounds, [UIScreen mainScreen].bounds)) {
            window = keyWindow;
        }
    }
    if (@available(iOS 11.0, *)) {
        UIEdgeInsets insets = [window safeAreaInsets];
        return insets;
    }
    return UIEdgeInsetsZero;
}

+ (BOOL)jp_iPhoneXLaterDevice {

    if ([UIWindow instancesRespondToSelector:@selector(safeAreaInsets)]) {
        return [self stey_safeAreaInsets].bottom > 0;
    }
    return (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375, 812)) ||
            CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(812, 375)) ||
            CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(414, 896)) ||
            CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(896, 414)) ||
            CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(390, 844)) ||
            CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(844, 390)) ||
            CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(428, 926)) ||
            CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(926, 428)));
}

+ (CGFloat)jp_statusBarHeight {
    if ([UIWindow instancesRespondToSelector:@selector(safeAreaInsets)]) {
        return [self stey_safeAreaInsets].top;
    }
    return 20;
}

+ (CGFloat)jp_navigationBarHeight {
    return 44 + [JPLayoutUtils jp_statusBarHeight];
}

+ (CGFloat)jp_bottomSafeHeight {
    if ([UIWindow instancesRespondToSelector:@selector(safeAreaInsets)]) {
        return [self stey_safeAreaInsets].bottom;
    }
    return 0;
}

+ (CGFloat)jp_tabBarHeight {
    return 49 + [JPLayoutUtils jp_bottomSafeHeight];
}

+ (CGFloat)jp_bottomMargin:(CGFloat)margin {
    return margin + [JPLayoutUtils jp_bottomSafeHeight];
}

+ (CGFloat)jp_layoutByScreen:(CGFloat)layout {

    return JP_SCREENWIDTH*layout/375.0;
}

+ (CGFloat)jp_layoutByHorScreen:(CGFloat)layout {

    return JP_SCREENHEIGHT*layout/375.0;
}

@end