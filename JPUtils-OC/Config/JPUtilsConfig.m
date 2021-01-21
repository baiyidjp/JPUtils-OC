//
//  JPUtilsConfig.m
//  JPUtilsDemo
//
//  Created by SteyDong on 2021/1/20.
//

#import "JPUtilsConfig.h"
#import "JPRouteUtils.h"

@implementation JPUtilsConfig

+ (NSArray *)jp_supportLanguages {
    return @[@"zh", @"en"];
}

+ (void)jp_configCurrentLanguage:(NSString *)language {

    if ([JPUtilsConfig jp_stringIsNull:language]) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:JPUtils_Date_CurrentLanguage];
    } else {
        if ([[JPUtilsConfig jp_supportLanguages] containsObject:language]) {
            [[NSUserDefaults standardUserDefaults] setObject:language forKey:JPUtils_Date_CurrentLanguage];
            [[NSUserDefaults standardUserDefaults] synchronize];
        } else {
            NSLog(@"%s: language只支持'zh,en'", __func__);
            return;
        }
    }
}

+ (BOOL)jp_stringIsNull:(NSString *)string {

    if (!string || !string.length) {
        return true;
    } else {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimmingString = [string stringByTrimmingCharactersInSet:set];
        if ([trimmingString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}

+ (void)jp_configRouteScheme:(NSString *)routeScheme {

    JPRouteUtils.jp_routeScheme = routeScheme;
}

@end
