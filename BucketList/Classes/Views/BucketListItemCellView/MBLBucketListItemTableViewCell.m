//
//  MBLBucketListItemTableViewCell.h
//  BucketList
//
//  Created by Timur Piriev on 10/26/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import "MBLBucketListItemTableViewCell.h"
#import "UIColor+MBLAdditions.h"

@implementation MBLBucketListItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [[self.containerView layer] setBorderColor:[UIColor colorForBorder].CGColor];
    [[self.containerView layer] setBorderWidth:1.f];
    [[self.containerView layer] setCornerRadius:3.f];
     
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
