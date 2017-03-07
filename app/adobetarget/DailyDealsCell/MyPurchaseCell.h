//
//  MyPurchaseCell.h
//  DailyDeals
//
//  Created by MyAppTemplates Software on 08/04/14.
//  Copyright (c) 2014 MyAppTemplates Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyPurchaseCell : UITableViewCell
@property(nonatomic,strong)IBOutlet UILabel *lblDealTitle;
@property(nonatomic,strong)IBOutlet UILabel *lblDealPrice;
@property(nonatomic,strong)IBOutlet UILabel *lblDealType;
@property(nonatomic,strong)IBOutlet UILabel *lblDealsDate;
@end
