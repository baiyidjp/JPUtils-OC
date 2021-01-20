//
//  JPUtilsConfig.m
//  JPUtilsDemo
//
//  Created by SteyDong on 2021/1/20.
//

#import "JPUtilsConfig.h"
#import "JPStringUtils.h"
#import "objc/runtime.h"

@implementation JPUtilsConfig

+ (NSArray *)jp_supportLanguages {
    return @[@"zh", @"en"];
}

+ (void)jp_configCurrentLanguage:(NSString *)language {

    if ([JPStringUtils jp_stringIsNull:language]) {
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

+ (void)setJp_routeScheme:(NSString *)jp_routeScheme {

    objc_setAssociatedObject(self, @selector(jp_routeScheme), jp_routeScheme, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (NSString *)jp_routeScheme {

    return objc_getAssociatedObject(self, _cmd);
}

@end
