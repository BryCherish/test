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
    [button setTitle:@"ð æå¼ä¼ å°ä¸ä¸é¡µ" forState:UIControlStateNormal];
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
    //1â£ï¸
   // _myBlock(_text.text); //2.è°ç¨blockï¼åæ°æ¯å·²ç¥çå¾å°å¼
    
    //2â£ï¸
    //3.è°ç¨å½æ°ã è®©ä»£çå»æ§è¡è¿ä¸ªæ¹æ³ åå¾è¦ä¼ çå¼
   // [self.delegate input:_text.text];
    
    //3â£ï¸
    NSNotification *noi = [NSNotification notificationWithName:@"send" object:self userInfo:@{@"input":_text.text}];   //è¯·åçèå¸ åå¸çæ¶æ¯
    
    //éç¥ä¸­å¿å»åå¸éç¥ã  ç­ä¸»ä»»åè¯å­¦çä»¬
    [[NSNotificationCenter defaultCenter] postNotification:noi];
    
    
    [self.navigationController popViewControllerAnimated:YES]; //åå°ä¸ä¸çé¢
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
