//
//  ViewController.m
//  单组tableview
//
//  Created by Jon_Snow on 1/27/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"
#import "LOLHeros.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView* tableView;
@property (strong, nonatomic) NSArray* heros;

@end

@implementation ViewController

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain]; // 必须指定style，也就是只能用这个方法初始化
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 110; // 用于所有的row都一样高的场景
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}

- (NSArray *)heros
{
    if (_heros == nil) {
        _heros = [LOLHeros herosList];
    }
    return _heros;
}

#pragma mark - dataSource代理方法
// 每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}

/**
 UITableViewCellStyleDefault,   默认类型 标题+可选图像
 UITableViewCellStyleValue1,    标题+明细+图像
 UITableViewCellStyleValue2,    不显示图像，标题+明细
 UITableViewCellStyleSubtitle   标题+明细+图像
 */
// 单元细节
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     下面这样做导致程序的性能很差。因为当屏幕划出当前的cell时，当前的cell会被释放掉，而当屏幕划回去时，系统会再次创建一个cell。
     现在使用缓存池的概念将同类型的cell进行复原，即当屏幕划出某个cell时不释放它，而是将其扔进缓存池中，当在需要该类型的cell时，直接去缓存池中找
     */
    //cell的复用标识，不同类型的cell可以定义不同的标识
    static NSString* ID = @"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 创建cell，并设置cell的功用属性
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        NSLog(@"cell实例化:%p",cell);
        // 共同属性,右侧箭头
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        // 背景颜色，会影响到未选中表格行的标签背景
//        cell.backgroundColor = [UIColor grayColor];
        // 在实际开发中，使用背景视图的情况比较多
        // 背景视图，不需要指定大小，cell会根据自身的尺寸，自动填充调整背景视图的显示
//        UIImage* bgImage = [UIImage imageNamed:@"img_01"];
//        cell.backgroundView = [[UIImageView alloc] initWithImage:bgImage];
        //        UIView *bgView = [[UIView alloc] init];
        //        bgView.backgroundColor = [UIColor yellowColor];
        //        cell.backgroundView = bgView;
        // 没有选中的背景颜色
        // 选中的背景视图
//        UIImage* selectedBGImage = [UIImage imageNamed:@"img_02"];
//        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:selectedBGImage];
    }
//    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    LOLHeros* hero = self.heros[indexPath.row];
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    // 设置右边的箭头
    // 1> UITableViewCellAccessoryDisclosureIndicator 箭头，可以"提示"用户，当前行是可以点击的，通常选中行，会跳到新的页面
    // 2> UITableViewCellAccessoryCheckmark 对号，通常提示用户该行数据设置完毕，使用的比较少
    // 3> UITableViewCellAccessoryDetailButton 按钮，通常点击按钮可以做独立的操作，例如alertView
    //    点击按钮并不会选中行
    // 4> UITableViewCellAccessoryDetailDisclosureButton 按钮+箭头，各自操作
//    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

    // 自定义右侧按钮
    /**
     只有accessoryType不能满足需求的情况下才用自定义的控件。但自定义的控件要自己添加监听方法。
     通常用在自定义cell，不要写在视图控制器中！！！
     自定义控件的事件触发，同样不会影响表格行的选中！
     */
//    UISwitch* swicher = [[UISwitch alloc] init];
//    [swicher addTarget:self action:@selector(swicherChanged) forControlEvents:UIControlEventValueChanged];
//    cell.accessoryView = swicher;
    return cell;
}

- (void)swicherChanged
{
    NSLog(@"%s", __func__);
}
/**
 代理方法的优先级比rowHeight优先级高

 应用场景：很多应用程序，每一行的高度是不一样的，例如：新浪微博

 表格工作观察的小结

 1> 要知道总共有多少数据
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

 2> 计算“每一行”的行高
 - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

 问题：在此方法执行时，cell被实例化了吗？
 方法的作用是什么？

 scrollView需要指定contentSize才能够滚动，如果没有实现方法，行高默认是44

 需要知道每一行的高度，才能够准确的计算出contentSize

 知道每一行的高度后，自然知道每一个屏幕应该显示多少行，表格明细方法的执行次数就知道了

 3> 表格明细
 调用屏幕显示所需要的行数，懒加载，只有要显示的表格行，才会被实例化！

 小的结论：

 *  tableView.rowHeight：    效率高，适用于所有的表格行高度一致
 *  代理方法指定行高：          效率差，适合于每一个行的行高不一样，能够让表格更加的灵活

 */

// 代理方法，设置行高
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return (indexPath.row % 2) ? 44 : 80;
//}

#pragma mark - 代理方法
// 取消选中某一行，极少用，极容易出错！
// didDeselectRowAtIndexPath
// didSelectRowAtIndexPath
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s--%@",__func__, indexPath);
}

// 选中某一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s--%@",__func__,indexPath);
}

// accessoryType为按钮时，点击右侧按钮的监听方法
// 此方法不会触发行选中，跟行选中各自独立
// 只是为accessoryType服务，对自定义控件不响应
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s %@", __func__, indexPath);
}




- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
    // headView，放在tableView最顶部的视图，通常用来放图片轮播器,x,y值不影响该视图的位置
    UIImageView* headView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 75)];
    headView.image = [UIImage imageNamed:@"img_01"];
    self.tableView.tableHeaderView = headView;
    // footerView，通常做上拉刷新
    UIImageView* footView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 75)];
    footView.image = [UIImage imageNamed:@"img_02"];
    self.tableView.tableFooterView = footView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
