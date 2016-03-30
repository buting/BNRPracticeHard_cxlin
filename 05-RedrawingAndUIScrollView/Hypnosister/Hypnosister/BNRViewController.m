//
//  BNRViewController.m
//  Hypnosister
//
//  Created by buTing on 16/3/26.
//  Copyright © 2016年 John Gallagher. All rights reserved.
//

#import "BNRHypnosisView.h"
#import "BNRViewController.h"

@interface BNRViewController ()

@end

@implementation BNRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect screenRect = [[UIApplication sharedApplication].windows lastObject].bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
    
    // Create a screen-sized scroll view and add it to the window
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    
    // Create a screen-sized hypnosis view and add it to the scroll view
    BNRHypnosisView *hypnosisView = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:hypnosisView];
    
    // Add a second screen-sized hypnosis view just off screen to the right
    screenRect.origin.x = screenRect.size.width;
    BNRHypnosisView *anotherView = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:anotherView];
    
    // Tell the scroll view how big its content area is
    scrollView.contentSize = bigRect.size;
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
