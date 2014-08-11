//
//  PCHSearchCell.m
//  Cirqle
//
//  Created by Ilya Puchka on 10.08.14.
//  Copyright (c) 2014 Ilya Puchka. All rights reserved.
//

#import "PCHSearchCell.h"

@interface PCHSearchCell()

@property (nonatomic, weak) IBOutlet UITextField *searchBar;
@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic, weak) IBOutlet UILabel *textLabel;

@end

@implementation PCHSearchCell

- (void)awakeFromNib
{
    //добавляем "лупу" слева
    self.searchBar.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_icon"]];
    self.searchBar.leftView.contentMode = UIViewContentModeCenter;
    self.searchBar.leftView.bounds = CGRectInset(self.searchBar.leftView.bounds, -7, 0);
    self.searchBar.leftViewMode = UITextFieldViewModeAlways;
    
    //в iOS7 можно изменить цвет текста плэйсхолдера
    if ([self.searchBar respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        UIColor *color = [UIColor colorWithRed:123.0f/255.0f green:123.0f/255.0f blue:123.0f/255.0f alpha:1.0f];
        NSDictionary *attributes = @{NSForegroundColorAttributeName: color,
                                     NSFontAttributeName: [UIFont fontWithName:@"ProximaNova-Regular" size:17.0f]};
        self.searchBar.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Search"
                                                                               attributes:attributes];

    }
    
    self.backgroundImageView.image = [UIImage imageNamed:@"dark_cell_bg"];

    self.searchBar.font = [UIFont fontWithName:@"ProximaNova-Regular" size:17.0f];
    self.textLabel.font = [UIFont fontWithName:@"ProximaNova-Regular" size:19.0f];
}

@end
