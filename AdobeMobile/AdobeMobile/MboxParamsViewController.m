//
//  MboxParamsViewController.m
//  AdobeMobile
//
//  Created by parthasa on 3/15/17.
//  Copyright © 2017 parthasa. All rights reserved.
//

#import "MboxParamsViewController.h"
#import "ADBMobile.h"


@interface MboxParamsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *mboxParamsBanner;

@end

@implementation MboxParamsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self mboxParamsActivity];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)mboxParamsActivity {

    // Set the member level as a mbox parameter
    NSDictionary *targetParams = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  @"business", @"currentCategory",
                                  @"yes", @"isloggedin",
                                  nil];
    
    ADBTargetLocationRequest* locationRequest = [ADBMobile targetCreateRequestWithName:@"a1-mobile-mboxparams"
                                                                        defaultContent:@"Hello there!"
                                                                            parameters:targetParams];
    
    [ADBMobile targetLoadRequest:locationRequest callback:^(NSString *content){
        NSLog(@"⚡️Response from Target --- %@ ⚡️", content);
        [self performSelectorOnMainThread:@selector(mboxParamsActivityChanges:) withObject:content waitUntilDone:NO];
        
    }];
}



-(void)mboxParamsActivityChanges: (NSString*) content
{
    NSString *imageUrl = content;
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:imageUrl]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                _mboxParamsBanner.image = [UIImage imageWithData:data];
            }] resume];
}

@end
