//
//  ViewController.m
//  MRCTest
//
//  Created by fan qi on 2019/3/30.
//  Copyright © 2019 fan qi. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

void(^block)(void);

@interface ViewController ()

@property (nonatomic, retain) NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"click me" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(20, 100, 70, 30);
    btn.layer.borderColor = [UIColor blackColor].CGColor;
    btn.layer.borderWidth = 1.0;
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn release];
    
    {
//        Person *p0 = [Person alloc];
//        Person *p = [p0 init];
//        NSLog(@"---> %ld", [p retainCount]);
//
//        [p release];
//        NSLog(@"---> %ld", [p retainCount]);
    }
    
    {
//        // 测试 类方法 和 init 方法在出了作用域后的 [_array retainCount]
//        // 类方法初始化会在方法返回前调用 autorelease
//        _array = [NSArray arrayWithObjects:@"a", nil];
//        NSLog(@"---> %ld", [_array retainCount]);
//
//        _array = [[NSArray alloc] initWithObjects:@"a", nil];
//        NSLog(@"---> %ld", [_array retainCount]);
    }
    
    {
//        NSArray *array = [NSArray arrayWithObjects:@"a", nil]; // [NSArray array]的情况和这个非空的不同 retainCount=-1
//        [array release];
//        NSLog(@"---> %ld", [array retainCount]);
//
//        NSArray *arrayI = [array copy];
//        NSLog(@"---> %p, %p", array, arrayI); // 地址相同
//        NSLog(@"---> %ld, %ld", [array retainCount], [arrayI retainCount]); // 2, 2
        
//        NSArray *arrayM = [array mutableCopy];
//        NSLog(@"---> %p, %p", array, arrayM); // 地址不同
//        NSLog(@"---> %ld, %ld", [array retainCount], [arrayM retainCount]); // 1, 1
    }
    
    {
        testBlock();
//        [self testBlock2];
        
        block();
    }
}

- (void)btnClicked {
    NSLog(@"---> %ld", [_array retainCount]);
}

// 为什么这个消息转发和 testBlock() 的case1 打印结果不同呢？？后续来研究下
- (void)testBlock2 {
    int a = 20;
    // case 1:
    block = ^{
        NSLog(@"-----> %d", a);
    };
}

void testBlock() {
    int a = 20;
    // case 1:
//    NSString *str = @"abc"; // 有意思，定义个对象变量后，即使block内没捕获它，仍能正确打印a = 20，为什么？？
    block = ^{
        NSLog(@"----->a = %d", a);
    };
    
    // case 2:
//    block = [^{
//        NSLog(@"-----> %d", a);
//    } copy];
}

@end
