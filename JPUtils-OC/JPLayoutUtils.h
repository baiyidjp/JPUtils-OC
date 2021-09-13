//
// Created by SteyDong on 2021/1/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 * 当前屏幕的宽度
 */
#define JP_SCREENWIDTH                                  ([UIScreen mainScreen].bounds.size.width)

/**
 * 当前屏幕的高度
 */
#define JP_SCREENHEIGHT                                 ([UIScreen mainScreen].bounds.size.height)

/**
 * 判断是否是 iPhone X 及其他刘海屏
 */
#define JP_IPHONEX                                      [JPLayoutUtils jp_iPhoneXLaterDevice]

/**
 * 状态栏高度
 */
#define JP_STATUSBARHEIGHT                              [JPLayoutUtils jp_statusBarHeight]

/**
 * 导航栏高度
 */
#define JP_NAVIGATIONBARHEIGHT                          [JPLayoutUtils jp_navigationBarHeight]

/**
 * 刘海屏底部安全距离(非刘海屏为0)
 */
#define JP_BOTTOMINDICATORHEIGHT                        [JPLayoutUtils jp_bottomSafeHeight]

/**
 * tabBar高度
 */
#define JP_TABBARHEIGHT                                 [JPLayoutUtils jp_tabBarHeight]

/**
 * 适配刘海屏底部间距
 */
#define JP_BOTTOMMARGIN(margin)                         [JPLayoutUtils jp_bottomMargin:(margin)]

/**
 * 适配竖屏幕的数值(375宽度的屏幕为基准)
 */
#define JP_LAYOUTBYSCREEN(layout)                       [JPLayoutUtils jp_layoutByScreen:(layout)]

/**
 * * 适配横屏幕的数值(375宽度的屏幕为基准)
 */
#define JP_LAYOUTBYHORSCREEN(layout)                    [JPLayoutUtils jp_layoutByHorScreen:(layout)]

@interface JPLayoutUtils : NSObject

/**
 * 是否是 iPhone X 及其他刘海屏
 * @return
 */
+ (BOOL)jp_iPhoneXLaterDevice;

/**
 * 状态栏高度
 * @return
 */
+ (CGFloat)jp_statusBarHeight;

/**
 * 导航栏高度
 * @return
 */
+ (CGFloat)jp_navigationBarHeight;

/**
 * 刘海屏底部的安全距离
 * @return
 */
+ (CGFloat)jp_bottomSafeHeight;

/**
 * tabBar高度
 * @return
 */
+ (CGFloat)jp_tabBarHeight;

/**
 * 适配刘海屏底部间距
 * @param margin
 * @return
 */
+ (CGFloat)jp_bottomMargin:(CGFloat)margin;

/**
 * 适配竖屏幕的数值(375宽度的屏幕为基准)
 * @return
 */
+ (CGFloat)jp_layoutByScreen:(CGFloat)layout;

/**
 * 适配横屏幕的数值(375宽度的屏幕为基准)
 * @return
 */
+ (CGFloat)jp_layoutByHorScreen:(CGFloat)layout;

@end