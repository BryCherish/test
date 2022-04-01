//
//  SecondViewController.h
//  TryApp
//
//  Created by ByteDance on 2022/3/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//1.声明代理
@protocol twoDelegate <NSObject>

- (void)input:(NSString *)text;

@end

@interface SecondViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic,copy)void (^myBlock)(NSString *);//1.声明block

//2.生成一个成员变量。便于访问设置
@property (nonatomic,weak) id<twoDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
