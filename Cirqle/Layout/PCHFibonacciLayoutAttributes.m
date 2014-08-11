//
//  PCHFibonacciLayoutAttributes.m
//  Cirqle
//
//  Created by Ilya Puchka on 10.08.14.
//  Copyright (c) 2014 Ilya Puchka. All rights reserved.
//

#import "PCHFibonacciLayoutAttributes.h"

@implementation PCHFibonacciLayoutAttributes

- (id)init
{
    self = [super init];
    if (self) {
        self.textAlpha = 1.0f;
    }
    return self;
}

- (BOOL)isEqual:(id)object
{
    if (object == self) {
        return YES;
    }
    if (!object || ![[object class] isEqual:[self class]]) {
        return NO;
    }
    if ([(PCHFibonacciLayoutAttributes *)object textAlpha] != [self textAlpha]) {
        return NO;
    }
    
    return [super isEqual:object];
}

- (id)copyWithZone:(NSZone *)zone
{
    PCHFibonacciLayoutAttributes *copy = [super copyWithZone:zone];
    if (copy) {
        copy.textAlpha = _textAlpha;
    }
    return copy;
}

@end
