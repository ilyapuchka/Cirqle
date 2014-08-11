//
//  PCHFibonacciCellModel.h
//  Cirqle
//
//  Created by Ilya Puchka on 10.08.14.
//  Copyright (c) 2014 Ilya Puchka. All rights reserved.
//

#import <UIKit/UIKit.h>

///Модель представления ячейки с числами Фибоначчи
@interface PCHFibonacciCellModel : NSObject

- (instancetype)initWithNumber:(unsigned long long)fib isPrime:(BOOL)isPrime;

///Число фибоначчи в виде строки
- (NSString *)labelText;

///Цвет текста в ячейке
- (UIColor *)labelTextColor;

///Фоновая картинка в ячейке
- (UIImage *)backgroundImage;

@end
