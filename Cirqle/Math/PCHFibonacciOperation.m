//
//  PCHFibonacciOperation.m
//  Cirqle
//
//  Created by Ilya Puchka on 10.08.14.
//  Copyright (c) 2014 Ilya Puchka. All rights reserved.
//

#import "PCHFibonacciOperation.h"
#import "PCHFibonacciMath.h"

@interface PCHFibonacciOperation ()

@property (nonatomic) NSInteger index;
@property (nonatomic, strong) void (^block)(NSInteger, unsigned long long, bool);

@property (nonatomic) BOOL isExecuting;
@property (nonatomic) BOOL isFinished;

@end

@implementation PCHFibonacciOperation

- (instancetype)initWithIndex:(NSInteger)index completion:(PCHFibonacciOperationCompletion)completion
{
    self = [super init];
    if (self) {
        self.index = index;
        self.block = completion;
    }
    return self;
}

- (void)start
{
    [self willChangeValueForKey:@"isExecuting"];
    self.isExecuting = YES;
    [self didChangeValueForKey:@"isExecuting"];

    unsigned long long _fib = fib((unsigned)self.index);
    bool _is_prime = is_prime(_fib);
    dispatch_async(dispatch_get_main_queue(), ^{
        self.block(self.index, _fib, _is_prime);
    });
    
    [self willChangeValueForKey:@"isFinished"];
    [self willChangeValueForKey:@"isExecuting"];
    _isExecuting = NO;
    _isFinished = YES;
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}

@end
