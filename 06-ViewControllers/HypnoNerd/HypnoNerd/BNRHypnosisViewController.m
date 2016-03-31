//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by John Gallagher on 1/6/14.
//  Copyright (c) 2014 John Gallagher. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController
{

    BNRHypnosisView *backgroundView ;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        // Set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";

        // Create a UIImage from a file
        // This will use Hypno@2x on retina display devices
        UIImage *image = [UIImage imageNamed:@"Hypno.png"];

        // Put that image on the tab bar item
        self.tabBarItem.image = image;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",nil];
    
    UISegmentedControl *segCtrl = [[UISegmentedControl alloc] initWithItems:segmentedArray];
    segCtrl.frame = CGRectMake(80, 40, self.view.bounds.size.width-80*2, 40);
    segCtrl.userInteractionEnabled = YES;
    [segCtrl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged ];
    [self.view addSubview: segCtrl];

}

- (void)loadView
{
    // Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
   backgroundView = [[BNRHypnosisView alloc] initWithFrame:frame];

        // Set it as *the* view of this view controller
    self.view = backgroundView;
}

- (void)segmentAction: (UISegmentedControl *)segCtrl{

     NSInteger Index = segCtrl.selectedSegmentIndex;
    switch (Index) {
        case 0:
            backgroundView.circleColor =[UIColor redColor];
            break;
        case 1:
            backgroundView.circleColor =[UIColor yellowColor];
            break;
        case 2:
            backgroundView.circleColor =[UIColor blueColor];
            break;
            
        default:
            break;
    }

}

@end
