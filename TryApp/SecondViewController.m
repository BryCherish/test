//
//  SecondViewController.m
//  TryApp
//
//  Created by ByteDance on 2022/3/31.
//

#import "SecondViewController.h"

@interface SecondViewController ()
{
    UITextField *_text;
}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(120, 160, 200, 30)];
    button.backgroundColor=[UIColor orangeColor];
    [button setTitle:@"🔙 把值传到上一页" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _text = [[UITextField alloc]initWithFrame:CGRectMake(120, 200, 200, 30)];
    _text.borderStyle = UITextBorderStyleRoundedRect;
    _text.delegate = self;
    _text.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:_text];
}

- (void)clickButton
{
    //1⃣️
   // _myBlock(_text.text); //2.调用block，参数是已知的得到值
    
    //2⃣️
    //3.调用函数。 让代理去执行这个方法 取得要传的值
   // [self.delegate input:_text.text];
    
    //3⃣️
    NSNotification *noi = [NSNotification notificationWithName:@"send" object:self userInfo:@{@"input":_text.text}];   //请假的老师 发布的消息
    
    //通知中心去发布通知。  班主任告诉学生们
    [[NSNotificationCenter defaultCenter] postNotification:noi];
    
    
    [self.navigationController popViewControllerAnimated:YES]; //回到上一界面
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
