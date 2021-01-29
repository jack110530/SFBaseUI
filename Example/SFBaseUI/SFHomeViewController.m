//
//  SFHomeViewController.m
//  SFBaseUI_Example
//
//  Created by 黄山锋 on 2021/1/12.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import "SFHomeViewController.h"
// demo
#import "SFCountdownLabelDemo.h"
#import "SFCountdownViewDemo.h"
#import "SFCountdownButtonDemo.h"
#import "SFCircleProgressViewDemo.h"
#import "SFTableMvcDemo.h"
#import "SFTableMvvmDemo.h"
#import "SFDarkModeDemo.h"
#import "SFWebViewDemo.h"


@interface SFHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy) NSArray *datas;

@end

@implementation SFHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.datas = @[
        @"SFCountdownLabelDemo",
        @"SFCountdownViewDemo",
        @"SFCountdownButtonDemo",
        @"SFCircleProgressViewDemo",
        @"SFTableMvcDemo",
        @"SFTableMvvmDemo",
        @"SFDarkModeDemo",
        @"SFWebViewDemo",
    ];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *clsStr = cell.textLabel.text;
    Class cls = NSClassFromString(clsStr);
    [self.navigationController pushViewController:[[cls alloc]init] animated:YES];
}

@end
