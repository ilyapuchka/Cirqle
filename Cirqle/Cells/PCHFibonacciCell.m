//
//  PCHFibonacciCell.m
//  Cirqle
//
//  Created by Ilya Puchka on 10.08.14.
//  Copyright (c) 2014 Ilya Puchka. All rights reserved.
//

#import "PCHFibonacciCell.h"
#import "PCHFibonacciLayoutAttributes.h"

@interface PCHFibonacciCell()

@property (nonatomic, weak) IBOutlet UILabel *label;
@property (nonatomic, weak) IBOutlet UIImageView *bacgroundImageView;

@end

@implementation PCHFibonacciCell

- (void)awakeFromNib
{
    self.label.font = [UIFont fontWithName:@"ProximaNova-Regular" size:50.0f];
    self.label.shadowOffset = CGSizeMake(0, 0.5);
    self.label.shadowColor = [[UIColor whiteColor] colorWithAlphaComponent:0.15f];
}

- (void)configureWithModel:(PCHFibonacciCellModel *)model
{
    self.label.text = [model labelText];
    self.label.textColor = [model labelTextColor];
    self.bacgroundImageView.image = [model backgroundImage];
}

- (void)applyLayoutAttributes:(PCHFibonacciLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];
    self.label.alpha = layoutAttributes.textAlpha;
}

- (void)prepareForReuse
{
    self.label.text = nil;
}

@end
