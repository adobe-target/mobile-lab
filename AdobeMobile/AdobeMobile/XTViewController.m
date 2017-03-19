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
    [super viewDidLoad];
    [self XTActivity];
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
    NSLog(@"⚡️Response from Target --- %@ ⚡️", content);
    if ([content  isEqual: @"silver"]) {
        self.memberLevel.image = [UIImage imageNamed:@"memberLevelSilver"];
    } else if ([content  isEqual: @"gold"]) {
        self.memberLevel.image = [UIImage imageNamed:@"memberLevelGold"];
    } else if ([content  isEqual: @"sapphire"]){
        self.memberLevel.image = [UIImage imageNamed:@"memberLevelSapphire"];
    }
}

@end
