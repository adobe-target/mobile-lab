//
//  ProfileViewController.m
//  DailyDeals
//
//  Created by MyAppTemplates Software on 08/04/14.
//  Copyright (c) 2014 MyAppTemplates Software. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    self.scrollView.contentSize=CGSizeMake(320, 560);
}
-(IBAction)btnCrossClk:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)btnSignOutClk:(id)sender
{
   [self.navigationController popToRootViewControllerAnimated:YES];
}
-(IBAction)btnEditClk:(id)sender
{
    
}
-(IBAction)btnNotificationClk:(id)sender
{
    if (!self.btnNotification.selected) {
       [self.btnNotification setImage:[UIImage imageNamed:@"on.png"] forState:UIControlStateNormal];
        self.btnNotification.selected=YES;
    }else{
       [self.btnNotification setImage:[UIImage imageNamed:@"off.png"] forState:UIControlStateNormal];
        self.btnNotification.selected=NO;
    }
}
-(IBAction)btnPasscodeClk:(id)sender
{
    if (!self.btnPasscode.selected) {
       [self.btnPasscode setImage:[UIImage imageNamed:@"off.png"] forState:UIControlStateNormal];
         self.btnPasscode.selected=YES;
    }else{
        [self.btnPasscode setImage:[UIImage imageNamed:@"on.png"] forState:UIControlStateNormal];
        self.btnPasscode.selected=NO;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}
@end
