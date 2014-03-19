//
//  PersonalCenterCell.m
//  moguilay
//
//  Created by Moguilay on 14-2-27.
//  Copyright (c) 2014年 Moguilay. All rights reserved.
//

#import "PersonalCenterCell.h"

@implementation PersonalCenterCell
@synthesize logOutBtn, personalMessageLabel,iconImageView;
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
    [self addSubview:logOutBtn];
    
    personalMessageLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 15, 300, 30)];
    personalMessageLabel.backgroundColor = [UIColor clearColor];
//    personalMessageLabel.text = @"个人资料";
    personalMessageLabel.textColor = [UIColor blackColor];
    personalMessageLabel.font = [UIFont systemFontOfSize:16.0f];
    [self addSubview:personalMessageLabel];
    
    
    
    iconImageView = [[UIImageView alloc]init];
    iconImageView.frame = CGRectMake(15, 18, 20, 20);
    [self addSubview:iconImageView];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
