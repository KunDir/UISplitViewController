//
//  FKFoodTypesViewController.h
//  03-UISplitViewController
//
//  Created by kun on 15/1/31.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FKFoodTypesViewController, FKFoodType;

@protocol FKFoodTypesViewControllerDelegate <NSObject>
@optional
- (void)foodTypesViewController:(FKFoodTypesViewController *)foodTypesVc didSelectedFoodType:(FKFoodType *)type;

@end

@interface FKFoodTypesViewController : UITableViewController

@property (nonatomic, weak) id<FKFoodTypesViewControllerDelegate> delegate;

@end
