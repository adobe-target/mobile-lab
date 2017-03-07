//
//  AppMenuView.m
//  123Greetings
//
//  Created by MyAppTemplates Softwarz on 9/16/13.
//  Copyright (c) 2013 123Greetings. All rights reserved.
//

#import "AppMenuView.h"
#import "AppDelegate.h"
#import "AppMenuCell.h"


@implementation AppMenuView

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
    
    self.arrMenu=[[NSMutableArray alloc]init];
   
    
    [self loadTableView];

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)loadTableView{
    
   
        
    
  
    self.arrMenu = [NSMutableArray arrayWithObjects:@"Login",@"FAQ",@"About",@"Contact Us",@"Rate this app", nil];
    

    AppDelegate *appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    CGRect rect=self.view.frame;
    rect.size.height=appDelegate.window.frame.size.height;
    self.view.frame=rect;
    [self.tbl reloadData];

    
}

#pragma mark -
#pragma mark UITableViewDelegate and DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.arrMenu.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   	static NSString *CellIdentifier=@"AppMenuCell";
    
    AppMenuCell *cell=(AppMenuCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        UIViewController *controller=[[UIViewController alloc] initWithNibName:@"AppMenuCell" bundle:nil];
        cell=(AppMenuCell *)controller.view;
    }
    
    cell.lblText.text=[self.arrMenu objectAtIndex:indexPath.row];
    cell.imageViewIcon.image=[UIImage imageNamed:[self.arrIconImage objectAtIndex:indexPath.row]];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if([self.delegate respondsToSelector:@selector(menuSelected:)]){
    
        [self.delegate menuSelected:[self.arrMenu objectAtIndex:indexPath.row]];
    }
    
        
    

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
