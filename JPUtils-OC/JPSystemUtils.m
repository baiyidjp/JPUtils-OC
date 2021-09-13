//
// Created by SteyDong on 2021/1/20.
//

#import "JPSystemUtils.h"
#import "sys/utsname.h"
#import "JPStringUtils.h"
#import <AdSupport/AdSupport.h>

@implementation JPSystemUtils

+ (void)jp_openSystemURL:(NSURL *)url {

    if ([[UIApplication sharedApplication] canOpenURL: url]) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    }
}

+ (void)jp_openSystemSettingsPage {

    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    [JPSystemUtils jp_openSystemURL:url];
}

+ (NSString *)jp_deviceUDID {

    NSString *udid = [[NSUserDefaults standardUserDefaults] objectForKey:JPSystemUtils_UDID];

    //本地不存在
    if ([JPStringUtils jp_stringIsNull:udid]) {
        //获取IDFA
        udid = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];

        //获取IDFA失败或者用户开启了限制广告追踪
        if ([JPStringUtils jp_stringIsNull:udid] || [udid isEqualToString:@"00000000-0000-0000-0000-000000000000"]) {
            //获取IDFV
            udid = [[UIDevice currentDevice].identifierForVendor UUIDString];

            //IDFV获取失败
            if ([JPStringUtils jp_stringIsNull:udid]) {
                //获取UUID
                udid = [[NSUUID UUID] UUIDString];
            }
        }
        [[NSUserDefaults standardUserDefaults] setObject:udid forKey:JPSystemUtils_UDID];
    }

    return udid;
}

+ (BOOL)jp_isVPNConnected {

    NSDictionary *dict = CFBridgingRelease(CFNetworkCopySystemProxySettings());
    NSArray *keys = [dict[@"__SCOPED__"]allKeys];
    for (NSString *key in keys) {
        if ([key rangeOfString:@"tap"].location != NSNotFound ||
                [key rangeOfString:@"tun"].location != NSNotFound ||
                [key rangeOfString:@"ipsec"].location != NSNotFound ||
                [key rangeOfString:@"ppp"].location != NSNotFound) {
            return YES;;
        }
    }
    return NO;
}


+ (UIWindow *)jp_keyWindow {

    UIWindow *window = nil;

    if (@available(iOS 13.0, *)) {
        for (UIWindowScene *windowScene in [UIApplication sharedApplication].connectedScenes) {
            if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                window = windowScene.windows.firstObject;
                break;
            }
        }
    } else {
        window = [UIApplication sharedApplication].keyWindow;
    }

    return window;
}

+ (NSString *)jp_deviceVersion {

    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)jp_appVersion {

    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = infoDictionary[@"CFBundleShortVersionString"];
    return app_Version;
}

+ (NSString *)jp_appBundleId {

    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_BundleId = infoDictionary[@"CFBundleIdentifier"];
    return app_BundleId;
}

+ (NSString *)jp_appBuildId {

    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_BuildId = infoDictionary[@"CFBundleVersion"];
    return app_BuildId;
}

//手机型号
+ (NSString *)jp_deviceModel {

    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    //iPhone
    if ([deviceString isEqualToString:@"iPhone6,1"] || [deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE 1";
    if ([deviceString isEqualToString:@"iPhone9,1"] || [deviceString isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,2"] || [deviceString isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    if ([deviceString isEqualToString:@"iPhone10,1"] || [deviceString isEqualToString:@"iPhone10,4"])    return @"iPhone 8";
    if ([deviceString isEqualToString:@"iPhone10,2"] || [deviceString isEqualToString:@"iPhone10,5"])    return @"iPhone 8 Plus";
    if ([deviceString isEqualToString:@"iPhone10,3"] || [deviceString isEqualToString:@"iPhone10,6"])    return @"iPhone X";
    if ([deviceString isEqualToString:@"iPhone11,8"])    return @"iPhone XR";
    if ([deviceString isEqualToString:@"iPhone11,2"])    return @"iPhone XS";
    if ([deviceString isEqualToString:@"iPhone11,6"] || [deviceString isEqualToString:@"iPhone11,4"])    return @"iPhone XS MAX";
    if ([deviceString isEqualToString:@"iPhone12,1"])    return @"iPhone 11";
    if ([deviceString isEqualToString:@"iPhone12,3"])    return @"iPhone 11 Pro";
    if ([deviceString isEqualToString:@"iPhone12,5"])    return @"iPhone 11 Pro Max";
    if ([deviceString isEqualToString:@"iPhone12,8"])    return @"iPhone SE 2";
    if ([deviceString isEqualToString:@"iPhone13,1"])    return @"iPhone 12 mini";
    if ([deviceString isEqualToString:@"iPhone13,2"])    return @"iPhone 12";
    if ([deviceString isEqualToString:@"iPhone13,3"])    return @"iPhone 12 Pro";
    if ([deviceString isEqualToString:@"iPhone13,4"])    return @"iPhone 12 Pro Max";

    return deviceString;
}


@end
