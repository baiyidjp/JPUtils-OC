//
//  TestSubViewController.m
//  JPUtilsDemo
//
//  Created by SteyDong on 2021/1/20.
//

#import "TestSubViewController.h"
#import "UIViewController+JPCategory.h"

@interface TestSubViewController ()

@end

@implementation TestSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"TestSub";

    self.view.backgroundColor = UIColor.whiteColor;

    NSLog(@"%@", self.jp_parameters);
    
    NSLog(@"viewControllers: %@",self.navigationController.viewControllers);
    NSLog(@"childViewControllers: %@",self.navigationController.childViewControllers);

}

- (void)viewWillDisappear:(BOOL)animated {

//    [super viewWillDisappear:animated];

    if (self.jp_routeCompletion) {
        self.jp_routeCompletion(@"测试回调数据");
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
