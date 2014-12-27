//
//  skillsViewController.m
//  AppResume
//
//  Created by Christopher Beauchene on 12/3/14.
//  Copyright (c) 2014 ChrisBeauchene. All rights reserved.
//

#import "skillsViewController.h"
#import "SWRevealViewController.h"

@interface skillsViewController ()

@end

@implementation skillsViewController

UITableView *tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    //Title for the navigation item
    UILabel *titleLabelView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100.0, 44.0)];
    titleLabelView.text = @"Computer Skills";
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
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - [UIApplication sharedApplication].statusBarFrame.size.height - self.navigationController.navigationBar.frame.size.height) style:UITableViewStylePlain];
    [tableView setScrollEnabled:YES];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];
}

#pragma mark - Table View Methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor blackColor];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel. text = @"C";
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"C++";
        } else if (indexPath.row == 2) {
            cell.textLabel.text = @"Objective-C";
        } else if (indexPath.row == 3) {
            cell.textLabel.text = @"Python";
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"HTML";
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"CSS";
        }
    } else if (indexPath.section == 2) {
        cell.textLabel.text = @"x86 Assembly";
    } else if (indexPath.section == 3) {
        cell.textLabel.text = @"VHDL";
    } else if (indexPath.section == 4) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"Eclipse";
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"Xcode";
        } else if (indexPath.row == 2) {
            cell.textLabel.text = @"Pycharm";
        }
    } else if (indexPath.section == 5) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"AutoCAD Mechanical";
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"AutoCAD Inventor";
        }
    }
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 4;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 1;
            break;
        case 3:
            return 1;
            break;
        case 4:
            return 3;
            break;
        case 5:
            return 2;
            break;
        default:
            return 0;
            break;
    }
}

#pragma mark - Header View Methods

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section < 6) {
        return 30.0;
    }
    
    return 0.0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *headerView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, 30.0)];
    headerView.backgroundColor = [UIColor blackColor];
    headerView.textAlignment = NSTextAlignmentCenter;
    headerView.textColor = [UIColor whiteColor];
    headerView.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:16.0];
    switch (section) {
        case 0:
            headerView.text = @"High-Level Languages";
            break;
        case 1:
            headerView.text = @"Web Development";
            break;
        case 2:
            headerView.text = @"Low-Level Languages";
            break;
        case 3:
            headerView.text = @"Hardware Design";
            break;
        case 4:
            headerView.text = @"IDE's";
            break;
        case 5:
            headerView.text = @"3D-Design";
            break;
        default:
            break;
    }
    return headerView;
}



@end
