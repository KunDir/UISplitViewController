//
//  FKMainViewController.m
//  03-UISplitViewController
//
//  Created by kun on 15/1/31.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKMainViewController.h"
#import "FKFoodTypesViewController.h"
#import "FKFoodViewController.h"

@implementation FKMainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.取出foodTypes
    UINavigationController *foodTypesNav = [self.viewControllers firstObject];
    FKFoodTypesViewController *foodTypesVc = [foodTypesNav.viewControllers firstObject];
    
    // 2.取出food
    UINavigationController *foodNav = [self.viewControllers lastObject];
    FKFoodViewController <FKFoodTypesViewControllerDelegate, UISplitViewControllerDelegate>*foodVc = [foodNav.viewControllers firstObject];
    
    // 3.设置代理
    foodTypesVc.delegate = foodVc;
    self.delegate = foodVc;
}
@end
