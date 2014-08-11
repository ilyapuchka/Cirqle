//
//  PCHViewController.m
//  Cirqle
//
//  Created by Ilya Puchka on 10.08.14.
//  Copyright (c) 2014 Ilya Puchka. All rights reserved.
//

#import "PCHViewController.h"
#import "PCHFibonacciCell.h"
#import "PCHFibonacciCellModel.h"
#import "PCHFibonacciMath.h"
#import "PCHSearchCell.h"
#import "PCHFibonacciOperationQueue.h"
#import "PCHFibonacciCell+Math.h"
#import "PCHFibonacciLayout.h"

@interface PCHViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate>

@end

@implementation PCHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Collection View

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return fib_count();
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([PCHSearchCell class])
                                                                               forIndexPath:indexPath];
        return cell;
    }
    else {
        PCHFibonacciCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([PCHFibonacciCell class])
                                                                           forIndexPath:indexPath];

        [self enqueuOperationForCell:cell atIndex:indexPath.item];
        
        return cell;
    }
}

#define HeaderCellHeight 81.5
#define OtherCellsHieght 125

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(collectionView.bounds.size.width, HeaderCellHeight);
    }
    else {
        return CGSizeMake(collectionView.bounds.size.width, OtherCellsHieght);
    }
}

#pragma mark - Scrolling

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    PCHFibonacciLayout *layout = (PCHFibonacciLayout *)[(UICollectionView *)scrollView collectionViewLayout];
    [layout handleEndDragging:decelerate];
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    return YES;
}

#pragma mark - Private

- (void)enqueuOperationForCell:(PCHFibonacciCell *)cell atIndex:(NSInteger)index
{
    static PCHFibonacciOperationQueue *queue;
    if (!queue) queue = [PCHFibonacciOperationQueue new];
    
    PCHFibonacciOperation *op = [queue enqueOperationForIndex:index completion:^(NSInteger index, unsigned long long fib, bool is_prime) {
        if (index == cell.pch_operation.index) {
            PCHFibonacciCellModel *model = [[PCHFibonacciCellModel alloc] initWithNumber:fib isPrime:is_prime];
            [cell configureWithModel:model];
        }
        else {
            NSLog(@"wrong index %i (op.index %i)", index, cell.pch_operation.index);
        }
    }];
    
    cell.pch_operation = op;
}

@end
