//
//  PCHFibonacciOperation.h
//  Cirqle
//
//  Created by Ilya Puchka on 10.08.14.
//  Copyright (c) 2014 Ilya Puchka. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^PCHFibonacciOperationCompletion)(NSInteger index, unsigned long long fib, bool is_prime);

// /Операция вычисления числа Фибоначчи по индексу и определения простое ли оно
@interface PCHFibonacciOperation : NSOperation

- (instancetype)initWithIndex:(NSInteger)index
                   completion:(PCHFibonacciOperationCompletion)completion;

- (NSInteger)index;

@end
