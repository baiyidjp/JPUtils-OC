//
//  ViewController.m
//  JPUtilsDemo
//
//  Created by SteyDong on 2021/1/20.
//

#import "ViewController.h"
#import "JPRouteUtils.h"
#import "TestViewController.h"
#import "JPLayoutUtils.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 200, 50)];
    button.backgroundColor = [UIColor blackColor];
    [button setTitle:@"路由Push" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(20, 260, 200, 50)];
    button1.backgroundColor = [UIColor blackColor];
    [button1 setTitle:@"路由Modal" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(clickButton1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];

    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(20, 320, JP_SCREENWIDTH*0.6, 50)];
    button2.backgroundColor = [UIColor blackColor];
    [button2 setTitle:@"路由Modal带导航" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(clickButton2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];

}

#pragma mark - click
- (void)clickButton {

//    [JPRouteUtils jp_routeScheme];
//
//    NSURL *url = [NSURL URLWithString:@"https://wwww.stey.com?title=123&subTitle=456"];
//    [JPRouteUtils jp_jumpWithRoute:url controller:self];
//
//    NSLog(@"=======================================");
//
//    NSURL *url_route1 = [JPRouteUtils jp_routeURLWithHost:@"TestViewController" queryDictionary:@{@"key1": @"value1"}];
//    NSLog(@"%@", url_route1);
//    [JPRouteUtils jp_jumpWithRoute:url_route1 controller:self];
//
//    NSLog(@"=======================================");

    NSURL *url_route2 = [JPRouteUtils jp_routeURLWithHost:@"TestViewController" queryDictionary:@{@"key1": @"value1", @"key2": @"value2"}];
//    NSLog(@"%@", url_route2);
//    [JPRouteUtils jp_jumpWithRoute:url_route2 controller:self];
    [JPRouteUtils jp_jumpWithRoute:url_route2 completion:^(id data) {
        NSLog(@"push->completionData: %@", data);
    }];
}

- (void)clickButton1 {

    NSURL *url_route2 = [JPRouteUtils jp_routeURLWithHost:@"TestViewController" queryDictionary:@{@"key1": @"value1", @"key2": @"value2"}];
//    [JPRouteUtils jp_jumpModalWithRoute:url_route2];
    [JPRouteUtils jp_jumpModalWithRoute:url_route2 completion:^(id data) {
        NSLog(@"modal->completionData: %@", data);
    }];
}

- (void)clickButton2 {

    NSURL *url_route2 = [JPRouteUtils jp_routeURLWithHost:@"TestViewController" queryDictionary:@{@"key1": @"value1", @"key2": @"value2"}];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[TestViewController alloc] init]];
//    [JPRouteUtils jp_jumpModalWithRoute:url_route2 navigationController:navigationController];
    [JPRouteUtils jp_jumpModalWithRoute:url_route2 controller:self navigationController:navigationController completion:^(id data) {
        NSLog(@"modal->completionDataNavigation: %@", data);
    }];
}


@end
