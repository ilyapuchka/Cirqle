//
//  PCHFibonacciOperationQueue.m
//  Cirqle
//
//  Created by Ilya Puchka on 11.08.14.
//  Copyright (c) 2014 Ilya Puchka. All rights reserved.
//

#import "PCHFibonacciOperationQueue.h"

@implementation PCHFibonacciOperationQueue

- (PCHFibonacciOperation *)enqueOperationForIndex:(NSInteger)index
                                       completion:(PCHFibonacciOperationCompletion)completion
{
    //если в очереди уже есть задача с таким же индексом, то новую не добавляем
    if (![[self.operations valueForKey:@"index"] containsObject:@(index)]) {
        PCHFibonacciOperation *op = [[PCHFibonacciOperation alloc] initWithIndex:index completion:^(NSInteger _index, unsigned long long fib, bool is_prime) {
//            NSLog(@"%li op finished", (long)index);
            completion(_index, fib, is_prime);
        }];
        
        [self addOperation:op];
//        NSLog(@"%@", [self.operations valueForKey:@"index"]);
        return op;
    }
    return nil;
}

@end
