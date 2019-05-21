//
//  CartTableViewCell.m
//  DailyFresh
//
//  Created by Mac on 2019/5/21.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "CartTableViewCell.h"

@implementation CartTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
