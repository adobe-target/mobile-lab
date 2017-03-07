//
//  DailyDealsCell.h
//  DailyDeals
//
//  Created by MyAppTemplates Software on 07/04/14.
//  Copyright (c) 2014 MyAppTemplates Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DailyDealsCell : UITableViewCell
@property(nonatomic,strong)IBOutlet UILabel *lblDealsTitle;
@property(nonatomic,strong)IBOutlet UILabel *lblDealsState;
@property(nonatomic,strong)IBOutlet UILabel *lblDealsCurrentPrice;
@property(nonatomic,strong)IBOutlet UILabel *lblDealsOldPrice;
@property(nonatomic,strong)IBOutlet UILabel *lblDealsBuyStatus;
@property(nonatomic,strong)IBOutlet UILabel *lblDealsPurchasedCount;
@property(nonatomic,strong)IBOutlet UIImageView *imageView;
@end
