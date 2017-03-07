//
//  ProfileViewController.h
//  DailyDeals
//
//  Created by MyAppTemplates Software on 08/04/14.
//  Copyright (c) 2014 MyAppTemplates Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController
@property(nonatomic,strong)IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong)IBOutlet UIButton *btnNotification;
@property(nonatomic,strong)IBOutlet UIButton *btnPasscode;

-(IBAction)btnCrossClk:(id)sender;
-(IBAction)btnSignOutClk:(id)sender;
-(IBAction)btnEditClk:(id)sender;
-(IBAction)btnNotificationClk:(id)sender;
-(IBAction)btnPasscodeClk:(id)sender;
@end
