//
//  ABViewController.h
//  AdobeMobile
//
//  Created by parthasa on 3/13/17.
//  Copyright © 2017 parthasa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *welcomeMessage;

-(void)welcomeMessageCampaign;
-(void)welcomeMessageCampaignChanges: (NSString*) content;


@end

