//
//  PCHFibonacciCell+Math.m
//  Cirqle
//
//  Created by Ilya Puchka on 10.08.14.
//  Copyright (c) 2014 Ilya Puchka. All rights reserved.
//

#import "PCHFibonacciCell+Math.h"
#import "PCHFibonacciOperation.h"
#import <objc/runtime.h>

@implementation PCHFibonacciCell(Math)

- (PCHFibonacciOperation *)pch_operation {
    return (PCHFibonacciOperation *)objc_getAssociatedObject(self, @selector(pch_operation));
}

- (void)pch_setOperation:(PCHFibonacciOperation *)imageRequestOperation {
    objc_setAssociatedObject(self, @selector(pch_operation), imageRequestOperation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
