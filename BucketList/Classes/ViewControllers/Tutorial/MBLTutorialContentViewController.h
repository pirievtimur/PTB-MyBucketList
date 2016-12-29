//
//  MBLTutorialContentViewController.h
//  BucketList
//
//  Created by Timur Piriev on 10/16/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBLTutorialContentViewController : UIViewController

@property (assign, nonatomic) NSInteger index;
@property NSString *backImageFile;
@property NSString *iconImageFile;
@property NSString *titleText;
@property (assign, nonatomic) Boolean lastPage;

@property (weak, nonatomic) IBOutlet UIImageView *tutorialIcon;
@property (weak, nonatomic) IBOutlet UILabel *tutorialLabel;
@property (weak, nonatomic) IBOutlet UIButton *tutorialButton;

@end
