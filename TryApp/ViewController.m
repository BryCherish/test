//
//  ViewController.m
//  TryApp
//
//  Created by ByteDance on 2022/3/31.
//

#import "ViewController.h"
#import "SecondViewController.h"
//5.声明代理 遵守协议
@interface ViewController () <twoDelegate>
{
    UILabel *_label;
}
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recvData:) name:@"send" object:nil];
}
//实现通知的方法 并且取值
- (void)recvData: (NSNotification *)noti
{
    NSDictionary *dict = noti.userInfo;
    _label.text = dict[@"input"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(120, 160, 100, 30)];
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"进入下一页" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(120, 300, 100, 30)];
    _label.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_label];
}

- (void)clickButton
{
    NSLog(@"clickButton");
    SecondViewController *vc = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    //2⃣️
    //5.设定代理 谁来实现
    vc.delegate=self;
    
    //1⃣️
    //3.回调，得到值
//    vc.myBlock = ^(NSString *text)
//    {
//        NSLog(@"---3--%@-",_label.text);
//        _label.text=text;
//    };
    NSLog(@"%@",vc.myBlock);
}

//6.实现代理方法。
- (void)input:(NSString *)text
{
    _label.text=text;
}
@end
