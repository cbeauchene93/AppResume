//
//  menuTableViewCell.h
//  AppResume
//
//  Created by Christopher Beauchene on 12/2/14.
//  Copyright (c) 2014 ChrisBeauchene. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface menuTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *menuImage;
@property (strong, nonatomic) UILabel *menuTitleLabel;
@property (strong, nonatomic) UIScrollView *horizontalScrollView;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
