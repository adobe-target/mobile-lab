//
//  ProfileParamsViewController.m
//  AdobeMobile
//
//  Created by parthasa on 3/15/17.
//  Copyright © 2017 parthasa. All rights reserved.
//

#import "ProfileParamsViewController.h"
#import "ADBMobile.h"

@interface ProfileParamsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileParamsBanner;

@end

@implementation ProfileParamsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self profileParamsActivity];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)profileParamsActivity {

    NSDictionary *targetParams = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  @"uk", @"profile.country",
                                  @"yes", @"profile.hasChecking",
                                  @"yes", @"profile.hasMortgage",
                                  @"no", @"profile.hasAutoLoan",
                                  @"no",@"profile.hasRetirement",
                                  @"2", @"profile.activeAccounts",
                                  @"no", @"profile.isPrivateClient",
                                  nil];
    
    ADBTargetLocationRequest* locationRequest = [ADBMobile targetCreateRequestWithName:@"a1-mobile-profileparams"
                                                                        defaultContent:@"Hello there!"
                                                                            parameters:targetParams];
    
    [ADBMobile targetLoadRequest:locationRequest callback:^(NSString *content){
        [self performSelectorOnMainThread:@selector(profileParamsActivityChanges:) withObject:content waitUntilDone:NO];
    }];

}


-(void)profileParamsActivityChanges: (NSString*) content {
    NSLog(@"⚡️Response from Target --- %@ ⚡️", content);

    NSString *imageUrl = content;
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:imageUrl]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                _profileParamsBanner.image = [UIImage imageWithData:data];
            }] resume];
}

@end
