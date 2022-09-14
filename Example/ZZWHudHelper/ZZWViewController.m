//
//  ZZWViewController.m
//  ZZWHudHelper
//
//  Created by a595429717@163.com on 09/14/2022.
//  Copyright (c) 2022 a595429717@163.com. All rights reserved.
//

#import "ZZWViewController.h"
#import "ZZWHudHelper.h"
@interface ZZWViewController ()

@end

@implementation ZZWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[ZZWHudHelper shareInstance] showOnlyText:@"hud测试"];
}
@end
