//
//  PCHFibonacciMath.m
//  Cirqle
//
//  Created by Ilya Puchka on 10.08.14.
//  Copyright (c) 2014 Ilya Puchka. All rights reserved.
//

#import "PCHFibonacciMath.h"
#import <libkern/OSAtomic.h>

#define PHI ((1 + sqrt(5))/2)

unsigned int fib_count() {
    return log(UPPER_LIMIT * sqrt(5) + 0.5)/log(PHI);
}

unsigned long long fib(unsigned n) {
    if (n < 72) {
        unsigned long long fn = floor((pow(PHI, n) - pow(1 - PHI, n))/sqrt(5));
        return fn;
    }
    else {
        //на 72-ом числе происходит overflow, поэтому дальше считаем вручную
        unsigned long long fn = 0;
        unsigned long long a = fib(70);
        unsigned long long b = fib(71);
        for (int i = 72; i <= n; i++) {
            fn = a + b;
            a = b;
            b = fn;
        }
        return fn;
    }
}

bool internal_is_prime(unsigned long long fib)
{
    bool is_prime = true;
    
    if (fib <= 1) is_prime = false;
    else if (fib == 2) is_prime = true;
    else if (fib % 2 == 0) is_prime = false;
    else {
        double sqrtN = sqrt(fib);
        for (unsigned long long i = 3; (i <= sqrtN) && is_prime; i+=2) {
            is_prime = (fib % i != 0);
        }
    }
    return is_prime;
}

OSSpinLock _lock;

static NSArray *primes;
static NSArray *not_primes;

bool checkIfInPrimesCache(unsigned long long fib) {
    //так как чисел на самом деле не много, а простых из них не больше 10, их можно было бы все сохранить заранее в кэше
    if (!primes) primes = @[/*@(99194853094755497)*/];

    OSSpinLockLock(&_lock);
    BOOL check = [primes containsObject:@(fib)];
    OSSpinLockUnlock(&_lock);
    
    return check;
}

bool checkIfInNotPrimesCache(unsigned long long fib) {
    if (!not_primes) not_primes = [@[] mutableCopy];
    
    OSSpinLockLock(&_lock);
    BOOL check = [not_primes containsObject:@(fib)];
    OSSpinLockUnlock(&_lock);
    
    return check;
}

void updatePrimesCache(unsigned long long fib, bool is_prime) {
    
    NSMutableArray *array = [is_prime? primes: not_primes mutableCopy];
    [array addObject:@(fib)];
    
    OSSpinLockLock(&_lock);
    is_prime? (primes = [array copy]): (not_primes = [array copy]);
    OSSpinLockUnlock(&_lock);
}

bool is_prime(unsigned long long fib)
{
    if (checkIfInPrimesCache(fib)) return true;
    if (checkIfInNotPrimesCache(fib)) return false;
    
    bool prime = internal_is_prime(fib);
    updatePrimesCache(fib, prime);
    return prime;
}
