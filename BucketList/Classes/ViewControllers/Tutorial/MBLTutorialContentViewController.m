//
//  MBLTutorialContentViewController.m
//  BucketList
//
//  Created by Timur Piriev on 10/16/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import "MBLTutorialContentViewController.h"
#import "UIColor+MBLAdditions.h"

@interface MBLTutorialContentViewController ()

@end

@implementation MBLTutorialContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tutorialIcon.image = [UIImage imageNamed:self.iconImageFile];
    self.tutorialLabel.text = self.titleText;
    
    if (self.lastPage == true) {
        self.tutorialLabel.hidden = true;
        self.tutorialButton.hidden = false;
        
        [self.tutorialButton layer].cornerRadius = 5.0f;
        [[self.tutorialButton layer] setBorderWidth:1.0f];
        [[self.tutorialButton layer] setBorderColor:[UIColor colorForTutorialBorder].CGColor];
    } else {
        self.tutorialLabel.hidden = false;
        self.tutorialButton.hidden = true;
    }
}

- (IBAction)animateTutorialIcon:(id)sender {
    [UIView animateWithDuration:1 delay:0 options: UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.tutorialIcon setFrame:CGRectMake(self.tutorialIcon.frame.origin.x, -self.view.frame.size.height, self.tutorialIcon.frame.size.width, self.tutorialIcon.frame.size.height)];
        self.tutorialButton.alpha = 0;
    } completion:^(BOOL result) {
        [self dismissViewControllerAnimated:true completion:nil];
    }];
}

@end
