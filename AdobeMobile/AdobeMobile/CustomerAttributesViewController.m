//
//  CustomerAttributesViewController.m
//  AdobeMobile
//
//  Created by parthasa on 3/15/17.
//  Copyright © 2017 parthasa. All rights reserved.
//

#import "CustomerAttributesViewController.h"
#import "ADBMobile.h"

@interface CustomerAttributesViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *customerAttributesBanner;

@end

@implementation CustomerAttributesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customerAttributesBannerActivity];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)customerAttributesBannerActivity {
    
    NSDictionary *targetParams = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  @"a1-mbox3rdPartyId", @"mbox3rdPartyId",
                                  nil];

    
    [ADBMobile visitorSyncIdentifiers:@{@"memberid":@"123456807"}];
    ADBTargetLocationRequest* locationRequest = [ADBMobile targetCreateRequestWithName:@"a1-mobile-crs"
                                                                        defaultContent:@"Hello there!"
                                                                            parameters:targetParams];
    
    [ADBMobile targetLoadRequest:locationRequest callback:^(NSString *content){
        NSLog(@"⚡️Response from Target --- %@ ⚡️", content);
        [self performSelectorOnMainThread:@selector(customerAttributesBannerActivityChanges:) withObject:content waitUntilDone:NO];
    }];
}

-(void)customerAttributesBannerActivityChanges: (NSString*) content {
    
    NSDataDetector* detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
    NSArray* matches = [detector matchesInString:content options:0
                                 range:NSMakeRange(0, [content length])];
    for (NSTextCheckingResult *match in matches) {
        NSURL *imageUrl = [match URL];
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:imageUrl
                  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                    _customerAttributesBanner.image = [UIImage imageWithData:data];
                  }] resume];
    }
}

@end
