//
//  ViewController.m
//  AppResume
//
//  Created by Christopher Beauchene on 12/1/14.
//  Copyright (c) 2014 ChrisBeauchene. All rights reserved.
//

#define kprofilePictureWidth 150.0;
#define kProfilePictureHeight 150.0;
#define kProfilePadding 20.0;

#import "homeViewController.h"
#import "SWRevealViewController.h"

@interface homeViewController ()

@end

@implementation homeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Title for the navigation item
    UILabel *titleLabelView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100.0, 44.0)];
    titleLabelView.text = @"Chris Beauchene";
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
    
    self.revealViewController.homeViewController = self;
    
    //Set up the view's navigation controller properties
    
    [self.navigationController.navigationBar setTranslucent:NO];
    self.navigationController.navigationBar.barTintColor = [UIColor lightGrayColor];
    
    //Setting up an image view to hold a picture of my beautiful face!
    
    float profileWidth = kprofilePictureWidth;
    float profileHeight = kProfilePictureHeight;
    float profilePadding = kProfilePadding;
    self.profilePictureView = [[profilePictureClass alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - profileWidth)/2.0, profilePadding, profileWidth, profileHeight)];
    self.profilePictureView.startingOrigin = CGPointMake(([UIScreen mainScreen].bounds.size.width - profileWidth)/2.0, profilePadding);
    self.profilePictureView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.profilePictureView.layer.borderWidth = 5.0f;
    self.profilePictureView.layer.cornerRadius = profileWidth/2.0;
    self.profilePictureView.clipsToBounds = YES;
    self.profilePictureView.image = [UIImage imageNamed:@"Chris_Headshot.png"];
    self.profilePictureView.userInteractionEnabled = YES;
    [self.view addSubview:self.profilePictureView];
    
    //Set up a background for the profile picture
    
    UIView *profileBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0.0, (profileHeight + 2.0*profilePadding), [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - (profileHeight + 2.0*profilePadding))];
    profileBackgroundView.backgroundColor = [UIColor lightGrayColor];
    UILabel *profileDescription = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 20.0, [UIScreen mainScreen].bounds.size.width - 20.0, profileBackgroundView.frame.size.height)];
    profileDescription.textAlignment = NSTextAlignmentJustified;
    profileDescription.textColor = [UIColor whiteColor];
    profileDescription.font = [UIFont fontWithName:@"HelveticaNeue-Regular" size:18.0];
    profileDescription.text = @"    Chris Beauchene is an aspiring software engineer from the humble town of Lincoln, Rhode Island. He attends Northwestern University in Evanston, IL where he is in his third year studying Computer Engineering. He has a passion for learning and is constantly tinkering with random technologies. When he is not coding or studying, he is out playing ultimate frisbee, at pub trivia, rock-climbing, skiing, or just hanging out with friends.";
    profileDescription.numberOfLines = 0;
    [profileDescription sizeToFit];
    [profileBackgroundView addSubview:profileDescription];
    [self.view addSubview:profileBackgroundView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    UIAlertView *tooMuchMemory = [[UIAlertView alloc] initWithTitle:@"Memory Warning" message:@"You're using too much memory! Slow down, boss!" delegate:self cancelButtonTitle:@"Ok :(" otherButtonTitles:nil, nil];
    [tooMuchMemory show];
}




@end
