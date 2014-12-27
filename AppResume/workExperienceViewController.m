//
//  workExperienceViewController.m
//  AppResume
//
//  Created by Christopher Beauchene on 12/3/14.
//  Copyright (c) 2014 ChrisBeauchene. All rights reserved.
//

#import "workExperienceViewController.h"
#import "SWRevealViewController.h"
#import "menuTableViewCell.h"

@interface workExperienceViewController ()

@end

@implementation workExperienceViewController

UITableView *tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    //Title for the navigation item
    UILabel *titleLabelView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100.0, 44.0)];
    titleLabelView.text = @"Work Experience";
    titleLabelView.textColor = [UIColor whiteColor];
    titleLabelView.textAlignment = NSTextAlignmentCenter;
    titleLabelView.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:25.0];
    self.navigationItem.titleView = titleLabelView;
    
    
    //Bar button item
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:self.revealViewController action:@selector(revealToggle:)];
    menuButton.image = [UIImage imageNamed:@"menu_icon"];
    menuButton.tintColor = [UIColor whiteColor];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    self.navigationItem.leftBarButtonItem = menuButton;
    
    //Set up the view's navigation controller properties
    
    [self.navigationController.navigationBar setTranslucent:NO];
    self.navigationController.navigationBar.barTintColor = [UIColor lightGrayColor];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor lightGrayColor]];
    
    //Set up the Table View controller
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - [UIApplication sharedApplication].statusBarFrame.size.height - self.navigationController.navigationBar.frame.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.scrollEnabled = YES;
    [tableView registerClass:[menuTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    menuTableViewCell *cell = [[menuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    [cell.menuImage removeFromSuperview];
    [cell.horizontalScrollView removeFromSuperview];
    [cell.menuTitleLabel removeFromSuperview];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Regular" size:18.0];
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.textLabel.text = @"    Cuiserve Pvt. Ltd. provides a restaurant reservation service that allows the user to see the floor plan of the restaurant and reserve a specific table accordingly. Currently based in Chicago, IL and Bangalore, India. I work as the director of engineering and the lead iOS developer.";
    } else {
        cell.textLabel.text = @"    I worked as an engineering intern for Day-O-Lite Fluorescent Manufacturing for three summers from 2012 to 2014. As an intern I would do 3D design work with AutoCAD Mechanical and Inventor to facilitate the manufacturing process. In addition, I rendered existing and new products in AutoCAD Mechanical to create images for the company website. I also helped develop new LED products as the company slowly made the transistion from fluorescent to LED fixtures.";
    }
    [cell.textLabel setTextAlignment:NSTextAlignmentJustified];
    [cell.textLabel setNumberOfLines:0];
    [cell.textLabel sizeToFit];
    
    if ([cell.menuTitleLabel.text sizeWithAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Thin" size:16.0]}].width > (cell.frame.size.width - 50.0)) {
        cell.userInteractionEnabled = YES;
    } else {
        cell.userInteractionEnabled = NO;
    }
    
    
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

#pragma mark - Header methods

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 200.0;
    } else if (indexPath.section == 1 && indexPath.row == 0) {
        return 300.0;
    }
    return 45;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *headerView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, 40.0)];
    UIColor *cuiserveColor = [UIColor colorWithRed:228.0/255.0 green:114.0/255.0 blue:99.0/255.0 alpha:1.0];
    if (section == 0) {
        headerView.backgroundColor = cuiserveColor;
        headerView.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:20.0];
        headerView.text = @"Cuiserve: April 2014 - present";
        headerView.textAlignment = NSTextAlignmentCenter;
        headerView.textColor = [UIColor whiteColor];
    } else {
        headerView.backgroundColor = [UIColor lightGrayColor];
        headerView.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:18.0];
        headerView.text = @"Day-O-Lite Fluorescent Manufacturing";
        headerView.textAlignment = NSTextAlignmentCenter;
        headerView.textColor = [UIColor whiteColor];
        headerView.numberOfLines = 2;
    }
    return headerView;
}

@end
