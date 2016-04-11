//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by John Gallagher on 1/9/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController

- (void)loadView
{
//    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];

}

@end
