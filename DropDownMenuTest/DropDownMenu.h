//
//  DropDownMenu.h
//  dropDownMenuTest
//
//  Created by Kenton on 2015/12/9.
//  Copyright © 2015年 Kenton. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DropDownMenu;

@protocol DropDownMenuDataSource <NSObject>

@required
- (NSInteger)menu:(DropDownMenu *)menu tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section;
- (NSString *)menu:(DropDownMenu *)menu tableView:(UITableView*)tableView titleForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

#pragma mark - delegate
@protocol DropDownMenuDelegate <NSObject>
@optional
- (void)menu:(DropDownMenu *)menu tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface DropDownMenu : UIView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *leftTableView;

@property (nonatomic, weak) id <DropDownMenuDataSource> dataSource;
@property (nonatomic, weak) id <DropDownMenuDelegate> delegate;

- (instancetype)initWithOrigin:(CGPoint)origin andHeight:(CGFloat)height;

-(void)menuTapped;

@end

