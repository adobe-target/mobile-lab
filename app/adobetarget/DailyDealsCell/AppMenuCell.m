//
//  AppMenuCell.m
//  NearVacancy
//
//  Created by MyAppTemplates Software on 15/11/13.
//  Copyright (c) 2013 MyAppTemplates Software. All rights reserved.
//

#import "AppMenuCell.h"



@implementation AppMenuCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    if(highlighted){
        self.backgroundColor=[UIColor colorWithRed:(93.0/255.0) green:(93.0/255.0) blue:(93.0/255.0) alpha:1] ;
    }else
        self.backgroundColor=[UIColor clearColor];
}


@end
