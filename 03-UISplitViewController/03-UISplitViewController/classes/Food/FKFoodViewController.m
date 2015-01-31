//
//  FKFoodViewController.m
//  03-UISplitViewController
//
//  Created by kun on 15/1/31.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKFoodViewController.h"
#import "FKFoodTypesViewController.h"
#import "FKFoodType.h"
#import "MJExtension.h"
#import "FKFood.h"
#import "FKFoodDetailViewController.h"

@interface FKFoodViewController () <FKFoodTypesViewControllerDelegate, UISplitViewControllerDelegate>

@property (nonatomic, strong) NSArray *foods;
@end

@implementation FKFoodViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"菜系" style:UIBarButtonItemStyleDone target:self action:@selector(showFoodTypes)];
    barButtonItem.title = @"菜系";
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

// 有多少块
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// 对应的块有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.foods.count;
}

// 每一行cell显示的数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ID = @"food";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    FKFood *food = self.foods[indexPath.row];
    cell.textLabel.text = food.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"难度：%@ 时间：%@", food.diff, food.time];
    
    return cell;
}

// 点击那一行cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FKFood *food = self.foods[indexPath.row];
    
    FKFoodDetailViewController *detail = [[FKFoodDetailViewController alloc] init];
    
    detail.food = food;
    
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark - FKFoodTypesViewControllerDelegate
- (void)foodTypesViewController:(FKFoodTypesViewController *)foodTypesVc didSelectedFoodType:(FKFoodType *)type
{
    // 文件名
    NSString *filename = [NSString stringWithFormat:@"type_%@_foods.plist", type.idstr];
    
    // 加载数据
    _foods = [FKFood objectArrayWithFilename:filename];
    
    // 设置标题
    self.title = type.name;
    
    // 刷新表格
    [self.tableView reloadData];
}

#pragma mark - UISplitViewControllerDelegate
- (void)splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode
{
//    UISplitViewControllerDisplayModeAutomatic,
//    UISplitViewControllerDisplayModePrimaryHidden,
//    UISplitViewControllerDisplayModeAllVisible,
//    UISplitViewControllerDisplayModePrimaryOverlay,
}

- (void)showFoodTypes
{
    
}

@end
