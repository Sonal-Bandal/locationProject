//
//  myTableViewCell.m
//  2AprilJsonTask
//
//  Created by Felix-ITS 004 on 02/04/18.
//  Copyright © 2018 sonal. All rights reserved.
//

#import "myTableViewCell.h"

@implementation myTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.myCell.numberOfLines=0;
    self.myCell.lineBreakMode=NSLineBreakByWordWrapping;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
