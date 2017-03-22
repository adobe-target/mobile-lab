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

    NSArray *houses = [NSArray arrayWithObjects: @"stark", @"lannister", @"targayren", @"baratheon", @"bolton", nil];
    NSString *randomHouse = [houses objectAtIndex:arc4random()%[houses count]];
    NSLog(@"Your house is %@", randomHouse);
    [ADBMobile targetClearCookies];

    NSDictionary *targetParams = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  randomHouse, @"profile.house",
                                  nil];
    
    ADBTargetLocationRequest* locationRequest = [ADBMobile targetCreateRequestWithName:@"a1-mobile-profileparams"
                                                                        defaultContent:@"Hello there!"
                                                                            parameters:targetParams];
    
    [ADBMobile targetLoadRequest:locationRequest callback:^(NSString *content){
        [self performSelectorOnMainThread:@selector(profileParamsActivityChanges:) withObject:content waitUntilDone:YES];
    }];

}


-(void)profileParamsActivityChanges: (NSString*) content {
    NSDataDetector* detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
    NSArray* matches = [detector matchesInString:content options:0
                                           range:NSMakeRange(0, [content length])];
    for (NSTextCheckingResult *match in matches) {
        NSURL *imageUrl = [match URL];
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:imageUrl
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                    _profileParamsBanner.image = [UIImage imageWithData:data];
                }] resume];
    }
}

@end
