//
//  menuTableViewCell.m
//  AppResume
//
//  Created by Christopher Beauchene on 12/2/14.
//  Copyright (c) 2014 ChrisBeauchene. All rights reserved.
//

#import "menuTableViewCell.h"

@implementation menuTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.horizontalScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(50.0, 0.0, self.frame.size.width, self.frame.size.height)];
        self.menuImage = [[UIImageView alloc] initWithFrame:CGRectMake(5.0, 5.0, 30.0, 30.0)];
        [self addSubview: self.menuImage];
        self.menuTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 500.0, self.frame.size.height)];
        [self.horizontalScrollView addSubview:self.menuTitleLabel];
        [self.horizontalScrollView setContentSize:CGSizeMake(500.0, self.frame.size.height)];
        [self addSubview:self.horizontalScrollView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
