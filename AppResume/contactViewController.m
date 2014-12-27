//
//  contactViewController.m
//  AppResume
//
//  Created by Christopher Beauchene on 12/3/14.
//  Copyright (c) 2014 ChrisBeauchene. All rights reserved.
//

#import "contactViewController.h"
#import "SWRevealViewController.h"

@interface contactViewController ()

@end

@implementation contactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Title for the navigation item
    UILabel *titleLabelView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100.0, 44.0)];
    titleLabelView.text = @"Contact Information";
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




@end
