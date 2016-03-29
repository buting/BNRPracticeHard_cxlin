//
//  BNRContainer.h
//  RandomItems
//
//  Created by buTing on 16/3/20.
//  Copyright © 2016年 Big Nerd Ranch. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem{
    int                 _valueTotal;
    NSMutableArray      *_subitems;
}
+ (instancetype)container;
- (void)setSubitems:(NSMutableArray *)subitems;
- (NSMutableArray *)subitems;
- (int)valueTotal;
-(instancetype)initWithContainerName:(NSString *)name SubItems:(NSMutableArray *)itmes valueTotal: (int)valueTotal;
@end
