//
//  DealsDetailsViewController.m
//  DailyDeals
//
//  Created by MyAppTemplates Software on 08/04/14.
//  Copyright (c) 2014 MyAppTemplates Software. All rights reserved.
//

#import "DealsDetailsViewController.h"
#import "MyPurchaseViewController.h"
@interface DealsDetailsViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation DealsDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    CGRect rect = self.textView.frame;
    rect.size.height=self.textView.contentSize.height+10.0;
    self.textView.frame=rect;
    
    [self.scrollView setContentSize:CGSizeMake(0, rect.origin.y+rect.size.height)];
    
    
}
-(IBAction)btnBackClk:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)btnBuyClk:(id)sender
{
    //PerfomSelector will go to my purchase details
   // [self performSegueWithIdentifier:@"detailsToMyPurchaseView" sender:self];
    //Add coupon view controller
    
    self.controller = [self.storyboard instantiateViewControllerWithIdentifier:@"coupnViewController"];
    [self.view addSubview:self.controller.view];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailsToMyPurchaseView"]) {
        
       // MyPurchaseViewController *newSegue=segue.destinationViewController;
        //Pass any value to dailyDetails ViewController if require
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}
@end
