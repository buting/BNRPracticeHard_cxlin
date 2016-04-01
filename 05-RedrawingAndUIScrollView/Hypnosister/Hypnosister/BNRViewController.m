//
//  BNRViewController.m
//  Hypnosister
//
//  Created by buTing on 16/3/26.
//  Copyright © 2016年 John Gallagher. All rights reserved.
//

#import "BNRHypnosisView.h"
#import "BNRViewController.h"

@interface BNRViewController ()<UIScrollViewDelegate>
{
    BNRHypnosisView *hypnosisView;
}
@end

@implementation BNRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect screenRect = [[UIApplication sharedApplication].windows lastObject].bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 1.0;
    
    // Create a screen-sized scroll view and add it to the window
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    scrollView.pagingEnabled = NO;
    [self.view addSubview:scrollView];
    
    // Create a screen-sized hypnosis view and add it to the scroll view
    hypnosisView = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    scrollView.delegate = (id) self;
    [scrollView addSubview:hypnosisView];
    
    // Add a second screen-sized hypnosis view just off screen to the right
//    screenRect.origin.x = screenRect.size.width;
//    BNRHypnosisView *anotherView = [[BNRHypnosisView alloc] initWithFrame:screenRect];
//    [scrollView addSubview:anotherView];
    
    // Tell the scroll view how big its content area is
    scrollView.contentSize = bigRect.size;
    scrollView.maximumZoomScale=2.0;
    scrollView.minimumZoomScale=0.5; // 这个必须设置


}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return hypnosisView;
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
