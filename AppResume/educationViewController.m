//
//  educationViewController.m
//  AppResume
//
//  Created by Christopher Beauchene on 12/3/14.
//  Copyright (c) 2014 ChrisBeauchene. All rights reserved.
//

#import "educationViewController.h"
#import "SWRevealViewController.h"
#import "menuTableViewCell.h"

@interface educationViewController ()

@end

@implementation educationViewController

UITableView *tableView;
NSArray *basicEngineeringArray;
NSArray *scienceArray;
NSArray *mathArray;
NSArray *EECSArray;
NSArray *econArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    //Title for the navigation item
    
    UILabel *titleLabelView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100.0, 44.0)];
    titleLabelView.text = @"EDUCATION";
    titleLabelView.textColor = [UIColor whiteColor];
    titleLabelView.textAlignment = NSTextAlignmentCenter;
    titleLabelView.font = [UIFont fontWithName:@"Palatino" size:25.0];
    self.navigationItem.titleView = titleLabelView;
    
    
    //Bar button item
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:self.revealViewController action:@selector(revealToggle:)];
    menuButton.image = [UIImage imageNamed:@"menu_icon"];
    menuButton.tintColor = [UIColor whiteColor];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    self.navigationItem.leftBarButtonItem = menuButton;
    
    //Set up the view's navigation controller properties
    
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:49.0/256.0 green:7.0/256 blue:109.0/256.0 alpha:1.0];
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - [UIApplication sharedApplication].statusBarFrame.size.height - self.navigationController.navigationBar.frame.size.height)];
    tableView.scrollEnabled = YES;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[menuTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    basicEngineeringArray = @[@"Linear Algebra and MATLAB", @"Engineering Mechanics", @"Kinematics", @"Differential Equations", @"Design, Thinking, and Communication"];
    scienceArray = @[@"General Chemistry I-II", @"Electicity and Magnetism", @"Waves and Optics"];
    mathArray = @[@"Differential Calculus of Multivariable Functions", @"Multivariable Integrals and Vector Calculus"];
    EECSArray = @[@"Introduction to Electrical Engineering", @"Introduction to Computer Engineering", @"Computer System Software", @"Fundamentals of Computer Programming", @"Object-Oriented Programming in C++", @"Mathematical Foundations of Computer Science", @"Introduction to Computer Systems", @"Data Structures and Data Management", @"Probabilistic Systems and Random Signals", @"Advanced Digital Logic", @"Introduction to Computer Graphics", @"Programming Massively Parallel Processors"];
    econArray = @[@"Introduction to Microeconomics", @"Introduction to Macroeconomics", @"Econometrics", @"Intermediate Microeconomics I-II", @"Intermediate Macroeconomics", @"Economic History of the United States before 1865", @"International Finance"];
    [self.view addSubview:tableView];

    
}

#pragma mark - Table View Datasource Methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    menuTableViewCell *cell = [[menuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.horizontalScrollView.showsHorizontalScrollIndicator = NO;
    cell.menuTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:16.0];
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.menuTitleLabel.text = @"Northwestern University";
        } else if (indexPath.row == 1) {
            cell.menuTitleLabel.text = @"Evanston, IL";
        } else if (indexPath.row == 2) {
            cell.menuTitleLabel.text = @"Graduation Date: June 2016";
        }
        cell.menuImage.image = [UIImage imageNamed:@"graduates1.png"];
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            cell.menuTitleLabel.text = @"Computer Engineering";
            cell.menuImage.image = [UIImage imageNamed:@"computer-50.png"];
        } else if (indexPath.row == 1) {
            cell.menuTitleLabel.text = @"Economics";
            cell.menuImage.image = [UIImage imageNamed:@"presentation-50.png"];
        }
    } if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            cell.menuTitleLabel.text = @"Cumulative GPA: 3.75/4.0";
        } else if (indexPath.row == 1) {
            cell.menuTitleLabel.text = @"SAT Composite: 2250 -- R: 750 M: 800 W: 700";
        }
        cell.menuImage.image = [UIImage imageNamed:@"combo_chart-50.png"];
    } if (indexPath.section == 5) {
        cell.menuTitleLabel.text = EECSArray[indexPath.row];
        cell.menuImage.image = [UIImage imageNamed:@"computer-50.png"];
    } if (indexPath.section == 6) {
        cell.menuTitleLabel.text = econArray[indexPath.row];
        cell.menuImage.image = [UIImage imageNamed:@"presentation-50.png"];
    } if (indexPath.section == 7) {
        cell.menuTitleLabel.text = basicEngineeringArray[indexPath.row];
        cell.menuImage.image = [UIImage imageNamed:@"caliper-50.png"];
    } if (indexPath.section == 8) {
        cell.menuTitleLabel.text = mathArray[indexPath.row];
        cell.menuImage.image = [UIImage imageNamed:@"pi-50.png"];
    } if (indexPath.section == 9) {
        cell.menuTitleLabel.text = scienceArray[indexPath.row];
        cell.menuImage.image = [UIImage imageNamed:@"physics-50.png"];
    }
    if ([cell.menuTitleLabel.text sizeWithAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Thin" size:16.0]}].width > (cell.frame.size.width - 50.0)) {
        cell.userInteractionEnabled = YES;
    } else {
        cell.userInteractionEnabled = NO;
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else if (section == 1) {
        return 3;
    } else if (section == 4) {
        return 0;
    } else if (section == 5) {
        return [EECSArray count];
    } else if (section == 6) {
        return [econArray count];
    } else if (section == 7) {
        return [basicEngineeringArray count];
    } else if (section == 8) {
        return [mathArray count];
    } else if (section == 9) {
        return [scienceArray count];
    }
    return 2;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}


#pragma mark - Table View Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    float height = 0.0;
    if (section == 0) {
        height = ([UIScreen mainScreen].bounds.size.width/360.0)*164.0;
    } else  {
        height = 20.0;
    }
    return height;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *nilView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 0.0, 0.0)];
    UILabel *collegeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, 40.0)];
    collegeLabel.text = @"    General College Information";
    collegeLabel.textAlignment = NSTextAlignmentLeft;
    collegeLabel.font = [UIFont fontWithName:@"HelveticaNeue-Regular" size:14.0];
    collegeLabel.textColor = [UIColor whiteColor];
    collegeLabel.backgroundColor = [UIColor lightGrayColor];
    if (section < 10) {
        if (section == 0) {
            UIImageView *northwesternImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, ([UIScreen mainScreen].bounds.size.width/360.0)*164.0)];
            northwesternImageView.image = [UIImage imageNamed:@"northwesternImage.jpg"];
            return northwesternImageView;
        } else if (section == 1) {
            collegeLabel.text = @"    General College Information";
        } else if (section == 2) {
            collegeLabel.text = @"    Majors";
        } else if (section == 3) {
            collegeLabel.text = @"    College GPA and SAT";
        } else if (section == 4) {
            collegeLabel.text = @"    Relevant Courses:";
        } else if (section == 5) {
            collegeLabel.text = @"      EECS";
        } else if (section == 6) {
            collegeLabel.text = @"      Economics";
        } else if (section == 7) {
            collegeLabel.text = @"      Basic Engineering";
        } else if (section == 8) {
            collegeLabel.text = @"      Mathematics";
        } else if (section == 9) {
            collegeLabel.text = @"      Science";
        }
        return collegeLabel;
    }
    return nilView;
}




@end
