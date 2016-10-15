//
//  ViewController.m
//  同步请求
//
//  Created by 黄建国 on 2016/10/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self sync];
}

- (void)sync
{
    // 0.请求路径
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/login?username=520it&pwd=520it"];
    //    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/video"];
    
    // 1.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 2.发送请求
    // sendSynchronousRequest阻塞式的方法，等待服务器返回数据
    
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    // 3.解析服务器返回的数据（解析成字符串）
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@ %@", string, response.allHeaderFields);
}

@end
