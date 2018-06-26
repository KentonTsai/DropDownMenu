//
//  ViewController.m
//  dropDownMenuTest
//
//  Created by Kenton on 2015/12/9.
//  Copyright © 2015年 Kenton. All rights reserved.
//

#import "ViewController.h"
#import "DropDownMenu.h"

@interface ViewController ()<DropDownMenuDataSource,DropDownMenuDelegate>
@property(nonatomic,strong) NSArray *cellArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initDropDownMenu];
}

- (void)initDropDownMenu{
    UIView * container = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 62, 30)];
    UIButton *activityBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 62, 30)];
    activityBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [activityBtn setTitle:@"附近" forState:UIControlStateNormal];
    [activityBtn setImage:[UIImage imageNamed:@"expandableImage"] forState:UIControlStateNormal];
    activityBtn.imageEdgeInsets = UIEdgeInsetsMake(11, 52, 11, 0);
    [activityBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [activityBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    //    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:activityBtn];
    [container addSubview:activityBtn];
    self.navigationItem.titleView = container;
    
    _cellArr = @[@"mike", @"MH", @"Amber", @"Amy"];
    DropDownMenu *menu = [[DropDownMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:38*_cellArr.count];
    //    menu.transformView = activityBtn.imageView;
    menu.tag = 1001;
    menu.dataSource = self;
    menu.delegate = self;
    [self.view addSubview:menu];
}

- (void)btnPressed:(id)sender{
    DropDownMenu *menu = (DropDownMenu*)[self.view viewWithTag:1001];
    [UIView animateWithDuration:0.2 animations:^{
        
    } completion:^(BOOL finished) {
        [menu menuTapped];
    }];
}

#pragma mark - DropDown datasource & delegate

- (NSInteger)menu:(DropDownMenu *)menu tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    return _cellArr.count;
}
- (NSString *)menu:(DropDownMenu *)menu tableView:(UITableView*)tableView titleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _cellArr[indexPath.row];
}


- (void)menu:(DropDownMenu *)menu tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
