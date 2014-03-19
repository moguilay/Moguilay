//
//  PersonalMessageCell.m
//  moguilay
//
//  Created by Moguilay on 14-2-27.
//  Copyright (c) 2014年 Moguilay. All rights reserved.
//

#import "PersonalMessageCell.h"

@implementation PersonalMessageCell
@synthesize personalMessageLabel;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self makeView];
    }
    return self;
}
-(void)makeView{


    personalMessageLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 300, 30)];
    personalMessageLabel.backgroundColor = [UIColor clearColor];
    
    personalMessageLabel.textColor = [UIColor blackColor];
    personalMessageLabel.font = [UIFont systemFontOfSize:16.0f];
    [self addSubview:personalMessageLabel];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
