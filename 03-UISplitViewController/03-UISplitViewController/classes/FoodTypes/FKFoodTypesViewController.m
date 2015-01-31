//
//  FKFoodTypesViewController.m
//  03-UISplitViewController
//
//  Created by kun on 15/1/31.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKFoodTypesViewController.h"
#import "FKFoodType.h"
#import "MJExtension.h"

@interface FKFoodTypesViewController ()
@property (nonatomic, strong) NSArray *foodTypes;

@end

@implementation FKFoodTypesViewController

- (NSArray *)foodTypes
{
    if(_foodTypes == nil)
    {
//        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"food_types.plist" ofType:nil]];
//        
//        _foodTypes = [FKFoodType objectArrayWithKeyValuesArray:dictArray];
        
        _foodTypes = [FKFoodType objectArrayWithFilename:@"food_types.plist"];
    }
    return _foodTypes;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"菜系";
}



#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.foodTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    NSString *ID = @"food_type";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    // 2.设置cell的数据
    FKFoodType *foodType = self.foodTypes[indexPath.row];
    cell.textLabel.text = foodType.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(foodTypesViewController:didSelectedFoodType:)])
    {
        FKFoodType *foodType = self.foodTypes[indexPath.row];
        [self.delegate foodTypesViewController:self didSelectedFoodType:foodType];
    }
}

@end
