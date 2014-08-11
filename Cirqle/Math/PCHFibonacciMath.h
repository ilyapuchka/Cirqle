//
//  PCHFibonacciMath.h
//  Cirqle
//
//  Created by Ilya Puchka on 10.08.14.
//  Copyright (c) 2014 Ilya Puchka. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UPPER_LIMIT LLONG_MAX

unsigned int fib_count();
unsigned long long fib(unsigned n);
bool is_prime(unsigned long long fib);
