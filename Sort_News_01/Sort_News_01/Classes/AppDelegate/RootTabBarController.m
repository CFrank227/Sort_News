//
//  RootTabBarController.m
//  Sort_News_01
//
//  Created by lanou3g on 15/7/9.
//  Copyright (c) 2015年 Frank. All rights reserved.
//

#import "RootTabBarController.h"

@interface RootTabBarController ()

- (void)loadSubViews;

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(leftBarButtonItemAction:)];
    
    [self loadSubViews];
}


- (void)loadSubViews
{
    GroomTableViewController *groomTVC = [GroomTableViewController new];
    groomTVC.title = @"推荐";
    UINavigationController *groomNC = [[UINavigationController alloc] initWithRootViewController:groomTVC];
    groomNC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"推荐" image:nil tag:11];
    
    
    HotTableViewController *hotTVC = [HotTableViewController new];
    hotTVC.title = @"热门";
    UINavigationController *hotNC = [[UINavigationController alloc] initWithRootViewController:hotTVC];
    hotTVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"热门" image:nil tag:12];
    
    LocalTableViewController *localTVC = [LocalTableViewController new];
    localTVC.title = @"本地";
    UINavigationController *localNC = [[UINavigationController alloc] initWithRootViewController:localTVC];
    localNC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"本地" image:nil tag:13];
    
    TechnologyTableViewController *technologyTVC = [TechnologyTableViewController new];
    technologyTVC.title = @"科技";
    UINavigationController *technologyNC = [[UINavigationController alloc] initWithRootViewController:technologyTVC];
    technologyNC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"科技" image:nil tag:14];
    
    FunnyTableViewController *funnyTVC = [FunnyTableViewController new];
    funnyTVC.title = @"逗比";
    UINavigationController *funnyNC = [[UINavigationController alloc] initWithRootViewController:funnyTVC];
    funnyNC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"逗比" image:nil tag:15];
    
    
    self.viewControllers = @[groomNC, hotNC, localNC, technologyNC, funnyNC];
    
    
//    RootTabBarController *rootTBC = [RootTabBarController new];
//    rootTBC.viewControllers =  @[groomNC];//@[groomNC, hotNC, localNC, technologyNC, funnyNC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
