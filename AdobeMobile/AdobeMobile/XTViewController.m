//
//  SecondViewController.m
//  AdobeMobile
//
//  Created by parthasa on 3/13/17.
//  Copyright © 2017 parthasa. All rights reserved.
//

#import "XTViewController.h"
#import "ADBMobile.h"

@interface XTViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *memberLevel;
@end

@implementation XTViewController

- (void)viewDidLoad {
    [self XTActivity];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)XTActivity {

    
    // Assign a random member level and reset user
    NSArray *levels = [NSArray arrayWithObjects: @"silver", @"gold", @"sapphire", nil];
    NSString *randomLevel = [levels objectAtIndex:arc4random()%[levels count]];
    NSLog(@"Your member level is %@", randomLevel);
    [ADBMobile targetClearCookies];
    
    // Set the member level as a mbox parameter
    NSDictionary *targetParams = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  randomLevel, @"memberLevel",
                                  nil];
    
     // Here 'a1-mobile-xt' is the name of the location. This will show up in the content
     // location dropdown in the UI.

    // Replace a1 with your unique user number.

     ADBTargetLocationRequest* locationRequest = [ADBMobile targetCreateRequestWithName:@"a1-mobile-xt"
                                                                        defaultContent:@"Hello there!"
                                                                            parameters:targetParams];
    
    [ADBMobile targetLoadRequest:locationRequest callback:^(NSString *content){
        [self performSelectorOnMainThread:@selector(XTActivityChanges:) withObject:content waitUntilDone:NO];
    }];
    
}

-(void)XTActivityChanges: (NSString*) content {
    NSDataDetector* detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
    NSArray* matches = [detector matchesInString:content options:0
                                           range:NSMakeRange(0, [content length])];
    for (NSTextCheckingResult *match in matches) {
        NSURL *imageUrl = [match URL];
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:imageUrl
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                    _memberLevel.image = [UIImage imageWithData:data];
                }] resume];
    }
}

@end
