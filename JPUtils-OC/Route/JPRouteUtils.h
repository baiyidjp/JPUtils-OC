//
// Created by SteyDong on 2021/1/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 * https://www.baidu.com?title=哈哈&sub=hhhh
 * jp://controllerName?key1=value1&key2=value2
 */

typedef void(^JPRouteCompletion)(id data);

@interface JPRouteUtils : NSObject

/**
 * 配置路由的默认scheme
 * @param routeScheme
 */
+ (void)jp_configRouteScheme:(NSString *)routeScheme;

/** jp_routeScheme */
@property(nonatomic,strong,class) NSString *jp_routeScheme;

/**
 * 获取路由URL，默认使用 jp_routeScheme, 没有query数据
 * @param host 要跳转的目标控制器的名称
 * @return 路由URL
 */
+ (NSURL *)jp_routeURLWithHost:(NSString *)host;

/**
 * 获取路由的URL
 * 获取路由URL，默认使用 jp_routeScheme
 * @param host  要跳转的目标控制器的名称
 * @param queryDictionary 要传给目标控制器的参数
 * @return 路由URL
 */
+ (NSURL *)jp_routeURLWithHost:(NSString *)host queryDictionary:(NSDictionary *)queryDictionary;

/**
 * 获取路由的URL
 * @param scheme : https 或者自定义的 jp_routeScheme
 * @param host  要跳转的目标控制器的名称
 * @param queryDictionary 要传给目标控制器的参数
 * @return 路由URL
 */
+ (NSURL *)jp_routeURLWithScheme:(NSString *)scheme host:(NSString *)host queryDictionary:(NSDictionary *)queryDictionary;

/**
 * 路由跳转 push
 * @param route 路由url
 */
+ (void)jp_jumpWithRoute:(NSURL *)route;

/**
 * 路由跳转 push
 * @param route 路由url
 * @param completion 回调
 */
+ (void)jp_jumpWithRoute:(NSURL *)route completion:(JPRouteCompletion)completion;

/**
 * 路由跳转 push
 * @param route 路由url
 * @param controller 当前所在的controller
 */
+ (void)jp_jumpWithRoute:(NSURL *)route controller:(UIViewController *)controller;

/**
 * 路由跳转 push
 * @param route 路由url
 * @param controller 当前所在的controller
 * @param completion 回调
 */
+ (void)jp_jumpWithRoute:(NSURL *)route controller:(UIViewController *)controller completion:(JPRouteCompletion)completion;

/**
 * 路由跳转 modal
 * @param route 路由URL
 */
+ (void)jp_jumpModalWithRoute:(NSURL *)route;

/**
 * 路由跳转 modal
 * @param route 路由URL
 * @param completion 回调
 */
+ (void)jp_jumpModalWithRoute:(NSURL *)route completion:(JPRouteCompletion)completion;

/**
 * 路由跳转 modal
 * @param route
 * @param navigationController 是否要包一个navigationController
 */
+ (void)jp_jumpModalWithRoute:(NSURL *)route navigationController:(UINavigationController *)navigationController;


/**
 * 路由跳转 modal
 * @param route 路由URL
 * @param controller 当前所在的controller
 */
+ (void)jp_jumpModalWithRoute:(NSURL *)route controller:(UIViewController *)controller;

+ (void)jp_jumpModalWithRoute:(NSURL *)route controller:(UIViewController *)controller navigationController:(UINavigationController *)navigationController;

/**
 * 路由跳转 modal
 * @param route 路由URL
 * @param controller 当前所在的controller
 * @param completion 回调
 */
+ (void)jp_jumpModalWithRoute:(NSURL *)route controller:(UIViewController *)controller completion:(JPRouteCompletion)completion;

+ (void)jp_jumpModalWithRoute:(NSURL *)route controller:(UIViewController *)controller navigationController:(UINavigationController *)navigationController completion:(JPRouteCompletion)completion;

/**
 * 路由跳转
 * @param route 路由url
 * @param controller 当前所在的controller
 * @param isPush 是否是push
 * @param navigationController 是否要包一个navigationController
 * @param isAnimated 是否需要动画
 * @param completion 回调
 */
+ (void)jp_jumpWithRoute:(NSURL *)route controller:(UIViewController *)controller push:(BOOL)isPush navigationController:(UINavigationController *)navigationController animated:(BOOL)isAnimated completion:(JPRouteCompletion)completion;

@end
