//
//  TestViewController.m
//  JPUtilsDemo
//
//  Created by SteyDong on 2021/1/20.
//

#import "TestViewController.h"
#import "UIViewController+JPCategory.h"
#import "JPRouteUtils.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Test";

    self.view.backgroundColor = UIColor.whiteColor;

    NSLog(@"%@", self.jp_parameters);

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 100, 50)];
    button.backgroundColor = [UIColor blackColor];
    [button setTitle:@"路由Push" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark - click
- (void)clickButton {

    NSURL *url_route2 = [JPRouteUtils jp_routeURLWithHost:@"TestSubViewController" queryDictionary:@{@"key1-s": @"value1", @"key2-s": @"value2"}];
    [JPRouteUtils jp_jumpWithRoute:url_route2];
}

@end
