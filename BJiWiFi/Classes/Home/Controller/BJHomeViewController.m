//
//  BJHomeViewController.m
//  BJiWiFi
//
//  Created by kuangbing on 16/2/21.
//  Copyright © 2016年 KuangBing. All rights reserved.
//

#import "BJHomeViewController.h"
#import "BJHomeCellTool.h"
#import "BJHomeResultModel.h"
#import "BJHomeItmesModel.h"
#import "BJHomeBottomView.h"

@interface BJHomeViewController ()

@property(nonatomic, strong) NSMutableArray *arrayModel;

@property(nonatomic, assign) NSInteger file;

//@property(nonatomic, strong) UIView *bottomView;

@end

@implementation BJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化成员属性
    self.file = 1;
    
    self.arrayModel = [NSMutableArray array];
    
    // 设置导航条
    [self setNavBarView];
    
    // 加载数据
    [self setUpDate];
    
    [self bottomView];
    
    // 下拉加载
    [self footerRefresh];
    
}

#pragma mark ********** 下拉加载
-(void)footerRefresh{
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        NSString *fileName = [NSString stringWithFormat:@"iwifi00%zd",++self.file];
        [self.arrayModel addObjectsFromArray:[self keyValuesToObject:[self resultFileData:fileName]]];
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        if (self.file == 7) {
            self.tableView.mj_footer.hidden = YES;
        }
    }];
    
}

#pragma mark ********** 加载数据
-(void)setUpDate{
    NSString *fileName = [NSString stringWithFormat:@"iwifi00%zd",self.file];
    
    [self.arrayModel addObjectsFromArray:[self keyValuesToObject:[self resultFileData:fileName]]];
    
    [self.tableView reloadData];
}


#pragma mark ********** 数据转换
-(NSArray *)keyValuesToObject:(id)result{
    
    [BJHomeResultModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"resultJson":[BJHomeItmesModel class]};
    }];
    
    [BJHomeItmesModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID":@"id"};
    }];
    
    BJHomeResultModel *resultModel = [BJHomeResultModel mj_objectWithKeyValues:result];
    return resultModel.resultJson;
}


#pragma mark - ******** TableView 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else{
        return self.arrayModel.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BJHomeItmesModel *itemsModel = [self.arrayModel objectAtIndex:indexPath.row];
    
    return [BJHomeCellTool HomeCellWithTableView:tableView IndexPath:indexPath ItemsModel:itemsModel];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [BJHomeCellTool cellHeight:tableView IndexPath:indexPath];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return [BJHomeCellTool headerWithTableView:tableView Section:section];
    }else{
        return [[UIView alloc] init];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 120;
    }else{
        return 0;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc] init];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 40;
    }
}


#pragma mark - ******** 设置导航条的View
-(void)setNavBarView{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UIView *leftBarButton = [self navigationLeftBarButtonItem];
    leftBarButton.frame = CGRectMake(16.f, 20.f,leftBarButton.frame.size.width, leftBarButton.frame.size.height);
    UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithCustomView:leftBarButton];
    self.navigationItem.leftBarButtonItem = leftBarBtn;
    
    UIView *rightView = [[UIView alloc]init];
    rightView.frame = CGRectMake(screenWidth - 55.f,25.f, 60.f, 25.f);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    
    UIButton *rightBarButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 25.f, 25.f)];
    [rightBarButton setImage:[UIImage imageNamed:@"shape1"] forState:UIControlStateNormal];
    [rightView addSubview:rightBarButton];
    
    UIButton *rightBarButtonR = [[UIButton alloc] initWithFrame:CGRectMake(30,0, 25.f, 25.f)];
    [rightBarButtonR setImage:[UIImage imageNamed:@"nav_friend"] forState:UIControlStateNormal];
    [rightView addSubview:rightBarButtonR];
}

#pragma mark 导航条左边的View
-(UIView *)navigationLeftBarButtonItem{
    UIView *bv = [[UIView alloc] init];
    bv.frame = CGRectMake(0, 4, 120, 30);
    
    UIImageView *uesrIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tou_03"]];
    uesrIcon.frame = CGRectMake(-13, 0, 27, 27);
    [bv addSubview:uesrIcon];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(2, 0, 60, 30);
    label.font = [UIFont systemFontOfSize:17];
    label.text = @"广州";
    label.textAlignment = UIBaselineAdjustmentAlignCenters;
    label.textColor = [UIColor whiteColor];
    [bv addSubview:label];
    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dwjiantou"]];
    img.frame = CGRectMake(52, 12, 12, 6);
    [bv addSubview:img];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 110, 30);
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [bv addSubview:backButton];
    
    return bv;
}

#pragma mark 左上角的按钮
-(void)backButtonClick:(UIButton *)btn{
    BJLog(@"backButtonClick-------");
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    [UIView animateWithDuration:0.5 animations:^{
        if (CGAffineTransformIsIdentity(self.navigationController.view.transform)) {
            CGAffineTransform form =  CGAffineTransformMakeScale(0.8, 0.8);
            self.navigationController.view.transform = CGAffineTransformTranslate(form, screenWidth - 95, 0);
        }else{
            self.navigationController.view.transform = CGAffineTransformIdentity;
        }
    }];
    
}

#pragma mark 根据文件名称获取数据
-(id)resultFileData:(NSString *)fileName{
    // 读取Json
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    
    // JsonObject
    NSError *error;
    id JsonObject = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path]
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];
    return JsonObject;
}

-(void)bottomView{
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    UIView *bg = [[UIView alloc] init];
    bg.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 40, [UIScreen mainScreen].bounds.size.width, 40);
    bg.backgroundColor = [UIColor blackColor];
    bg.alpha = 0.6;
    [window addSubview:bg];
    BJHomeBottomView *bottomView = [BJHomeBottomView myHomeBottomView];
    [window addSubview:bottomView];
    bottomView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 40, [UIScreen mainScreen].bounds.size.width, 40);
    //view.backgroundColor = kRandomColor;
}


@end
