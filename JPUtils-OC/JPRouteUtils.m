//
// Created by SteyDong on 2021/1/20.
//

#import "JPRouteUtils.h"
#import "JPStringUtils.h"
#import "JPViewUtils.h"
#import "objc/runtime.h"
#import "UIViewController+JPCategory.h"

static NSString *JPRouteScheme = @"JPRouteScheme";

@implementation JPRouteUtils

+ (void)jp_configRouteScheme:(NSString *)routeScheme {

    JPRouteUtils.jp_routeScheme = routeScheme;
}

+ (void)setJp_routeScheme:(NSString *)jp_routeScheme {

    if ([JPStringUtils jp_stringIsNull:jp_routeScheme]) {
        NSLog(@"%@: 不能配置Scheme为'',nil, 使用默认: 'JPRouteScheme'",[[NSString stringWithUTF8String:__FILE__] lastPathComponent]);
        jp_routeScheme = JPRouteScheme;
    }
    if ([@"http" isEqualToString:jp_routeScheme.lowercaseString] || [@"https" isEqualToString:jp_routeScheme.lowercaseString]) {
        NSLog(@"%@: 不能配置Scheme为'%@',使用默认: 'JPRouteScheme'",[[NSString stringWithUTF8String:__FILE__] lastPathComponent], jp_routeScheme);
        jp_routeScheme = JPRouteScheme;
    }
    objc_setAssociatedObject(self, @selector(jp_routeScheme), jp_routeScheme, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (NSString *)jp_routeScheme {

    return objc_getAssociatedObject(self, _cmd);
}

+ (NSURL *)jp_routeURLWithHost:(NSString *)host {

    return [JPRouteUtils jp_routeURLWithScheme:JPRouteUtils.jp_routeScheme host:host queryDictionary:nil];
}

+ (NSURL *)jp_routeURLWithHost:(NSString *)host queryDictionary:(NSDictionary *)queryDictionary {

    return [JPRouteUtils jp_routeURLWithScheme:JPRouteUtils.jp_routeScheme host:host queryDictionary:queryDictionary];
}

+ (NSURL *)jp_routeURLWithScheme:(NSString *)scheme host:(NSString *)host queryDictionary:(NSDictionary *)queryDictionary {

    if ([JPStringUtils jp_stringIsNull:scheme]) {
        scheme = JPRouteScheme;
    }

    NSString *queryString = @"";
    if (queryDictionary && queryDictionary.allKeys.count > 0) {
        queryString = [JPStringUtils jp_queryStringWithDictionary:queryDictionary];
    }
    //route://controllerName?key1=value1&key2=value2
    NSString *routeString = [NSString stringWithFormat:@"%@://%@", scheme, host];
    if ([JPStringUtils jp_stringIsNotNull:queryString]) {
        routeString = [routeString stringByAppendingFormat:@"?%@", queryString];
    }

    NSURL *routeURL = [NSURL URLWithString:routeString];
    return routeURL;
}

+ (void)jp_jumpWithRoute:(NSURL *)route {

    [JPRouteUtils jp_jumpWithRoute:route controller:[JPViewUtils jp_currentController]];
}

+ (void)jp_jumpWithRoute:(NSURL *)route completion:(JPRouteCompletion)completion {

    [JPRouteUtils jp_jumpWithRoute:route controller:[JPViewUtils jp_currentController] completion:completion];
}

+ (void)jp_jumpWithRoute:(NSURL *)route controller:(UIViewController *)controller {

    [JPRouteUtils jp_jumpWithRoute:route controller:controller completion:nil];
}

+ (void)jp_jumpWithRoute:(NSURL *)route controller:(UIViewController *)controller completion:(JPRouteCompletion)completion {

    [JPRouteUtils jp_jumpWithRoute:route controller:controller push:YES navigationController:nil animated:YES completion:completion];
}

+ (void)jp_jumpModalWithRoute:(NSURL *)route {

    [JPRouteUtils jp_jumpModalWithRoute:route navigationController:nil];
}

+ (void)jp_jumpModalWithRoute:(NSURL *)route completion:(JPRouteCompletion)completion {

    [JPRouteUtils jp_jumpModalWithRoute:route controller:[JPViewUtils jp_currentController] completion:completion];
}

+ (void)jp_jumpModalWithRoute:(NSURL *)route navigationController:(UINavigationController *)navigationController {

    [JPRouteUtils jp_jumpModalWithRoute:route controller:[JPViewUtils jp_currentController] navigationController:navigationController];
}

+ (void)jp_jumpModalWithRoute:(NSURL *)route controller:(UIViewController *)controller {

    [JPRouteUtils jp_jumpModalWithRoute:route controller:controller navigationController:nil];
}

+ (void)jp_jumpModalWithRoute:(NSURL *)route controller:(UIViewController *)controller navigationController:(UINavigationController *)navigationController {

    [JPRouteUtils jp_jumpModalWithRoute:route controller:controller navigationController:navigationController completion:nil];
}

+ (void)jp_jumpModalWithRoute:(NSURL *)route controller:(UIViewController *)controller completion:(JPRouteCompletion)completion {

    [JPRouteUtils jp_jumpModalWithRoute:route controller:controller navigationController:nil completion:completion];
}

+ (void)jp_jumpModalWithRoute:(NSURL *)route controller:(UIViewController *)controller navigationController:(UINavigationController *)navigationController completion:(JPRouteCompletion)completion {

    [JPRouteUtils jp_jumpWithRoute:route controller:controller push:NO navigationController:navigationController animated:YES completion:completion];
}

+ (void)jp_jumpWithRoute:(NSURL *)route controller:(UIViewController *)controller push:(BOOL)isPush navigationController:(UINavigationController *)navigationController animated:(BOOL)isAnimated completion:(JPRouteCompletion)completion {

    NSString *scheme = route.scheme;
    NSString *host = route.host;
    NSString *query = route.query;
    NSLog(@"当前route: %@", route);
    if ([scheme isEqualToString:JPRouteUtils.jp_routeScheme] || [scheme isEqualToString:JPRouteScheme]) {

        if ([JPStringUtils jp_stringIsNotNull:host]) {
            Class routeClass = NSClassFromString(host);
            UIViewController *jumpController = (UIViewController *)[[routeClass alloc] init];
            NSDictionary *queryDictionary = [JPStringUtils jp_dictionaryWithQueryString:query];
            if (queryDictionary) {
                jumpController.jp_parameters = queryDictionary;
            }

            if (isPush) {
                if (controller.navigationController) {
                    [controller.navigationController pushViewController:jumpController animated:isAnimated];
                    if (completion) {
                        jumpController.jp_routeCompletion = ^(id  _Nonnull data) {
                            completion(data);
                        };
                    }
                } else {
                    NSLog(@"%@: 当前页面没有被UINavigationController包裹，不能使用Push", [[NSString stringWithUTF8String:__FILE__] lastPathComponent]);
                }
            }

            if (!isPush) {
                if (navigationController) {
                    UIViewController *visibleViewController = navigationController.visibleViewController;
                    if (visibleViewController && [visibleViewController isKindOfClass:routeClass]) {
                        visibleViewController.jp_parameters = queryDictionary;
                        if (completion) {
                            visibleViewController.jp_routeCompletion = ^(id  _Nonnull data) {
                                completion(data);
                            };
                        }
                    } else {
                        NSLog(@"%@: 传入的host与UINavigationController的rootViewController不一致时不可使用默认传参和回调", [[NSString stringWithUTF8String:__FILE__] lastPathComponent]);
                    }
                    [controller presentViewController:navigationController animated:isAnimated completion:nil];
                } else {
                    [controller presentViewController:jumpController animated:isAnimated completion:nil];
                    if (completion) {
                        jumpController.jp_routeCompletion = ^(id  _Nonnull data) {
                            completion(data);
                        };
                    }
                }
            }
        } else {
            NSLog(@"%@: 传入的host不可为空或者nil", [[NSString stringWithUTF8String:__FILE__] lastPathComponent]);
        }

    } else if ([@"http" isEqualToString:scheme.lowercaseString] || [@"https" isEqualToString:scheme.lowercaseString]) {

    }
}

@end
