//
//  main.m
//  RandomItems
//
//  Created by John Gallagher on 1/12/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {

        // Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
        NSMutableArray *items2 = [[NSMutableArray alloc] init];

        for (int i = 0; i < 10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
            [items2 addObject:item];
        }

        BNRContainer *ctner0=[BNRContainer container];
        ctner0.itemName=@"testCTN0";
        ctner0.subitems=items2;

        BNRContainer *ctner1=[BNRContainer container];
        [items addObject:ctner0];
        ctner1.subitems=items;
        ctner1.itemName=@"testCTN1";
        NSLog(@"%@",ctner1);
        // Destroy the mutable array object
        items = nil;

    }
    return 0;
}

