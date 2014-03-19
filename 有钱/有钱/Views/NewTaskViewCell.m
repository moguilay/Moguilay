//
//  NewTaskViewCell.m
//  moguilay
//
//  Created by Moguilay on 14-2-27.
//  Copyright (c) 2014年 Moguilay. All rights reserved.
//

#import "NewTaskViewCell.h"

@implementation NewTaskViewCell
@synthesize taskIconImageView, taskNameLabel, messageLabel, moneyNumLabel, doTaskMessageLabel;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self makeTheViewCell];
        // Initialization code
    }
    return self;
}

-(void)makeTheViewCell{
    taskIconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(-10, 0, 340, 20)];
    [self addSubview:taskIconImageView];
    
    
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
