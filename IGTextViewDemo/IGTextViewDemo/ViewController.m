//
//  ViewController.m
//  IGTextViewDemo
//
//  Created by Kennith.Zeng on 2018/3/29.
//  Copyright © 2018年 Kennith.Zeng. All rights reserved.
//

#import "ViewController.h"
#import "IGTextViewCell.h"
#import "Masonry.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *myTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"cell自适应textView高度";
    self.view.backgroundColor = [UIColor grayColor];
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _myTableView.backgroundColor = [UIColor whiteColor];
        _myTableView.showsVerticalScrollIndicator = NO;
        _myTableView.showsHorizontalScrollIndicator=NO;
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
        _myTableView.estimatedRowHeight = 80;
        _myTableView.rowHeight = UITableViewAutomaticDimension;
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _myTableView.tableFooterView = [UIView new];
        [_myTableView registerClass:[IGTextViewCell class] forCellReuseIdentifier:NSStringFromClass([IGTextViewCell class])];
        [self.view addSubview:_myTableView];
        [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  1;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    IGTextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([IGTextViewCell class]) forIndexPath:indexPath];
    cell.callbackTextViewChangeText = ^(NSString *text) {
        NSLog(@"%@",text);
    };
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return  0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

@end
