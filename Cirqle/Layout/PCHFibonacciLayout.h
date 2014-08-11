//
//  PCHFibonacciLayout.h
//  Cirqle
//
//  Created by Ilya Puchka on 10.08.14.
//  Copyright (c) 2014 Ilya Puchka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCHFibonacciLayout : UICollectionViewFlowLayout

///обработчик скроллинга (коррекция при скролле в пределах ячейки-хэдера)
- (void)handleEndDragging:(BOOL)decelerate;

@end
