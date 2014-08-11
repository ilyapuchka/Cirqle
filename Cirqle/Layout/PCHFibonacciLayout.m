//
//  PCHFibonacciLayout.m
//  Cirqle
//
//  Created by Ilya Puchka on 10.08.14.
//  Copyright (c) 2014 Ilya Puchka. All rights reserved.
//

#import "PCHFibonacciLayout.h"
#import "PCHFibonacciLayoutAttributes.h"

@implementation PCHFibonacciLayout

- (UICollectionViewScrollDirection)scrollDirection
{
    return UICollectionViewScrollDirectionVertical;
}

+ (Class)layoutAttributesClass
{
    return [PCHFibonacciLayoutAttributes class];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *allAttrs = [super layoutAttributesForElementsInRect:rect];
    for (PCHFibonacciLayoutAttributes *attrs in allAttrs) {
        [self modifyCellAttributes:attrs];
    }
    return allAttrs;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PCHFibonacciLayoutAttributes *attrs = (PCHFibonacciLayoutAttributes *)[super layoutAttributesForItemAtIndexPath:indexPath];
    [self modifyCellAttributes:attrs];
    return attrs;
}

- (void)modifyCellAttributes:(PCHFibonacciLayoutAttributes *)attrs
{
    if (attrs.indexPath.section == 0 &&
        attrs.indexPath.item == 0) {
        [self attributesForStickyHeaderCell:attrs];
    }
    else {
        //если нижния край ячейки выходит за пределы текущих границ collection view,
        //то пересчитываем атрибуты
        if (CGRectGetMaxY(attrs.frame) > CGRectGetMaxY(self.collectionView.bounds)) {
            [self attributesForAppearingCell:attrs];
        }
    }
}

//уттрибуты для ячейки - заголовка
- (void)attributesForStickyHeaderCell:(UICollectionViewLayoutAttributes *)attrs
{
    attrs.alpha = MIN(1 - self.collectionView.contentOffset.y / 100 * 1.5, 1);
    CGFloat scale = MIN(1 - self.collectionView.contentOffset.y / 3000, 1);
    attrs.transform = CGAffineTransformMakeScale(scale, scale);
    
    CGPoint origin;
    origin.x = self.collectionView.bounds.size.width / 2 - attrs.frame.size.width / 2;
    origin.y = MAX(self.collectionView.contentOffset.y, self.collectionView.contentOffset.y + (1 - scale) / 2);
    
    attrs.frame = (CGRect){.origin = origin, .size = attrs.frame.size};
}

//аттрибуты для появляющихся / исчезающих ячеек
- (void)attributesForAppearingCell:(PCHFibonacciLayoutAttributes *)attrs
{
    CGFloat dy = CGRectGetMaxY(attrs.frame) - (CGRectGetMaxY(self.collectionView.bounds));
    attrs.alpha = MAX(0.0f, 1 - dy / 2 / 100);
    
    CGFloat scale = MIN(1 - dy / 3000, 1);
    attrs.transform = CGAffineTransformMakeScale(scale, scale);

    dy = CGRectGetMaxY(attrs.frame) - (CGRectGetMaxY(self.collectionView.bounds) - CGRectGetHeight(attrs.frame) / 3);
    attrs.textAlpha = dy < 0? 0.0f: MAX(0.0, 1 - dy / 100);
}

- (void)handleEndDragging:(BOOL)decelerate
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    id<UICollectionViewDelegateFlowLayout> delegate = (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
    CGFloat height = [delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath].height;
    
    if (self.collectionView.contentOffset.y < height / 2) {
        [self.collectionView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    else {
        if (self.collectionView.contentOffset.y < height && !decelerate) {
            [self.collectionView setContentOffset:CGPointMake(0, height) animated:YES];
        }
    }
}

@end
