//
//  CouponViewController.h
//  DailyDeals
//
//  Created by MyAppTemplates Software on 08/04/14.
//  Copyright (c) 2014 MyAppTemplates Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CouponViewController : UIViewController
@property(nonatomic,strong)IBOutlet UIView *viewContainer;
@property(nonatomic,strong)IBOutlet UIImageView *imageViewBackGround;
@property(nonatomic,strong)IBOutlet UILabel *lblTitle;
@property(nonatomic,strong)IBOutlet UILabel *lblCity;
@property(nonatomic,strong)IBOutlet UILabel *lblCoupon;
@property(nonatomic,strong)IBOutlet UILabel *lblCouponCode;
@property(nonatomic,strong)IBOutlet UILabel *lblCouponType;
-(IBAction)btnCancelClk:(id)sender;
@end
