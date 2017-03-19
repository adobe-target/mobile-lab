//
//  FirstViewController.m
//  AdobeMobile
//
//  Created by parthasa on 3/13/17.
//  Copyright © 2017 parthasa. All rights reserved.
//

#import "ABViewController.h"
#import "ADBMobile.h"

@interface ABViewController ()
@end

@implementation ABViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ABActivity];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)ABActivity
{
    
    // Here 'a1-mobile-ab' is the name of the location. This will show up in the content
    // location dropdown in the Target UI.

    // Replace a1 with your unique user number.
    
    [ADBMobile targetClearCookies];
    ADBTargetLocationRequest* locationRequest = [ADBMobile targetCreateRequestWithName:@"a1-mobile-ab"
                                                                        defaultContent:@"Hello there!"
                                                                            parameters:nil];
    
    [ADBMobile targetLoadRequest:locationRequest callback:^(NSString *content){
        NSLog(@"⚡️Response from Target --- %@ ⚡️", content);
        
        // It is typically a bad practice to run on the main thread! This is just for the sample app.
        // In your production app, get this content asyncronously before the view is rendered so that the end
        // user won't see a flicker when new content is inserted or replaced.
        [self performSelectorOnMainThread:@selector(ABActivityChanges:) withObject:content waitUntilDone:NO];
        
    }];
    
}

-(void)ABActivityChanges: (NSString*) content
{
    [_welcomeMessage setTitle: content forState: UIControlStateNormal];
}

@end
