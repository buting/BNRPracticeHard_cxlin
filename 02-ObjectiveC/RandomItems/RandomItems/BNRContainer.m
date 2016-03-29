//
//  BNRContainer.m
//  RandomItems
//
//  Created by buTing on 16/3/20.
//  Copyright © 2016年 Big Nerd Ranch. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer


+ (instancetype)container{
    BNRContainer *container=[[self alloc] initWithContainerName:@"" SubItems:nil valueTotal:0];
    return container;
}

-(instancetype)initWithContainerName:(NSString *)name SubItems:(NSMutableArray *)itmes valueTotal: (int)valueTotal{
    self= [self initWithItemName:name valueInDollars:0  serialNumber:@""];
    _valueTotal = valueTotal;
    _subitems = itmes;
    _valueTotal = 0;
    return self;
}

- (int)valueTotal{

    return _valueTotal;
}

- (void)setSubitems:(NSMutableArray *)subitems;
{
    _subitems=subitems;
    for (BNRItem *item in _subitems) {
        if ([item isKindOfClass:[BNRContainer class]]) {
            NSLog(@" setSubitems isContainerClass");
            BNRContainer * subContainer=(BNRContainer *)item;
            for (BNRItem *item in subContainer.subitems) {
                _valueTotal = _valueTotal+item.valueInDollars;
            }
        }
        _valueTotal=_valueTotal+item.valueInDollars;
    }
}

- (NSMutableArray *)subitems
{
    return _subitems;
}

-(NSString *)description{
    NSString *descripString=[NSString new];
//    descripString=[NSString stringWithFormat:@"(container) -> %@'s items totoal value is (%d)  BNRItems are [ %@ ];",_itemName ,self.valueTotal, _subitems];
    NSLog(@"test%d",self.valueTotal);

    descripString=[NSString stringWithFormat:@"(container) -> * %@ * : items totoal value is * %d *  BNRItems are : %@ ;",self.itemName ,self.valueTotal, self.subitems];//使用_valueTotal访问不到。
    return descripString;
}

@end
