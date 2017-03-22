//
//  AudienceManagerViewController.m
//  AdobeMobile
//
//  Created by parthasa on 3/15/17.
//  Copyright © 2017 parthasa. All rights reserved.
//

#import "AudienceManagerViewController.h"
#import "ADBMobile.h"

@interface AudienceManagerViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *audienceManagerBanner;

@end

@implementation AudienceManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self audienceManagerBannerActivity];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)audienceManagerBannerActivity {
    [ADBMobile visitorSyncIdentifiers:@{@"member_guid":@"123456785"}];
    [ADBMobile visitorSyncIdentifiers:@{@"my-customer-id":@"123456785"} authenticationState:ADBMobileVisitorAuthenticationStateAuthenticated];

    
    ADBTargetLocationRequest* locationRequest = [ADBMobile targetCreateRequestWithName:@"a1-mobile-aam"
                                                                        defaultContent:@"Hello there!"
                                                                            parameters:nil];
    
    [ADBMobile targetLoadRequest:locationRequest callback:^(NSString *content){
        NSLog(@"⚡️Response from Target --- %@ ⚡️", content);
        [self performSelectorOnMainThread:@selector(audienceManagerBannerActivityChanges:) withObject:content waitUntilDone:NO];
        
    }];
    
    [ADBMobile trackState:@"Audience Manager Screen" data:nil];
    
}

-(void)audienceManagerBannerActivityChanges: (NSString*) content {

    NSString *imageUrl = content;
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:imageUrl]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                _audienceManagerBanner.image = [UIImage imageWithData:data];
            }] resume];

}
  

@end
