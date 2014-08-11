//
//  CirqleTests.m
//  CirqleTests
//
//  Created by Ilya Puchka on 10.08.14.
//  Copyright (c) 2014 Ilya Puchka. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PCHFibonacci.h"

@interface CirqleTests : XCTestCase

@end

@implementation CirqleTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFibonacciMaxCount
{
    NSLog(@"%i", fib_count());
    XCTAssert(fib(fib_count()) < LONG_MAX, @"last number should be less than long_max");
    XCTAssert(fib(fib_count() + 1) > LONG_MAX, @"next number should be less than long_max");
}

- (void)testFibonacchiNumbers
{
    int count = fib_count();
    for (int i = 3; i < count; i++) {
        long result = fib(i);
        long a = fib(i-1);
        long b = fib(i-2);
        long sum = a + b;
        NSLog(@"(%i) %li + %li = %li", i, a, b, result);
        XCTAssertTrue(sum == result, @"a + b = result");
    }
}
@end
