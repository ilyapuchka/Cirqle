//
//  PCHFibonacciCellModel.m
//  Cirqle
//
//  Created by Ilya Puchka on 10.08.14.
//  Copyright (c) 2014 Ilya Puchka. All rights reserved.
//

#import "PCHFibonacciCellModel.h"

@interface PCHFibonacciCellModel()

@property (nonatomic) unsigned long long fib;
@property (nonatomic) BOOL isPrime;

@end

@implementation PCHFibonacciCellModel

- (instancetype)initWithNumber:(unsigned long long)fib isPrime:(BOOL)isPrime
{
    self = [super init];
    if (self) {
        self.fib = fib;
        self.isPrime = isPrime;
    }
    return self;
}

- (NSString *)labelText
{
    return [NSString stringWithFormat:@"%@", @(self.fib)];
}

- (UIColor *)labelTextColor
{
    return self.isPrime?[UIColor whiteColor]: [UIColor colorWithRed:22.0f/255.0f green:23.0f/255.0f blue:23.0f/255.0f alpha:1.0f];
}

- (UIImage *)backgroundImage
{
    return self.isPrime? [UIImage imageNamed:@"light_cell_bg"]: [UIImage imageNamed: @"dark_cell_bg"];
}

@end
