//
//  PCHFibonacciOperationQueue.h
//  Cirqle
//
//  Created by Ilya Puchka on 11.08.14.
//  Copyright (c) 2014 Ilya Puchka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCHFibonacciOperation.h"

@interface PCHFibonacciOperationQueue : NSOperationQueue

- (PCHFibonacciOperation *)enqueOperationForIndex:(NSInteger)index
                                       completion:(PCHFibonacciOperationCompletion)completion;

@end
