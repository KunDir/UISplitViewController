//
//  FKFoodDetailViewController.m
//  03-UISplitViewController
//
//  Created by kun on 15/1/31.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKFoodDetailViewController.h"
#import "FKFood.h"

@interface FKFoodDetailViewController ()

@property (nonatomic, weak) UIWebView *webView;

@end

@implementation FKFoodDetailViewController

- (void)loadView
{
    UIWebView *webView = [[UIWebView alloc] init];
    
    webView.frame = [UIScreen mainScreen].applicationFrame;
    
    self.view = webView;
    
    self.webView = webView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置标题
    self.title = self.food.name;
    
    // 加载网页
    NSString *filename = [NSString stringWithFormat:@"Html/food/%@", self.food.idstr];
    NSURL *url = [[NSBundle mainBundle] URLForResource:filename withExtension:@"html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

@end
