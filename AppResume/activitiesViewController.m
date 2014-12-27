//
//  activitiesViewController.m
//  AppResume
//
//  Created by Christopher Beauchene on 12/3/14.
//  Copyright (c) 2014 ChrisBeauchene. All rights reserved.
//

#import "activitiesViewController.h"
#import "SWRevealViewController.h"

@interface activitiesViewController ()

@end

@implementation activitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Title for the navigation item
    UILabel *titleLabelView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100.0, 44.0)];
    titleLabelView.text = @"Activities and Leadership";
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
