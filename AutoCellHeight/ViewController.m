//
//  ViewController.m
//  AutoCellHeight
//
//  Created by fanxiaobin on 2017/3/17.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import "ViewController.h"
#import "AutoModel.h"
#import "AutoCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,copy) NSMutableArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _dataArr = [NSMutableArray array];
    
    for (int i = 0; i < 30; i++) {
        AutoModel *model = [[AutoModel alloc] init];
        model.title = [NSString stringWithFormat:@"标题-%02d",i];
        if (i % 2 == 0) {
            model.desTitle = @"发卡上的房间卡克里斯可";
        }else{
            model.desTitle = @"离开房间爱流口水的家乐福发神经的房间按时到立刻就发啦开始点击富利卡大街上离开房间爱上;了发卡发神经的浪费就拉屎的上的房间卡克里斯可离开房间爱流口水的家乐福发神经的房间按时到立刻就发啦开始点击富利卡大街上离开房间爱上;了发卡发神经的浪费就拉屎的上的房间卡克里斯可";
        }
        model.time = @"2017-03-17";
        
        [self.dataArr addObject:model];
    }
    
    [self.view addSubview:self.tableView];
    
    
}


-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.estimatedRowHeight = 44.0;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        [_tableView registerClass:[AutoCell class] forCellReuseIdentifier:@"AutoCell"];
    }
    
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AutoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AutoCell"];
    AutoModel *model = self.dataArr[indexPath.row];
    cell.model = model;
    
    return cell;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    AutoModel *model = self.dataArr[indexPath.row];
//    NSLog(@"-- m h = %.2f",model.cellHeight);
//    return model.cellHeight;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
