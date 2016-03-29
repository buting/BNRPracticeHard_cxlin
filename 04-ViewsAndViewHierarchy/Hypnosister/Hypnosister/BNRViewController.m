//
//  BNRViewController.m
//  Hypnosister
//
//  Created by buTing on 16/3/26.
//  Copyright © 2016年 John Gallagher. All rights reserved.
//

#import "BNRViewController.h"
#import "BNRHypnosisView.h"
@interface BNRViewController ()

@end

@implementation BNRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect frame = [[UIApplication sharedApplication].windows lastObject].bounds;
//    NSLog(@"%f %f",frame.size.width,frame.size.height);
    
    BNRHypnosisView *firstView = [[BNRHypnosisView alloc] initWithFrame:frame];
    [self.view addSubview: firstView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
