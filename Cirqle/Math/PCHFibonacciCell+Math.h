//
//  PCHFibonacciCell+Math.h
//  Cirqle
//
//  Created by Ilya Puchka on 10.08.14.
//  Copyright (c) 2014 Ilya Puchka. All rights reserved.
//

#import "PCHFibonacciCell.h"
#import "PCHFibonacciOperation.h"

@interface PCHFibonacciCell (Math)

@property (readwrite, nonatomic, strong, setter = pch_setOperation:) PCHFibonacciOperation *pch_operation;

@end
