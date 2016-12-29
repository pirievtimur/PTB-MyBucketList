//
//  MBLBucketListItemTableViewCell.h
//  BucketList
//
//  Created by Timur Piriev on 10/26/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBLBucketListItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *itemTitle;
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end
