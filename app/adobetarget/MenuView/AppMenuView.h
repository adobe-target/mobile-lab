//
//  AppMenuView.h
//  123Greetings
//
//  Created by MyAppTemplates Softwarz on 9/16/13.
//  Copyright (c) 2013 123Greetings. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MenuDelegate <NSObject>

@required
-(void)menuSelected:(NSString *)selectedText;

@end

@interface AppMenuView : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tbl;
@property(nonatomic,strong) NSMutableArray *arrMenu;
@property(nonatomic,strong) NSMutableArray *arrIconImage;
@property(nonatomic,assign) BOOL lastLoggedInStatus;
@property(nonatomic,assign) BOOL isAppMenuVisible;
@property(nonatomic) BOOL fromProfile;
@property(nonatomic,strong) id<MenuDelegate> delegate;

- (void)loadTableView;

@end
