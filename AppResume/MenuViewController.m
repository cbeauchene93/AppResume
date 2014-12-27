//
//  MenuViewController.m
//  AppResume
//
//  Created by Christopher Beauchene on 12/2/14.
//  Copyright (c) 2014 ChrisBeauchene. All rights reserved.
//

#import "MenuViewController.h"
#import "menuTableViewCell.h"
#import "SWRevealViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

UITableView *tableView;
NSInteger selectedCell;
NSArray *unselectedImageArray;
NSArray *selectedImageArray;
NSArray *menuTitlesArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    unselectedImageArray  = @[@"home-50.png", @"brain-50.png", @"briefcase-50.png", @"code-50.png"];
    selectedImageArray = @[@"home_filled-50.png", @"brain_filled-50.png", @"briefcase_filled-50.png",  @"code_filled-50.png"];
    menuTitlesArray = @[@"Home", @"Education", @"Work Experience", @"Computer Skills"];
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    tableView.scrollEnabled = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];
    
    selectedCell = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Datasource Methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    menuTableViewCell *cell = [[menuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.horizontalScrollView.userInteractionEnabled = NO;
    cell.menuTitleLabel.text = menuTitlesArray[indexPath.row];
    if (selectedCell == indexPath.row) {
        cell.menuImage.image = [UIImage imageNamed:selectedImageArray[indexPath.row]];
        cell.menuTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0];
    } else {
        cell.menuImage.image = [UIImage imageNamed:unselectedImageArray[indexPath.row]];
        cell.menuTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:15.0];
        
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [menuTitlesArray count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row != selectedCell) {
        if (indexPath.row == 0) {
            [self.revealViewController setFrontViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"homeNavigationViewController"]];
            [self.revealViewController revealToggleAnimated:YES];
        } else if (indexPath.row == 1) {
            [self.revealViewController setFrontViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"educationNavigationViewController"]];
            [self.revealViewController revealToggleAnimated:YES];
        } else if (indexPath.row == 2) {
            [self.revealViewController setFrontViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"workExperienceNavigationViewController"]];
            [self.revealViewController revealToggleAnimated:YES];
        } else if (indexPath.row == 3) {
            [self.revealViewController setFrontViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"skillsNavigationViewController"]];
            [self.revealViewController revealToggleAnimated:YES];
        }
    }
    
    selectedCell = indexPath.row;
    [tableView reloadData];
}

#pragma mark - Table View Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 64.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, 64.0)];
    headerView.backgroundColor = [UIColor lightGrayColor];
    UILabel *aboutMeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 20.0, [UIScreen mainScreen].bounds.size.width, 44.0)];
    aboutMeLabel.text = @"About Me";
    aboutMeLabel.textAlignment = NSTextAlignmentCenter;
    aboutMeLabel.textColor = [UIColor whiteColor];
    aboutMeLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:25.0];
    [headerView addSubview:aboutMeLabel];
    return headerView;
}



@end
