//
//  ViewController.m
//  tableViewDemo
//
//  Created by taobaichi on 16/8/12.
//  Copyright © 2016年 taobaichi. All rights reserved.
//

#import "ViewController.h"

/// 屏幕宽度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
/// 屏幕高度
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]






#import "TableViewCell1.h"
#import "TableViewCell2.h"
#import "TableViewCell3.h"
#import "TableViewCell4.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    int currentCellTag;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)NSArray *dataArray;
@end

@implementation ViewController

-(NSArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [[NSArray alloc] init];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1"];
    
    currentCellTag = 0;
    
    
    
  
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell1" bundle:nil] forCellReuseIdentifier:@"cell1"];
        [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell2" bundle:nil]  forCellReuseIdentifier:@"cell2"];
        [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell3" bundle:nil]  forCellReuseIdentifier:@"cell3"];
        [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell4" bundle:nil]  forCellReuseIdentifier:@"cell4"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark ----tableView的代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.dataArray.count;
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 45)];
    view.backgroundColor = [UIColor redColor];
    
    NSArray *array = @[@"基本信息",@"拜访计划",@"信息录入",@"进度管理"];
    
    for (int i= 0; i<array.count; i++) {
        [self setUpButtonWithTag:i AndTitle:array[i] toView:view];
    }

    
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}
-(void)setUpButtonWithTag:(int) tag AndTitle:(NSString *)title toView:(UIView *)view
{
    CGFloat width = kScreenWidth/4;
    CGFloat height = 45;
    
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(tag*width, 0, width, height)];
    button.tag = tag;
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:UIColorFromRGB(0x20c04f) forState:UIControlStateSelected];

    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    
    
    
}

-(void)buttonAction:(UIButton *)button
{
    switch (button.tag) {
        case 0:
            self.dataArray = @[@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1",@"基本信息1"];
            NSLog(@"0");
            break;
        case 1:
             self.dataArray = @[@"拜访计划1",@"拜访计划1",@"拜访计划1",@"拜访计划1",@"拜访计划1",@"拜访计划",@"拜访计划1"];
               NSLog(@"1");
            break;
        case 2:
            self.dataArray = @[@"信息录入1",@"信息录入1",@"信息录入1",@"信息录入1",@"信息录入1",@"信息录入1",@"信息录入1",@"信息录入1",@"信息录入1",@"信息录入1",@"信息录入1",@"信息录入1",@"信息录入1",@"信息录入1",@"信息录入1",@"信息录入1",@"信息录入1",@"信息录入1",@"信息录入1",@"信息录入1",@"信息录入1"];
               NSLog(@"2");
            break;
        case 3:
            self.dataArray = @[@"进度管理1",@"进度管理1",@"进度管理1",@"进度管理1",@"进度管理1",@"进度管理1",@"进度管理1",@"进度管理1",@"进度管理1",@"进度管理1"];
               NSLog(@"3");
            break;
        default:
            break;
    }
    currentCellTag = button.tag;
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    UITableViewCell * cell = nil;
    switch (currentCellTag) {
        case 0:
        {
            cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell1"];
            TableViewCell1 *newCell = (TableViewCell1 *)cell;
             newCell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
        }
            break;
        case 1:
        {
            cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell2"];
            TableViewCell2 *newCell = (TableViewCell2 *)cell;
            newCell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
        }
            break;
        case 2:
        {
            cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell3"];
            TableViewCell3 *newCell = (TableViewCell3 *)cell;
            newCell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
        }
            break;
        case 3:
        {
            cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell4"];
            TableViewCell4 *newCell = (TableViewCell4 *)cell;
            newCell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
        }
            break;
        default:
            break;
    }
    
    
    
    
   
 
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat height = 44;
    switch (currentCellTag) {
        case 0:
        {
            height= 80;
        }
            break;
        case 1:
        {
            height= 100;
        }
            break;
        case 2:
        {
            height= 44;
        }
            break;
        case 3:
        {
            height= 200;

        }
            break;
        default:
            break;
    }
    return height;
}



@end
