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
@property (weak, nonatomic) IBOutlet UIButton *mboxParamsBanner;

@end

@implementation MboxParamsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self mboxParamsActivity];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) mboxParamsActivity {

    NSArray *categories = [NSArray arrayWithObjects: @"men", @"women", @"boys", @"girls", @"home", @"sale", nil];
    NSString *randomCategory = [categories objectAtIndex:arc4random()%[categories count]];
    NSLog(@"Your category is %@", randomCategory);

    
    
    // Set the member level as a mbox parameter
    NSDictionary *targetParams = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  @"women", @"currentCategory",
                                  @"120.00", @"cartValue",
                                  @"4", @"itemsInCart",
                                  nil];
    
    ADBTargetLocationRequest* locationRequest = [ADBMobile targetCreateRequestWithName:@"a1-mobile-mboxparams"
                                                                        defaultContent:@"Hello there!"
                                                                            parameters:targetParams];
    
    [ADBMobile targetLoadRequest:locationRequest callback:^(NSString *content){
        NSLog(@"⚡️Response from Target --- %@ ⚡️", content);
        [self performSelectorOnMainThread:@selector(welcomeMessageCampaignChanges:) withObject:content waitUntilDone:NO];
        
    }];
}



-(void)welcomeMessageCampaignChanges: (NSString*) content
{

//    NSDataDetector* detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
//    NSArray* matches = [detector matchesInString:content options:0 range:NSMakeRange(0, [content length])];
//    for (NSTextCheckingResult *match in matches) {
//        NSURL *url = [match URL];
//    }

    [_mboxParamsBanner setTitle: content forState: UIControlStateNormal];
}

@end
